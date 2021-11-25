from django.db import models

# Create your models here.
class CustomerBank(models.Model):
    full_name = models.CharField(max_length=25)
    mob_no = models.CharField(max_length=10)
    address = models.CharField(max_length=40)
    acc_no = models.CharField(max_length=30)
    upi_code = models.CharField(max_length=25)
    balance = models.DecimalField(max_digits=15, decimal_places=0)
    bank_id = models.IntegerField()
    user_id = models.CharField(max_length=10)
    status = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'customer_bank'




class BankReg(models.Model):
    bank_name = models.CharField(max_length=35)
    ifsc_code = models.CharField(db_column='Ifsc_code', max_length=11)  # Field name made lowercase.
    adress = models.CharField(max_length=40)
    phone_no = models.CharField(db_column='Phone_no', max_length=15)  # Field name made lowercase.
    e_mail = models.CharField(db_column='E-mail', max_length=25)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'bank_reg'


