from django.urls import path
from . import views

urlpatterns = [
    path('index/', views.index, name='index'),
    path('register/', views.register, name='register'),
    path('content/', views.content, name='content'),
    path('step/', views.step, name='step'),
    path('result1/', views.result1, name='result1'),
    path('result2/', views.result2, name='result2'),
    path('result3/', views.result3, name='result3'),
    path('result4/', views.result4, name='result4'),
    path('result5/', views.result5, name='result5'),
    path('user_logout/', views.user_logout, name='user_logout'),
]
