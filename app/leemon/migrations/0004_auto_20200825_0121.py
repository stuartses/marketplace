# Generated by Django 3.1 on 2020-08-25 01:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('leemon', '0003_auto_20200825_0116'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='url',
            field=models.CharField(default='None', max_length=200),
        ),
        migrations.AlterField(
            model_name='product',
            name='id_discount',
            field=models.IntegerField(default='None'),
        ),
        migrations.AlterField(
            model_name='product',
            name='url',
            field=models.CharField(default='None', max_length=200),
        ),
    ]
