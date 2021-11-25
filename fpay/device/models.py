from django.db import models

# Create your models here.


class DeviceReg(models.Model):
    did = models.AutoField(primary_key=True)
    device_name = models.CharField(max_length=20)
    model_no = models.CharField(max_length=15)
    serial_no = models.CharField(max_length=15)
    status = models.TextField()

    class Meta:
        managed = False
        db_table = 'device_reg'


class DeviceRequest(models.Model):
    shop_id = models.IntegerField()
    shop_name = models.CharField(max_length=25)
    d_id = models.IntegerField()
    status = models.TextField()

    class Meta:
        managed = False
        db_table = 'device_request'



class ShopReg(models.Model):
    shop_id = models.AutoField(primary_key=True)
    shop_name = models.CharField(max_length=20)
    address = models.TextField()
    shop_owner_name = models.CharField(max_length=20)
    mob_no = models.CharField(max_length=10)
    upi_code = models.CharField(max_length=20)
    bank_id = models.CharField(max_length=15)

    class Meta:
        managed = False
        db_table = 'shop_reg'


class UserReg(models.Model):
    user_id = models.AutoField(primary_key=True)
    user_name = models.CharField(max_length=20)
    mob_no = models.CharField(max_length=10)
    address = models.TextField()
    log_id = models.IntegerField()
    status = models.CharField(max_length=15)
    fingerprint = models.CharField(db_column='Fingerprint', max_length=50)  # Field name made lowercase.
    pin = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'user_reg'
