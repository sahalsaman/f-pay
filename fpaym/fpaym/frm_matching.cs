using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace VottingClient
{
    public partial class frm_matching : Form
    {

        
        public frm_matching()
        {
            InitializeComponent();
        }

        Class1 db = new Class1();
        MySqlCommand cmd = new MySqlCommand();
        string sin = "";
        string re = "";
        public delegate void showres();

        public void printres()
        {

            textBox1.Text = textBox1.Text + sin;
            textBox1.Select(textBox1.Text.Length - 1, 0);

            //textBox1.SelectionStart = textBox1.Text.Length;
            textBox1.ScrollToCaret();

            if(textBox1.Text.Contains("*"))
            {
                string[] tmp = textBox1.Text.Split('#');
                //MessageBox.Show(tmp[1]);
                re = tmp[1];

                re = re.Replace(@"*", "");
                MessageBox.Show(re);
                textBox1.Clear();


                cmd.CommandText = "SELECT * FROM `user_bank_details` WHERE Finger_id= '" + re.Trim() + "' ";
                DataTable dt = db.get_data(cmd);

                if (dt.Rows.Count > 0)
                {
                    //MessageBox.Show("User Found");

                    textBox4.Text = dt.Rows[0][3].ToString();


                }
                else
                {
                    MessageBox.Show("No User Found, Check USER ID....!");
                }








            }


            ////*1#A$
            //if (textBox1.Text.Contains('$'))
            //{
            //    string vt = textBox1.Text.Substring(1, 3);
            //    label2.Text = vt;
            //    string[] sp = vt.Split('#');
            //    label3.Text = sp[0];
            //    label4.Text = sp[1];
            //    textBox1.Clear();



            //}


        }


        private void frm_matching_Load(object sender, EventArgs e)
        {
            
        }

        private void serialPort1_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            sin = serialPort1.ReadExisting();
            this.Invoke(new showres(printres));
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (serialPort1.IsOpen)
                serialPort1.Close();
            serialPort1.PortName = comboBox1.Text;
            try
            {
                serialPort1.Open();
                serialPort1.Write("B");

            }
            catch (Exception ex)
            {
                MessageBox.Show("Invalid Port");

            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
           
        }

        private void button2_Click(object sender, EventArgs e)
        {
            cmd.CommandText = "SELECT * FROM `user_bank_details` WHERE Finger_id= '" + textBox2.Text + "' ";
            DataTable dt = db.get_data(cmd);

            if (dt.Rows.Count > 0)
            {
                MessageBox.Show("User Found");


            }
            else
            {
                MessageBox.Show("No User Found, Check USER ID....!");
            }




        }

        private void button4_Click(object sender, EventArgs e)
        {


            MySqlCommand cmd11 = new MySqlCommand();
            cmd11.CommandText = "select * from user_bank_details where upi_id='" + textBox4.Text + "'";
            DataTable dt1 = db.get_data(cmd11);
            string variable = dt1.Rows[0][5].ToString(); 

            if(variable == textBox2.Text)
            {




            MySqlCommand cmd = new MySqlCommand();
            cmd.CommandText = "select * from customer_bank where upi_code='" + textBox4.Text + "'";
            DataTable dt = db.get_data(cmd);
            //
          // private void textBox2_TextChanged(object sender, EventArgs e)
          // {
          //     if(Password match)
          // {

                
                    

            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (decimal.Parse(dr[6].ToString()) > decimal.Parse(textBox3.Text))
                {
                    MySqlCommand cmd1 = new MySqlCommand();
                    cmd1.CommandText = "update customer_bank set balance=balance-" + textBox3.Text + " where  upi_code='" + textBox4.Text + "'";
                    db.execute(cmd1);

                    cmd1.CommandText = "update shop_reg set amount=amount+" + textBox3.Text + " where  SHOP_id=1";
                    db.execute(cmd1);

                    cmd1.CommandText = "INSERT INTO `payment`(`user_id`, `shop_id`, `user_name`, `amount`, `status`) VALUES ('" + re + "','1','" + textBox4.Text + "','" + textBox3.Text + "','Paid')";
                    db.execute(cmd1);

                    textBox3.Clear();
                    textBox4.Clear();

                    MessageBox.Show("Transaction Completed Successfully");

                }
                else
                {
                    MessageBox.Show("Your transaction failed, Please Try again");
                }


            }

         }
         else
         {
         MessageBox.Show("Your PIN is Wrong");
         }
        
        }

        

        

      
      

       

        

        

      

       
    }
}
