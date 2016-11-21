using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace loly_hub_0._2
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            InsertInfo();
            Console.WriteLine("Registered Successfully");
            txtUname.Text = "";
            txtremail.Value = "";
            txtMobile.Text = "";
            txtLname.Value = "";
            txtFname.Value = "";
            txtEmail.Value = "";
            Response.Redirect("AddProgram.aspx");
        }
        public static string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            //sets the connection string from your web config file "ConnString" is the name of your Connection String

        }

        private void InsertInfo()
        {
            
            SqlConnection con = new SqlConnection(GetConnectionString());
          
            string MiddleName = "ddd";
            string Country = "ksa";
            string City = "Riyadh";
            string state = "Riyadh";
            string Sql = "insert into LH_User(FirstName,LastName,Password,Email,Mobile,Create_Date,Update_Date,UserName,MiddleName,Country,City,State) values(@val1,@val2,@val3,@val4,@val5,@val6,@val7,@val8,'ddd','ksa','Riyadh','Riyadh')";

            try
            {
               // string activationCode = Guid.NewGuid().ToString();
               
                con.Open();
                SqlCommand cmd = new SqlCommand(Sql, con);
            //    cmd.Parameters.AddWithValue("@val1", txtusername.Text);
                cmd.Parameters.AddWithValue("@val1", txtFname.Value);
             //   cmd.Parameters.AddWithValue("@val3", txtmname.Text);
                cmd.Parameters.AddWithValue("@val2", txtLname.Value);
                cmd.Parameters.AddWithValue("@val3", txtPswd.Text);
                cmd.Parameters.AddWithValue("@val4", txtEmail.Value);
            //    cmd.Parameters.AddWithValue("@val7", ddlCountries.SelectedValue);
            //    cmd.Parameters.AddWithValue("@val8", ddlCities.SelectedValue);
               // cmd.Parameters.AddWithValue("@val9", txtstate.Text);
                cmd.Parameters.AddWithValue("@val5", txtMobile.Text);
               // cmd.Parameters.AddWithValue("@val12", txtaddress.Text);
              //  cmd.Parameters.AddWithValue("@val13", txtzipcode.Text);

                cmd.Parameters.AddWithValue("@val6", DateTime.Now);
                cmd.Parameters.AddWithValue("@val7", DateTime.Now);

                cmd.Parameters.AddWithValue("@val8",txtUname.Text);
              //  cmd.Parameters.AddWithValue("@val17", activationCode);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                //string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority +
                // Request.ApplicationPath.TrimEnd('/') + "/";
                //sendEmail(txtemail.Text, baseUrl + "/activation.aspx?code=" + activationCode);
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                con.Close();
                Session["UserName"] = txtUname.Text;
                
            }
            
        }
    }
}