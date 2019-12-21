# Generated by Django 2.2 on 2019-12-21 09:50

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('comment', models.TextField(verbose_name='评论')),
                ('time', models.DateTimeField(auto_now_add=True, verbose_name='时间')),
                ('author', models.TextField(max_length=10, verbose_name='作者')),
            ],
            options={
                'verbose_name': '评论详情',
                'verbose_name_plural': '评论详情',
            },
        ),
        migrations.CreateModel(
            name='Response',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('reviewers', models.TextField(max_length=10, verbose_name='评论者')),
                ('response_time', models.DateTimeField(auto_now_add=True, verbose_name='时间')),
                ('response', models.TextField(verbose_name='回复')),
            ],
        ),
    ]
