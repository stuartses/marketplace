# Generated by Django 3.1 on 2020-08-25 16:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('leemon', '0007_auto_20200825_1608'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customers',
            name='card_number',
            field=models.CharField(max_length=10),
        ),
        migrations.AlterField(
            model_name='customers',
            name='nit',
            field=models.CharField(max_length=10),
        ),
        migrations.AlterField(
            model_name='product',
            name='value',
            field=models.CharField(max_length=10),
        ),
    ]
