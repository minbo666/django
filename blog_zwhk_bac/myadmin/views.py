#--*coding:utf-8*--
from myblog.models import *
from myadmin.models import *
from myadmin import utils, image_processing
from django.conf import settings
from myadmin.forms import UserCreationForm
from django.contrib.auth.hashers import make_password, check_password
from django.shortcuts import render,HttpResponseRedirect,get_object_or_404
from django.views.generic import View, ListView
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse, HttpResponse, Http404
from django.core.mail import send_mail
from django.core.exceptions import PermissionDenied
from django.contrib import auth
from datetime import datetime 
import os, logging
from django.core.files.storage import default_storage

logger = logging.getLogger(__name__)

# 处理用户增删改查登录注销

class UserControl(View):

	def get(self, request, *args, **kwargs):
		raise Http404

	def post(self, request, *args, **kwargs):
		slug = self.kwargs.get('slug')
		if slug == 'login':
			return self.login(request)
		elif slug == 'logout':
			return self.logout(request)
		elif slug == 'create':
			return self.create(request)
		elif slug == 'update':
			return self.update(request)
		elif slug == 'delete':
			return self.delete(request)
		raise PermissionDenied


	def login(self, request):
		username = request.POST.get("username", "")
		password = request.POST.get("password", "")
		user = auth.authenticate(username=username, password=password)

		errors = []

		if user is not None:
			auth.login(request, user)
		else:
			errors.append(u"用户名或者密码不正确!")

		mydict = {"errors": errors}
		return JsonResponse(mydict)

	def logout(self, request):
		if not request.user.is_authenticated():
			logger.error(u'[UserControl]用户未登陆')
			raise PermissionDenied
		else:
			auth.logout(request)
			return HttpResponse('OK')

	def create(self,request):
		form = UserCreationForm(request.POST)
		errors = []
		if form.is_valid():
			new_user = form.save()
		else:
			for k, v in form.errors.items():
				errors.append(v.as_text())
		mydict = {"errors": errors}
		return JsonResponse(mydict)
		
	def update(self,request):
		uid = int(request.POST.get("uid",""))
		nickname = request.POST.get("nickname","")
		desc = request.POST.get("desc","")
		passwd1 = request.POST.get("password1","")
		passwd2 = request.POST.get("password2","")
		errors = []
		if request.user.id == uid or request.user.id == 1:
			try:
				this_user = MyBlogUser.objects.get(pk=uid)
				this_user.nickname = nickname
				this_user.desc = desc
				if passwd1 and passwd2 and passwd1 == passwd2:
					this_user.password = make_password(passwd2, None, 'pbkdf2_sha256')
				elif passwd1 and passwd2:
					errors.append("*密码不一致")
				elif passwd1 and not passwd2:
					errors.append("*未填写确认密码")
				elif passwd2 and not passwd1:
					errors.append("*未填写密码")
				this_user.save()
			except MyBlogUser.DoesNotExist:
				errors.append("*此用户不存在")
		mydict = {"errors": errors}
		return JsonResponse(mydict)

	def delete(self,request):
		uid = request.POST.get("uid","")
		errors = []
		try:
			this_user = MyBlogUser.objects.get(pk=uid)
			this_user.delete()
		except MyBlogUser.DoesNotExist:
			errors.append("*此用户不存在")
		mydict = {"errors": errors}
		return JsonResponse(mydict)

# 处理博客增删改查

class Blog_Manage(View):

	def get(self, request, *args, **kwargs):
		if not request.user.is_authenticated():
			return HttpResponseRedirect("/admin/")
		slug = self.kwargs.get('slug')
		if slug == "delete":
			return self.delete(request)
		raise PermissionDenied

	def post(self, request, *args, **kwargs):
		slug = self.kwargs.get('slug')
		if slug == 'update':
			return self.update(request)
		elif slug == "create":
			return self.create(request)
		raise PermissionDenied

	def create(self, request):
		title = request.POST.get("title","")
		author = request.POST.get("author","")
		content = request.POST.get("content","")
		category = request.POST.get("category","")
		try:
			cate_pk = Category.objects.get(name=category)
			blog = Post.objects.create(title=title, author=author, category=cate_pk, content=content)
		except Category.DoesNotExist:
			new_cate = Category.objects.create(name=category)
			blog = Post.objects.create(title=title, author=author, category=new_cate, content=content)
		blog.save()
		return HttpResponseRedirect("/admin/blog/")

	def update(self, request):
		pk = request.POST.get("id","")
		blog = Post.objects.get(pk=pk)
		title = request.POST.get("title","")
		author = request.POST.get("author","")
		content = request.POST.get("content","")
		category = request.POST.get("category","")
		try:
			cate_pk = Category.objects.get(name=category)
		except Category.DoesNotExist:
			new_cate = Category.objects.create(name=category)
			cate_pk = new_cate.pk
		blog.title = title
		blog.author = author
		blog.category_id = cate_pk
		blog.content = content
		blog.save()
		return HttpResponseRedirect("/admin/blog/")

	def delete(self, request):
		pk = self.kwargs.get('pk')
		Post.objects.get(pk=pk).delete()
		return HttpResponseRedirect("/admin/blog/")



class BaseMixin(object):

	def get(self, request, *args, **kwargs):
		if not request.user.is_authenticated():
			return HttpResponseRedirect("/admin/")
		else:
			return super(BaseMixin, self).get(request, *args, **kwargs)

	def get_context_data(self, **kwargs):
		context = super(BaseMixin, self).get_context_data(**kwargs)
		try:
			context['website_title'] = settings.WEBSITE_TITLE
		except Exception as e:
			logger.error(u'[BaseMixin]加载基本信息出错')
		return context


class User_List(BaseMixin,ListView):
	model = MyBlogUser
	template_name = 'myadmin/user.html'
	context_object_name = 'users'

	def get_queryset(self):
		users = MyBlogUser.objects.order_by('-pk')
		return users

	def get_context_data(self, **kwargs):
		return super(User_List, self).get_context_data(**kwargs)

class User_Edit(BaseMixin,ListView):
	model = MyBlogUser
	template_name = 'myadmin/user_add.html'
	context_object_name = 'this_user'

	def get_queryset(self):
		this_user = get_object_or_404(MyBlogUser, pk=self.kwargs.get('pk'))
		return this_user

	def get_context_data(self, **kwargs):
		context = super(User_Edit, self).get_context_data(**kwargs)
		context['operate'] = 'update'
		return context

class User_Add(BaseMixin,ListView):
	model = MyBlogUser
	template_name = 'myadmin/user_add.html'
	context_object_name = 'this_user'

	def get_context_data(self, **kwargs):
		context = super(User_Add, self).get_context_data(**kwargs)
		context['operate'] = 'create'
		return context



class Blog_List(BaseMixin,ListView):
	model = Post
	template_name = 'myadmin/blog.html'
	context_object_name = 'blogs'

	def get_queryset(self):
		blogs = Post.objects.order_by('-pk')
		return blogs

	def get_context_data(self, **kwargs):
		return super(Blog_List, self).get_context_data(**kwargs)

class Blog_Edit(BaseMixin,ListView):
	model = Post
	template_name = 'myadmin/blog_add.html'
	context_object_name = 'blog'

	def get_queryset(self):
		blog = get_object_or_404(Post, pk=self.kwargs.get('pk'))
		return blog

	def get_context_data(self, **kwargs):
		context = super(Blog_Edit, self).get_context_data(**kwargs)
		context['operate'] = 'update'
		return context

class Blog_Add(BaseMixin,ListView):
	model = Post
	template_name = 'myadmin/blog_add.html'
	context_object_name = 'blog'

	def get_context_data(self, **kwargs):
		context = super(Blog_Add, self).get_context_data(**kwargs)
		context['operate'] = 'create'
		return context



# 获取图片路径函数

def get_upload_filename(upload_name, user):
	if getattr(settings, 'SIMDITOR_RESTRICT_BY_USER', False):
		user_path = user.get_username()
	else:
		user_path = ''
	date_path = datetime.now().strftime('%Y/%m/%d')
	upload_path = os.path.join(
		settings.SIMDITOR_UPLOAD_PATH, user_path, date_path)
	if getattr(settings, 'SIMDITOR_UPLOAD_SLUGIFY_FILENAME', True):
		upload_name = utils.slugify_filename(upload_name)
	return default_storage.get_available_name(os.path.join(upload_path, upload_name))

# 图片上传视图类

class MyUpLoad(View):

	@staticmethod
	def _save_file(request, uploaded_file):
		filename = get_upload_filename(uploaded_file.name, request.user)
		saved_path = default_storage.save(filename, uploaded_file)
		return saved_path

	def post(self, request, **kwargs):
		upload_config = settings.SIMDITOR_CONFIGS.get('upload', {'fileKey': 'upload'})
		filekey = upload_config.get('fileKey', 'upload')
		uploaded_file = request.FILES.get(filekey, 'upload')
		backend = image_processing.get_backend()
		if not getattr(settings, 'SIMDITOR_ALLOW_NONIMAGE_FILES', True):
			try:
				backend.image_verify(uploaded_file)
			except utils.NotAnImageException:
				retdata = {'file_path': '', 'success': False,'msg': '图片格式错误!'}
				return JsonResponse(retdata)
		saved_path = self._save_file(request, uploaded_file)
		url = utils.get_media_url(saved_path)
		retdata = {'file_path': url, 'success': True,'msg': '上传成功!'}
		return JsonResponse(retdata)

UPLOAD = csrf_exempt(MyUpLoad.as_view())
