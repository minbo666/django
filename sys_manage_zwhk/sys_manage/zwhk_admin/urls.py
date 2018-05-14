#-*- coding:utf-8 -*-

from django.conf.urls import url
from django.views.generic import TemplateView

urlpatterns = [
	url(r'^user_manage/$', TemplateView.as_view(template_name="zwhk_admin/user_manager.html"), name='user_manage'),
	url(r'^$', TemplateView.as_view(template_name="zwhk_admin/dashboard.html"), name='dashboard'),
	url(r'^profile/$', TemplateView.as_view(template_name="zwhk_admin/user_profile.html"), name='user_profile'),
	url(r'^change_user_info/$', TemplateView.as_view(template_name="zwhk_admin/change_user_info.html"), name='change_user_info'),
	url(r'^form/$', TemplateView.as_view(template_name="zwhk_admin/form/add.html"), name='form'),
]