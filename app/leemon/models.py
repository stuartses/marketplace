from django.db import models
from django.utils import timezone


class Category(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "category"


class Product(models.Model):
    id_category = models.ForeignKey(Category, on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    description = models.TextField()
    value = models.IntegerField(default=0)
    image_url = models.CharField(max_length=200, blank=True)
    id_discount = models.IntegerField(default=0)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "product"


class Image(models.Model):
    url = models.CharField(max_length=200)

    class Meta:
        db_table = "image"


class Customers(models.Model):
    name = models.CharField(max_length=200)
    city = models.CharField(max_length=20)
    email = models.CharField(max_length=100)
    nit = models.CharField(max_length=10)
    card_number = models.CharField(max_length=20)
    card_exp = models.CharField(max_length=10)
    address = models.CharField(max_length=200)
    id_image = models.IntegerField(default=0)
    text_image = models.TextField(default='None')

    def __str__(self):
        return self.name

    class Meta:
        db_table = "customers"


class Purchases(models.Model):
    id_customer = models.ForeignKey(Customers, on_delete=models.CASCADE)
    products = models.TextField() # JSON data
    date = models.DateTimeField(default=timezone.now)

    class Meta:
        db_table = "purchases"
