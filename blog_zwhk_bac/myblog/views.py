# -*- coding:UTF-8 -*-
from django.shortcuts import render, get_object_or_404
from django.db.models import Count
from django.db.models import Q
from django.views.generic.dates import MonthArchiveView
from django.views.generic import ListView, DetailView
from django.conf import settings
from myblog.models import *
from comments.models import *
from comments.forms import *
import logging
logger = logging.getLogger(__name__)

class BaseMixin(object):
	def get_context_data(self, **kwargs):
		context = super(BaseMixin, self).get_context_data(**kwargs)
		try:
			context['hot_article_list'] = Post.objects.order_by('-views')[0:5]
			context['year_mouth_list'] = Post.objects.dates('pub_date', 'month', order='DESC')
			context['category_list'] = Category.objects.annotate(article_num=Count('post')).filter(article_num__gt=0)
			context['website_title'] = settings.WEBSITE_TITLE
			context['website_desc'] = settings.WEBSITE_DESC
		except Exception as e:
			logger.error(u'[BaseMixin]加载基本信息出错')
		return context

class IndexView(BaseMixin, ListView):
	template_name = 'index.html'
	context_object_name = 'article_list'
	paginate_by = settings.PAGE_NUM

	def get_context_data(self, **kwargs):
		return super(IndexView, self).get_context_data(**kwargs)

	def get_queryset(self):
		article_list = Post.objects.order_by('-pk')
		return article_list


class BlogDetailView(BaseMixin, DetailView):
	model = Post
	template_name = 'blog.html'
	context_object_name = 'article'

	def get(self, request, *args, **kwargs):
		response = super(BlogDetailView, self).get(request, *args, **kwargs)
		self.object.increase_views()
		return response

	def get_context_data(self, **kwargs):
		form = CommentForm()
		context = super(BlogDetailView, self).get_context_data(**kwargs)
		comment_list = self.object.comment_set.order_by('-pk')
		context.update({
            'form': form,
            'comment_list': comment_list
        })
		cate = Category.objects.get(name=context['article'].category)
		context['category_pk'] = cate.pk
		next_blog = Post.objects.filter(id__gt=self.object.id)[:1]
		pre_blog = Post.objects.filter(id__lt=self.object.id).order_by('-pk')[:1]
		for item in next_blog:
			context['next_blog'] = item
		for item in pre_blog:
			context['pre_blog'] = item
		return context


class ArchivesView(BaseMixin,ListView):
	model = Post
	template_name = 'index.html'
	context_object_name = 'article_list'
	paginate_by = settings.PAGE_NUM

	def get_queryset(self):
		year = self.kwargs.get('year')
		month = self.kwargs.get('month')
		context = super(ArchivesView, self).get_queryset().filter(pub_date__year=year,pub_date__month=month).order_by('-pk')
		return context
	def get_context_data(self, **kwargs):
		context = super(ArchivesView, self).get_context_data(**kwargs)
		if context:
			context['null_queryset'] = True
		else:
			context['null_queryset'] = False
		return context


class CategoryView(BaseMixin,ListView):
	model = Post
	template_name = 'index.html'
	context_object_name = 'article_list'
	paginate_by = settings.PAGE_NUM

	def get_queryset(self):
		pk = self.kwargs.get('pk')
		try:
			cate = Category.objects.get(pk=pk)
			return super(CategoryView, self).get_queryset().filter(category=cate).order_by('-pk')
		except Category.DoesNotExist:
			return super(CategoryView, self).get_queryset()
		

class SearchView(BaseMixin,ListView):
	model = Post
	template_name = 'index.html'
	context_object_name = 'article_list'

	def get_queryset(self):
		get_args = self.request.GET.get('q')
		article_list = Post.objects.filter(Q(title__icontains=get_args) | Q(content__icontains=get_args))
		return article_list

	def get_context_data(self, **kwargs):
		context = super(SearchView, self).get_context_data(**kwargs)
		if context:
			context['null_queryset'] = True
		else:
			context['null_queryset'] = False
		return context
