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
    public partial class UserInfo : System.Web.UI.Page
    {
        int userID = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] != null)
            {
                string username = null;
                if (Session["id"] != null) int.TryParse(clsRidjindalEncryption.Decrypt(Session["id"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256), out userID);
                if (Session["userName"] != null) username = clsRidjindalEncryption.Decrypt(Session["userName"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);
                string email = null;
                if (Session["email"] != null) email = clsRidjindalEncryption.Decrypt(Session["email"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);
                string pwd = null;
                if (Session["pwd"] != null) pwd = clsRidjindalEncryption.Decrypt(Session["pwd"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);
                bool isSession = (Session["login"] != null) ? clsRidjindalEncryption.Decrypt(Session["login"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256) == "1" : false;
                if (Login.checkLogin(username, email, pwd,isSession) == null || userID == -1)
                {
                    Response.Redirect("Login.aspx");
                }
                int id = userID;
                if (!IsPostBack)
                {
                    try
                    {
                        SqlConnection con = new SqlConnection(Login.GetConnectionString());
                        string strsql = "select FirstName,LastName,Mobile,Email from LH_User where Id= '" + id + "'";
                        con.Open();
                        SqlCommand cmd = new SqlCommand(strsql, con);
                        SqlDataReader sdr = cmd.ExecuteReader();
                        if (sdr.Read() == true)
                        {

                            txtFname.Value = (sdr["FirstName"].ToString());
                            txtLname.Value = (sdr["LastName"].ToString());
                            txtMobile.Text = (sdr["Mobile"].ToString());
                            txtEmail.Value = (sdr["Email"].ToString());
                            con.Close();
                        }
                        else
                        {
                            Response.Redirect("Login.aspx");
                        }
                    }


                
                catch (Exception)
                {

                    throw;
                }
            }

        }
        else
	{
                Response.Redirect("logout.aspx");
	}
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            string query = "select * from LH_user where Email = @email or mobile = @mobile";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@email",txtEmail.Value);
            cmd.Parameters.AddWithValue("@mobile",txtMobile.Text);

            SqlDataReader dr = cmd.ExecuteReader();

            if (!dr.HasRows)
            {
                con.Close();
                int id = -1;
                if (Session["id"] != null) int.TryParse(clsRidjindalEncryption.Decrypt(Session["id"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256), out id);

                 query = "update LH_User set FirstName ='" + txtFname.Value + "',LastName ='" + txtLname.Value + "',Mobile ='" + txtMobile.Text + "',Email ='" + txtEmail.Value + "' where Id='" + id + "'";
                con.Open();
                cmd = new SqlCommand(query, con);
                try
                {
                    cmd.ExecuteNonQuery();

                    messageTxt.InnerText = "data updated successfully";
                }
                catch (Exception)
                {

                    messageTxt.InnerText = "data not updated";
                }
                finally
                {
                    con.Close();
                    //Response.Redirect("AddProgram.aspx");
                }
            }
            else
            {
                messageTxt.InnerText = "Email or mobile is already inserted before.";
            }

            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProgram.aspx");
        }
        public static string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

        }
    }
}