# Generated by Django 3.1.1 on 2020-09-21 13:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('inventario', '0005_equipamiento'),
    ]

    operations = [
        migrations.AlterField(
            model_name='equipamiento',
            name='auto',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='inventario.auto'),
        ),
    ]
