from django.contrib import admin
from myadmin.models import MyBlogUser
from django.contrib.auth.models import Group
# Register your models here.
class Blog_User_Admin(admin.ModelAdmin):
    list_display = ['username', 'nickname', 'email', 'desc']
    search_fields = ['username']

admin.site.unregister(Group)
admin.site.register(MyBlogUser,Blog_User_Admin)

