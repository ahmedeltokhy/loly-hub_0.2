using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2
{
    public partial class addProgramRegister : System.Web.UI.Page
    {
        
        int programName =0;
        int id = -1;
        int userID = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["id"] == null || !int.TryParse(Session["id"].ToString(), out userID))
            //{
            //    Response.Redirect("Login.aspx");
            //}
            if (Session["login"] != null)
            {

                if (!IsPostBack)
                {
                    
                    if (Session["id"] != null) int.TryParse(clsRidjindalEncryption.Decrypt(Session["id"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256), out userID);
                    string username = null;
                    if (Session["userName"] != null) username = clsRidjindalEncryption.Decrypt(Session["userName"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);
                    string email = null;
                    if (Session["email"] != null) email = clsRidjindalEncryption.Decrypt(Session["email"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);
                    string mobile = null;
                    if (Session["mobile"] != null) mobile = clsRidjindalEncryption.Decrypt(Session["mobile"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);
                    string pwd = null;
                    if (Session["pwd"] != null) pwd = clsRidjindalEncryption.Decrypt(Session["pwd"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);

                    if (Login.checkLogin(username, email, pwd, clsRidjindalEncryption.Decrypt(Session["login"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256) == "1") == null || userID == -1)
                    {
                        Response.Redirect("Login.aspx");
                    }

                    if (Request.QueryString["id"] == null || !int.TryParse(Request.QueryString["id"], out id))
                    {
                        Response.Redirect("AddProgram.aspx");
                    }
                    programID.Value = id.ToString();
                    otp.Visible = false;
                    mobiletxt.Value = mobile;
                }
                if (Request.QueryString["id"] == null || !int.TryParse(Request.QueryString["id"], out id))
                {
                    Response.Redirect("AddProgram.aspx");
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
         
        }
        public static bool checkUser(string userName)
        {
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            try
            {
                
                string query = "select count(*) from LH_Programs where Username = @username";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@username", userName);

                SqlDataReader dr = cmd.ExecuteReader();

                int result = -1;
                dr.Read();
                int.TryParse(dr[0].ToString(), out result);
                if (result == 0)
                {
                    return true;

                }
                else
                {
                    return false;
                }

            }
            catch (Exception e)
            {
                return false;
                throw;
            }
            
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (id == -1)
            {
                Response.Redirect("AddProgram.aspx");
            }

            try
            {
                if (!checkUser(unametxt.Value))
                {
                    messages.Text = "failed to register the program, user may be registered before.";
                    return;
                }
                hiddenPWD.Value = pwtxt.Text;
                webService.Service1Client c = new webService.Service1Client();
                WebService3.Service1Client c3 = new WebService3.Service1Client();
                string result ="";

                switch (id)
                {
                    case 1:
                        result = c.Loyalty_Program_Otp(unametxt.Value, pwtxt.Text, mobiletxt.Value, null)[0];
                        break;

                    case 2:
                        result = c3.Loyalty_Program_Otp(unametxt.Value, pwtxt.Text, mobiletxt.Value, null)[0];
                        break;
                    default:
                        break;
                }

               
                if (result != "0000")
                {
                    messages.Text = "Error";
                   
                }
                else
                {
                    messages.Text = "Success";
                    form1.Visible = false;
                    otp.Visible = true;
                    //unametxt.Text = "";
                    //pwtxt.Text = "";

                }
                double result1 = -1;
                double rate = 0.6;
                switch (id)
                {
                    case 1:
                        webService.Service1Client b = new webService.Service1Client();
                       result1 = rate * b.LP_UpdateUserInfo(unametxt.Value, pwtxt.Text);
                        break;

                    case 2:
                        WebService3.Service1Client b3 = new WebService3.Service1Client();
                        result1 = rate * b3.LP_UpdateUserInfo(unametxt.Value, pwtxt.Text);
                        break;
                    default:
                        break;
                }
                
                
                Session["LHP"] = result1;
            }
            catch(Exception ex)
            {
                messages.Text = ex.Message;



            }
        }

        protected void otpbtn_Click(object sender, EventArgs e)
        {
            string otp = otptxt.Text;
            string username = unametxt.Value;
            int userID = -1;
            if (Session["id"] != null) int.TryParse(clsRidjindalEncryption.Decrypt(Session["id"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256), out userID);

            try
            {
                int n;
                if(Request.QueryString["p"] != null && int.TryParse(Request.QueryString["p"],out n))
                {
                    programName = int.Parse(Request.QueryString["p"]);
                }
                else
                {
                    programName = int.Parse(programID.Value);
                }

                string result = "";

                switch (id)
                {
                    case 1:
                        webService.Service1Client c = new webService.Service1Client();
                        result =  c.Loyalty_Program_Otp(unametxt.Value, hiddenPWD.Value, mobiletxt.Value, otptxt.Text)[0];
                        if (result != "0000")
                        {
                            messages.Text = "Error";
                        }
                        else
                        {
                            messages.Text = "Success";
                            int points = c.LP_UpdateUserInfo(unametxt.Value, hiddenPWD.Value);
                           

                            SqlConnection con = new SqlConnection(Login.GetConnectionString());
                            con.Open();
                            SqlCommand cmd = new SqlCommand();
                            string Sql = "INSERT INTO [dbo].[LH_Programs]([User_Id],[Username],[Password],[Points],[Create_Date],[Update_Date],[program],[mobile])"
                                + "VALUES(@userID,@username,@password,@points,@date,@date,@programName,@mobile)";
                            cmd.Parameters.AddWithValue("@userID", userID);
                            cmd.Parameters.AddWithValue("@username", unametxt.Value);
                            cmd.Parameters.AddWithValue("@password", hiddenPWD.Value);
                            cmd.Parameters.AddWithValue("@points", points);
                            cmd.Parameters.AddWithValue("@date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@programName", programName);
                            cmd.Parameters.AddWithValue("@mobile", mobiletxt.Value);
                            cmd.Connection = con;
                            cmd.CommandText = Sql;
                            cmd.ExecuteNonQuery();
                            con.Close();

                            //con.Open();

                            //Sql = "update LH_user set LHP = LHP+@p where id = @userID";

                            //cmd = new SqlCommand(Sql, con);

                            //cmd.Parameters.AddWithValue("@p",int.Parse(Session["LHP"].ToString()));
                            //cmd.Parameters.AddWithValue("@userID",userID);
                            //cmd.ExecuteReader();
                            //con.Close();
                            Response.Redirect("Product.aspx");

                        }
                        break;

                    case 2:
                        WebService3.Service1Client c3 = new WebService3.Service1Client();
                        result = c3.Loyalty_Program_Otp(unametxt.Value, hiddenPWD.Value, mobiletxt.Value, otptxt.Text)[0];
                        if (result != "0000")
                        {
                            messages.Text = "Error";
                        }
                        else
                        {
                            messages.Text = "Success";
                            int points = c3.LP_UpdateUserInfo(unametxt.Value, hiddenPWD.Value);
                            //int userID = ;//add the user ID from Session

                            SqlConnection con = new SqlConnection(Login.GetConnectionString());
                            con.Open();
                            SqlCommand cmd = new SqlCommand();
                            string Sql = "INSERT INTO [dbo].[LH_Programs]([User_Id],[Username],[Password],[Points],[Create_Date],[Update_Date],[program],[mobile])"
                                + "VALUES(@userID,@username,@password,@points,@date,@date,@programName,@mobile)";
                            cmd.Parameters.AddWithValue("@userID", userID);
                            cmd.Parameters.AddWithValue("@username", unametxt.Value);
                            cmd.Parameters.AddWithValue("@password", hiddenPWD.Value);
                            cmd.Parameters.AddWithValue("@points", points);
                            cmd.Parameters.AddWithValue("@date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@programName", programName);
                            cmd.Parameters.AddWithValue("@mobile", mobiletxt.Value);
                            cmd.Connection = con;
                            cmd.CommandText = Sql;
                            cmd.ExecuteReader();
                            con.Close();
                            Response.Redirect("Product.aspx");

                        }
                        break;
                    default:
                        break;
                }
                
                
               
            }
            catch (Exception ex)
            {
                messages.Text = ex.Message;



            }
        }

        public static string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            //sets the connection string from your web config file "ConnString" is the name of your Connection String

        }
     

    }
}