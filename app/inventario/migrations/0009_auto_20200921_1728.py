# Generated by Django 3.1.1 on 2020-09-21 22:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('inventario', '0008_remove_auto_bastidor'),
    ]

    operations = [
        migrations.AlterField(
            model_name='equipamiento',
            name='auto',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='inventario.auto'),
        ),
    ]
