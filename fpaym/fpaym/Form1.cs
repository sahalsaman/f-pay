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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        Class1 db = new Class1();
        MySqlCommand cmd = new MySqlCommand();
       

        private void button1_Click(object sender, EventArgs e)
        {
            if (serialPort1.IsOpen)
                serialPort1.Close();
            serialPort1.PortName = comboBox1.Text;
            try
            {
                serialPort1.Open();
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("Invalid Port");

            }
        }

        string sin = "";
        public delegate void showres();

        public void printres()
        {
            
            textBox1.Text =textBox1.Text +  sin;
            textBox1.Select(textBox1.Text.Length - 1,0);

            //textBox1.SelectionStart = textBox1.Text.Length;
            textBox1.ScrollToCaret();

        }


        private void serialPort1_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            sin = serialPort1.ReadExisting();
            this.Invoke(new showres(printres));

        }

        private void button3_Click(object sender, EventArgs e)
        {
           // byte[] b = new byte[] { 65 };
           //serialPort1.Write(b, 0, 1);
            serialPort1.Write("A");
        }

        private void button2_Click(object sender, EventArgs e)
        {

            
            MySqlCommand cmd11 = new MySqlCommand();
            cmd11.CommandText = "SELECT * FROM `user_bank_details` WHERE `upi_id`='"+textBox5.Text+"' AND pin='"+textBox6.Text+"'";
            DataTable dt1 = db.get_data(cmd11);
            if (dt1.Rows.Count > 0)
            {
                string variable = dt1.Rows[0][3].ToString();
                string variable1 = dt1.Rows[0][5].ToString();

                if (variable == textBox5.Text && variable1 == textBox6.Text)
                {
                    serialPort1.Write(textBox2.Text);
                }
                else
                {
                    MessageBox.Show("UPI id or PIN wrong");
                }
            }
            else
            {
                MessageBox.Show("UPI id or PIN wrong");
            }

           
        }
             

        
        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

    
    }
}
