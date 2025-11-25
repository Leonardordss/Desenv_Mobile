from django.urls import path
from .views import RegisterView, LoginView, MenuItemList

urlpatterns = [
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('menu/', MenuItemList.as_view(), name='menu-list'),
]
