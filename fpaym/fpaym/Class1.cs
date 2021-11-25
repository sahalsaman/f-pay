using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace VottingClient
{
    class Class1
    {


        MySqlConnection con = new MySqlConnection(@"server=localhost;database=fpay;username=root;password=''");

        public void execute(MySqlCommand cmd)
        {
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();

            }
            catch
            {

            }
            finally
            {
                con.Close();
            }
        }

        public DataTable get_data(MySqlCommand cmd)
        {
            cmd.Connection = con;
            MySqlDataAdapter da = new MySqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds.Tables[0];

        }

        public int max_id(MySqlCommand cmd)
        {
            int i = 0;
            cmd.Connection = con;
            try
            {
                con.Open();
                i = Convert.ToInt32(cmd.ExecuteScalar()) + 1;


            }
            catch
            {
                i = 1;
            }
            con.Close();
            return i;
        }


    }
}
