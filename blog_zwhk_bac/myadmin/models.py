# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import AbstractUser


class MyBlogUser(AbstractUser):
	nickname = models.CharField(max_length=50,blank=True,null=True,verbose_name=u'昵称')
	img = models.CharField(max_length=200, default='/static/images/default.jpg',verbose_name=u'头像地址')
	desc = models.CharField(max_length=200, blank=True,null=True,verbose_name=u'备注')