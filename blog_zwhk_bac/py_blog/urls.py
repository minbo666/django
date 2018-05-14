#!--*coding:utf-8*--
from django.conf.urls import include, url
from django.contrib import admin
from django.contrib.staticfiles.urls import static
from django.conf import settings

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^simditor/', include('simditor.urls')),
    # url(r'^admin/', include('myadmin.url')),
    url(r'', include('myblog.url')),
    url(r'', include('comments.url')),
    url(r'', include('myimage.url')),
]

urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
