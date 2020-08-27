from django.urls import path

from . import views

app_name = 'leemon'
urlpatterns = [
    path('', views.index, name='index'),
    path('<int:id_cat>/', views.products, name='products'),
    path('basket/', views.basket, name='basket'),
    path('new_user/', views.new_user, name='new_user'),
    path('register_user/', views.register_user, name='register_user'),
    path('save_image/', views.save_image, name='save_image'),
    path('purchase/', views.purchase, name='purchase'),
]
