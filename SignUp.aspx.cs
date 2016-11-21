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
            lbluname.Visible = false;
            lblemail.Visible = false;
            lblmobile.Visible = false;
            activation.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtUname.Text == "" || txtEmail.Value == "" || txtFname.Value == "" || txtLname.Value == "" || txtMobile.Text == "" || txtPswd.Text == "" || txtremail.Value == "" || txtrePswd.Text == "")
            {
                return;
            }
            SqlConnection con1 = new SqlConnection(Login.GetConnectionString());
            SqlCommand cmd1 = new SqlCommand("select UserName from LH_User where UserName = @name", con1);
            con1.Open();
            cmd1.Parameters.AddWithValue("@name",txtUname.Text);
            SqlDataReader reader = cmd1.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            con1.Close();
            int numRows = dt.Rows.Count;
            if (numRows > 0)
            {
                lbluname.Visible = true;
                lbluname.Text = "username exist";
                return;
            }
            SqlConnection con2 = new SqlConnection(Login.GetConnectionString());
            SqlCommand cmd2 = new SqlCommand("select Email from LH_User where Email = '" + txtEmail.Value + "'", con2);
            con2.Open();
            SqlDataReader reader1 = cmd2.ExecuteReader();
            DataTable dt1 = new DataTable();
            dt1.Load(reader1);
            con2.Close();
            int numRows1 = dt1.Rows.Count;
            if (numRows1 > 0)
            {
                lblemail.Visible = true;
                lblemail.Text = "Email already exist";
                return;
            }
            SqlConnection con3 = new SqlConnection(Login.GetConnectionString());
            SqlCommand cmd3 = new SqlCommand("select Mobile from LH_User where Mobile = '" + txtMobile.Text + "'", con3);
            con3.Open();
            SqlDataReader reader2 = cmd3.ExecuteReader();
            DataTable dt2 = new DataTable();
            dt2.Load(reader2);
            con3.Close();
            int numRows2 = dt2.Rows.Count;
            if (numRows2 > 0)
            {
                lblmobile.Visible = true;
                lblmobile.Text = "Mobile number already exist";
                return;
            }
            InsertInfo();
            Console.WriteLine("Registered Successfully");
            txtUname.Text = "";
            txtremail.Value = "";
            txtMobile.Text = "";
            txtLname.Value = "";
            txtFname.Value = "";
            txtEmail.Value = "";
            login.Visible = false;
            activation.Visible = true;
        }
        public static string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            //sets the connection string from your web config file "ConnString" is the name of your Connection String

        }

        private void InsertInfo()
        {
           
           
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
          
            string MiddleName = "ddd";
            string Country = "ksa";
            string City = "Riyadh";
            string state = "Riyadh";
            string Sql = "insert into LH_User(FirstName,LastName,Password,Email,Mobile,Create_Date,Update_Date,UserName,MiddleName,Country,City,State,activationCode) values(@val1,@val2,@val3,@val4,@val5,@val6,@val7,@val8,'ddd','ksa','Riyadh','Riyadh',@activation)";

            try
            {
                 string activationCode = Guid.NewGuid().ToString();
                if (txtUname.Text=="" || txtEmail.Value=="" || txtFname.Value=="" || txtLname.Value=="" || txtMobile.Text=="" || txtPswd.Text=="" || txtremail.Value=="" || txtrePswd.Text=="")
                {
                    Response.Redirect("SignUp.aspx");
                }
              //  string brecordexist = "Username already exist";

                else

                con.Open();
                SqlCommand cmd = new SqlCommand(Sql, con);
                cmd.Parameters.AddWithValue("@val1", txtFname.Value);
                cmd.Parameters.AddWithValue("@val2", txtLname.Value);
                cmd.Parameters.AddWithValue("@val3", txtPswd.Text);
                cmd.Parameters.AddWithValue("@val4", txtEmail.Value);
                cmd.Parameters.AddWithValue("@val5", txtMobile.Text);
                cmd.Parameters.AddWithValue("@val6", DateTime.Now);
                cmd.Parameters.AddWithValue("@val7", DateTime.Now);

                cmd.Parameters.AddWithValue("@val8",txtUname.Text);
               cmd.Parameters.AddWithValue("@activation", activationCode);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();

                string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority +
                 Request.ApplicationPath.TrimEnd('/') + "/";
                Login.sendEmail(txtEmail.Value, baseUrl + "activation.aspx?c=" + activationCode);
            }
            catch (Exception ex)
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