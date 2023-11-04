# Generated by Django 4.2.6 on 2023-10-09 02:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Project',
            fields=[
                ('ProjectID', models.AutoField(primary_key=True, serialize=False)),
                ('ProjectName', models.CharField(max_length=255)),
                ('StartDate', models.DateField()),
                ('Deadline', models.DateField()),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.user')),
            ],
        ),
    ]