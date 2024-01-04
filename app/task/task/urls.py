from django.urls import path 
from task import views 

urlpatterns = [
  path('hello-view/', views.HelloApiView.as_view())
]