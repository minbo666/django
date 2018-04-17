#--*coding:utf-8*--
from django.db import models
from django.core.urlresolvers import reverse
from myadmin.models import MyBlogUser
from simditor.fields import RichTextField
#from ckeditor.fields import RichTextField
# Create your models here.
class Category(models.Model):

	name = models.CharField(max_length=100,verbose_name='类型')

	class Meta:
		verbose_name = '分类'
		verbose_name_plural = '分类'

	def __unicode__(self):
		return self.name

class Tag(models.Model):

	name = models.CharField(max_length=100)

	class Meta:
		verbose_name = '标签'
		verbose_name_plural = '标签'

	def __unicode__(self):
		return self.name

class Post(models.Model):
	title = models.CharField(max_length=50, verbose_name ='标题')
	author = models.CharField(max_length=50, verbose_name ='作者')
	pub_date = models.DateTimeField(auto_now_add=True, verbose_name ='发布时间')
	update_date = models.DateTimeField(auto_now=True, verbose_name = '更新时间')
	views = models.IntegerField(null=True,default=0, verbose_name = '浏览量')
	category = models.ForeignKey(Category,verbose_name = '分类')
	content = RichTextField()

	class Meta:
		verbose_name = '文章'
		verbose_name_plural = '文章'

	def __unicode__(self):
		return self.title

	def increase_views(self):
		self.views += 1
		self.save(update_fields=['views'])

	def save(self, *args, **kwargs):
		super(Post, self).save(*args, **kwargs)

	def get_absolute_url(self):
		return reverse('article', kwargs={'pk': self.pk})