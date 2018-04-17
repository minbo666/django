#--* coding:utf-8 *--
from django.shortcuts import render, get_object_or_404, redirect, HttpResponseRedirect
from myblog.models import *
from comments.models import Comment
from .forms import CommentForm
from django.views.generic.edit import FormView

class CommentPostView(FormView):
    form_class = CommentForm
    template_name = 'blog.html'

    def form_valid(self, form):
        post = get_object_or_404(Post, pk=self.kwargs.get('post_id'))
        comment = form.save(commit=False)
        comment.post = post
        comment.save()
        self.success_url = post.get_absolute_url()
        return HttpResponseRedirect(self.success_url)

    def form_invalid(self, form):
        post = get_object_or_404(Post, pk=self.kwargs.get('post_id'))
        return render(self.request, 'blog.html', {
            'form': form,
            'article': post,
            'comment_list': Post.objects.all(),
        })