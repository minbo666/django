#--*coding:utf-8*--
from django.conf.urls import include, url
from django.views.generic import TemplateView
from myimage.views import *

app_name = 'myimage'

urlpatterns = [
    url(r'^upload_img/$', upload_img, name='upload_img'),
    url(r'^upload/$', TemplateView.as_view(template_name="upload.html"), name='upload_img'),
]
