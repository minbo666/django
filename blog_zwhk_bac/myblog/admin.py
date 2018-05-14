#-*-coding:utf-8-*-
from django.contrib import admin
from myblog.models import *
# Register your models here.
class PostAdmin(admin.ModelAdmin):
    list_display = ['title', 'author', 'pub_date', 'update_date', 'category', 'views']
    list_filter = ['pub_date']
    search_fields = ['title']

class CateAdmin(admin.ModelAdmin):
    list_display = ['name']


admin.site.register(Post,PostAdmin)
admin.site.register(Category,CateAdmin)
admin.site.register(Tag)