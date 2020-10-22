# Generated by Django 3.1.1 on 2020-09-21 12:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('inventario', '0004_auto'),
    ]

    operations = [
        migrations.CreateModel(
            name='Equipamiento',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.TextField()),
                ('precio', models.DecimalField(decimal_places=2, max_digits=19)),
                ('deSerie', models.BooleanField()),
                ('auto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='inventario.auto')),
            ],
        ),
    ]
