# Generated by Django 3.1 on 2020-08-25 16:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('leemon', '0011_auto_20200825_1620'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customers',
            name='id_image',
            field=models.IntegerField(default=0),
        ),
    ]