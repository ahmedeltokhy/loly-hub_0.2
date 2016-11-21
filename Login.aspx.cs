using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;

namespace loly_hub_0._2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            form1.DefaultButton = Button1.UniqueID;
            try


            {
                if (Session["login"] != null)
                    if (clsRidjindalEncryption.Decrypt(Session["login"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256) == "1")
                    {
                        int userID = -1;
                        string username = null;

                        if (Session["id"] != null) int.TryParse(clsRidjindalEncryption.Decrypt(Session["id"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256), out userID);

                        if (Session["userName"] != null) username = clsRidjindalEncryption.Decrypt(Session["userName"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);

                        string email = null;

                        if (Session["email"] != null) email = clsRidjindalEncryption.Decrypt(Session["email"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);

                        string pwd = null;

                        if (Session["pwd"] != null) pwd = Session["pwd"].ToString();
                        if (pwd != null) pwd = clsRidjindalEncryption.Decrypt(Session["pwd"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);

                        if (!IsPostBack && ((username != null && email != null && pwd != null) || userID != -1))
                        {
                            if (checkLogin(username, email, pwd, clsRidjindalEncryption.Decrypt(Session["login"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256) == "1") != null)
                            {
                                Response.Redirect("AddProgram.aspx");
                            }
                            else
                            {
                                Response.Redirect("Logout.aspx");
                            }

                        }
                    }
                    else
                    {
                        Response.Redirect("Logout.aspx");
                    }

            }
            catch (Exception)
            {

                throw;
            }

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            bool isSession = (Session["login"] != null) ? clsRidjindalEncryption.Decrypt(Session["login"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256) == "1" : false;
            string[] data = checkLogin(txtemail.Value, txtemail.Value, txtpswd.Value, isSession);
            if (data != null)
            {

                Session["login"] = clsRidjindalEncryption.Encrypt(1.ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);

                Session["id"] = clsRidjindalEncryption.Encrypt(data[0].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);

                Session["userName"] = clsRidjindalEncryption.Encrypt(data[1].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);

                Session["email"] = clsRidjindalEncryption.Encrypt(data[2].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);

                Session["role"] = clsRidjindalEncryption.Encrypt(data[3].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);

                Session["mobile"] = clsRidjindalEncryption.Encrypt(data[4].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);

                Session["pwd"] = clsRidjindalEncryption.Encrypt(txtpswd.Value, "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);

                Session["retailerID"] = clsRidjindalEncryption.Encrypt(data[5].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);

                SqlConnection con = new SqlConnection(GetConnectionString());

                string query = "update LH_User set isLoggedIn = 1 where id = @id";

                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@id", data[0].ToString());

                SqlDataReader dr = cmd.ExecuteReader();


                messagestxt.InnerText = "Login Successfull.";

                Response.Redirect("AddProgram.aspx");
            }
            else
            {
                messagestxt.InnerText = "LogIn Failed.";
                Response.Redirect("logout.aspx");
            }

        }

        public static string[] checkLogin(string username, string email, string password, bool isSession)
        {

            try
            {
                string[] result = new string[6];
                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                string strsql = "select Id, UserName,Email,role,Mobile,isLoggedIn,retailerID from dbo.LH_User where (username=@UserName or email=@UserName) and password=@Password ";
                con.Open();
                SqlCommand cmd = new SqlCommand(strsql, con);
                cmd.Parameters.AddWithValue("@UserName", username);
                cmd.Parameters.AddWithValue("@Password", password);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //bool islogged = bool.Parse(dr["isLoggedIn"].ToString());
                        //if (islogged && !isSession)
                        //{
                        //    return null;
                        //}
                        result[0] = dr["Id"].ToString();
                        result[1] = dr["UserName"].ToString();
                        result[2] = dr["email"].ToString();
                        result[3] = dr["role"].ToString();
                        result[4] = dr["mobile"].ToString();
                        result[5] = dr["retailerID"].ToString();
                        break;
                    }
                    return result;
                }
                else
                {
                    return null;
                }

            }
            catch (Exception ex)
            {
                return null;
                throw;
            }

        }


        public static string GetConnectionString()
        {
            return clsRidjindalEncryption.Decrypt(System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString, "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);
            //sets the connection string from your web config file "ConnString" is the name of your Connection String

        }

        [System.Web.Services.WebMethod]
        public static string sendForgot(string email)
        {
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            SqlConnection con1 = new SqlConnection(Login.GetConnectionString());
            string query = "select id,email,UserName,Mobile from LH_User where userName = @email or Email = @email";

            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@email", email);
            SqlDataReader dr = cmd.ExecuteReader();
            if (!dr.HasRows)
            {
                return "No Such UserName Or Email.";
            }
            else
            {

                while (dr.Read())
                {
                    Guid resetCode = Guid.NewGuid();
                    string baseURL = "http://" + HttpContext.Current.Request.Url.Host + ":" + HttpContext.Current.Request.Url.Port;
                    string message = baseURL + "/resetPassword.aspx?c=" + resetCode.ToString();
                    con1.Open();
                    string query1 = "update LH_User set resetCode = @resetCode where id = @id";
                    SqlCommand cmd1 = new SqlCommand(query1, con1);
                    cmd1.Parameters.AddWithValue("@resetCode", resetCode.ToString());
                    cmd1.Parameters.AddWithValue("@id", int.Parse(dr["id"].ToString()));
                    cmd1.ExecuteReader();
                    bool emailSent = sendEmail(dr["email"].ToString(), message);
                    con1.Close();
                    return "Activation Link Sent To Your Email.";
                }
                return "Activation Link Sent To Your Email.";
            }



        }

        public static bool sendEmail(string email, string message)
        {
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.esh-me.com");

                mail.From = new MailAddress("ahmed.atyaa@esh-me.com");
                mail.To.Add(email);
                mail.Subject = "LolyHub";
                mail.Body = message;

                SmtpServer.Port = 25;
                SmtpServer.Credentials = new System.Net.NetworkCredential("ahmed.atyaa@esh-me.com", "Ahmed2Eltokhy");
                SmtpServer.EnableSsl = false;

                SmtpServer.Send(mail);

                return true;
            }
            catch (Exception e)
            {

                return false;
                throw;
            }

        }



        public static int countWishList(int userID)
        {
            try
            {

                SqlConnection con = new SqlConnection(Login.GetConnectionString());

                string query = "select count(*) from LH_wishList where UserId = @userID";

                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@userID", userID);

                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                return int.Parse(dr[0].ToString());
            }
            catch (Exception e)
            {
                return 0;
            }
        }

        public static int countCart(int userID)
        {
            try
            {

                SqlConnection con = new SqlConnection(Login.GetConnectionString());

                string query = "select count(*) from LH_cart where User_ID = @userID";

                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@userID", userID);

                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                return int.Parse(dr[0].ToString());
            }
            catch (Exception e)
            {
                return 0;
            }
        }


        public static int UserLHP(int userID)
        {
            try
            {

                SqlConnection con = new SqlConnection(Login.GetConnectionString());

                string query = "select LHP from LH_User where ID = @userID";

                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@userID", userID);

                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                return int.Parse(dr[0].ToString());
            }
            catch (Exception e)
            {
                return 0;
            }
        }

        public static float getProgramsCount(int userID)
        {
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            string query = "select * from LH_programs join LH_programs_list on LH_Programs.program = LH_programs_list.ID ";
            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();
            float count = -1;
            while (dr.Read())
            {
                count += float.Parse(dr["rate"].ToString()) * float.Parse(dr["Points"].ToString());
            }
            return count;
        }
        private bool deleteOperate()
        {
            try
            {

                //Session.Remove("id");

                //Session.Remove("userName");

                //Session.Remove("email");

                //Session.Remove("role");

                //Session.Remove("mobile");

                //Session.Remove("pwd");
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }
        }



        [System.Web.Services.WebMethod]
        public bool deleteSession()
        {

            return deleteOperate();
        }
    }
}