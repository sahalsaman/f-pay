from django.db import models

# Create your models here.


class UserReg(models.Model):
    user_id = models.AutoField(primary_key=True)
    user_name = models.CharField(max_length=20)
    mob_no = models.CharField(max_length=10)
    address = models.TextField()
    status = models.CharField(max_length=15)
    fingerprint = models.CharField(db_column='Fingerprint', max_length=50)  # Field name made lowercase.
    pin = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'user_reg'


class UserBankDetails(models.Model):
    user_id = models.IntegerField()
    bank_ifsc = models.CharField(max_length=25)
    upi_id = models.CharField(max_length=35)
    pin = models.CharField(max_length=10)
    status = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'user_bank_details'


class Payment(models.Model):
    user_id = models.IntegerField(unique=True)
    shop_id = models.IntegerField()
    user_name = models.CharField(max_length=25)
    amount = models.CharField(max_length=20)
    status = models.TextField()

    class Meta:
        managed = False
        db_table = 'payment'
