from django.contrib import admin
from .models import Comment
from django.contrib.auth.models import Group
# Register your models here.


class Comment_Admin(admin.ModelAdmin):
    list_display = ('time', 'comment', 'author')
    list_filter = ('time',)
admin.site.register(Comment, Comment_Admin)
admin.site.unregister(Group)