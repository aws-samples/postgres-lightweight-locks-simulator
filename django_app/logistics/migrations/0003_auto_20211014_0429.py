# Generated by Django 3.2.8 on 2021-10-14 04:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('logistics', '0002_auto_20211013_1910'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='customer',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='logistics.customer'),
        ),
        migrations.AddField(
            model_name='order',
            name='merchant',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='logistics.merchant'),
        ),
    ]