from django.contrib import admin
from .models import Score
from django.contrib.auth.models import Group
# Register your models here.


class Score_Admin(admin.ModelAdmin):
    list_display = ('name', 'number', 'score')
    list_filter = ('score',)
    search_fields = ('name', 'number', 'score')
admin.site.register(Score, Score_Admin)
