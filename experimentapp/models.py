from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.


class RUser(AbstractUser):
    pass


class Score(models.Model):
    name = models.TextField(max_length=10, verbose_name='姓名')
    number = models.CharField(max_length=50, verbose_name='学号')
    score = models.CharField(max_length=10, verbose_name='成绩')
    class Meta:
        verbose_name = '成绩详情'
        verbose_name_plural = verbose_name

class Post(models.Model):
    views = models.CharField(max_length=50,  default=0, verbose_name='浏览量')

