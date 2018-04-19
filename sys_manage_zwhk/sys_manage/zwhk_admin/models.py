# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import AbstractUser

class Zwhk_User(AbstractUser):
	nickname = models.CharField(max_length=50,blank=True,null=True,verbose_name=u'昵称')
	img = models.CharField(max_length=200, default='/static/dist/img/default.png',verbose_name=u'头像地址')
	notes = models.CharField(max_length=200, blank=True,null=True,verbose_name=u'备注')
	experience = models.CharField(max_length=500, blank=True,null=True,verbose_name=u'经历')
	location = models.CharField(max_length=20, blank=True,null=True,verbose_name=u'地址')
	skills = models.CharField(max_length=500,blank=True,null=True,verbose_name=u'技能名称')
	
class Activity(models.Model):
	acti_name = models.CharField(max_length=50,verbose_name=u'活动名称')
	acti_time = models.DateTimeField(verbose_name=u'活动时间')
	acti_owner = models.ForeignKey(Zwhk_User,related_name='acti',verbose_name=u'所属者')

class Task_Process(models.Model):
	task_name = models.CharField(max_length=50,verbose_name=u'任务名称')
	task_speed = models.IntegerField(null=True,default=0,verbose_name=u'任务进度')
	task_owner = models.ForeignKey(Zwhk_User,related_name='task',verbose_name=u'所属者')