from django.urls import path
from . import views

app_name = 'comments'

urlpatterns = [
    path('comment/', views.comment, name='comment'),
    # path('response/', views.response, name='response'),
]
