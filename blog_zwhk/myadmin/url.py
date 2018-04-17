#--*coding:utf-8*--
from django.conf.urls import include, url
from myadmin.views import *
from django.views.generic import TemplateView
from django.contrib.admin.views.decorators import staff_member_required

app_name = 'myadmin'

urlpatterns = [
        # 管理员登录
        url(r'^$', TemplateView.as_view(template_name="myadmin/login.html"),name='admin_login'),
        
        # 博客管理
        url(r'^blog/$', Blog_List.as_view(), name='blog_list'),
        url(r'^blog/add/$', Blog_Add.as_view(),name='blog_add'),
        url(r'^blog/edit/(?P<pk>[0-9]+)/$', Blog_Edit.as_view(),name='blog_edit'),
        url(r'^blog/operate/(?P<slug>\w+)/(?P<pk>[0-9]+)/$', Blog_Manage.as_view(),name='blog_del'),
        url(r'^blog/operate/(?P<slug>\w+)/$', Blog_Manage.as_view(),name='blog_operate'),
        
        # 用户管理
        url(r'^users/$',User_List.as_view(),name='user_list'),
        url(r'^users/add/$',User_Add.as_view(),name='user_add'),
        url(r'^users/edit/(?P<pk>[0-9]+)/$',User_Edit.as_view(),name='user_edit'),
        url(r'^usercontrol/(?P<slug>\w+)$', UserControl.as_view()),             #处理用户登录

        # 图片上传
        url(r'^upload/$', staff_member_required(UPLOAD)),
]
