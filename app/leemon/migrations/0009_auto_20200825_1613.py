# Generated by Django 3.1 on 2020-08-25 16:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('leemon', '0008_auto_20200825_1612'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='value',
            field=models.IntegerField(default=0),
        ),
    ]
