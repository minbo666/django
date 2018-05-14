from django.conf.urls import url

from comments.views import *

app_name = 'comments'

urlpatterns = [
    url(r'^comment/post/(?P<post_id>[0-9]+)/$', CommentPostView.as_view(), name='post_comment'),
]