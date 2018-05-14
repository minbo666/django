#--*coding:utf-8*--
from django.conf.urls import include, url
from myblog.views import *

app_name = 'myblog'

urlpatterns = [
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^article/(?P<pk>[0-9]+)/$', BlogDetailView.as_view(), name='article'),
    url(r'^archives/(?P<year>[0-9]{4})/(?P<month>[0-9]{1,2})/$', ArchivesView.as_view(), name='archives'),
    url(r'^category/(?P<pk>[0-9]+)/$', CategoryView.as_view(), name='category'),
    url(r'^search/$', SearchView.as_view(), name='search'),
]