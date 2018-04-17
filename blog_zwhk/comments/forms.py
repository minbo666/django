#--*coding:utf-8*--
from django import forms
from .models import Comment


class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['name', 'email', 'url', 'text']
        widgets = {
            'name': forms.TextInput(attrs={
                'class': 'form-control com_input',
                'placeholder': "请输入昵称",
                'required':"昵称不能为空",
            }),
            'email': forms.EmailInput(attrs={
                'class': 'form-control com_input',
                'placeholder': "请输入邮箱",
                'required':"邮箱不能为空"
            }),
            'url': forms.URLInput(attrs={
                'class': 'form-control com_input',
                'placeholder': "请输入网址",
            }),
            'text': forms.Textarea(attrs={
                'class': 'form-control com_input',
                'placeholder': '我来评两句~',
                'rows': 5,
                'style':'max-width:100%',
                'required':"内容不能为空",
            }),
        }
