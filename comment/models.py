from django.contrib.auth.models import User
from django.db import models
# Create your models here.
from experimentapp.models import RUser


class Comment(models.Model):
    comment = models.TextField(verbose_name='评论')
    time = models.DateTimeField(auto_now_add=True, verbose_name='时间')
    author = models.TextField(max_length=10, verbose_name='作者')
    class Meta:
        verbose_name = '评论详情'
        verbose_name_plural = verbose_name

class Response(models.Model):
    reviewers = models.TextField(max_length=10, verbose_name='评论者')
    response_time = models.DateTimeField(auto_now_add=True, verbose_name='时间')
    response = models.TextField(verbose_name='回复')