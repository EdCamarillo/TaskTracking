# Generated by Django 4.2.5 on 2023-12-10 04:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('task', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='task',
            name='Status',
            field=models.CharField(max_length=25),
        ),
    ]
