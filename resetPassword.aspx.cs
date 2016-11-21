using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2
{
    public partial class resetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["c"] != null)
            {
                string code = Request.QueryString["c"];
                SqlConnection con = new SqlConnection(Login.GetConnectionString());

                string query = "select id,Email from LH_User where resetCode = @code";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@code", code);

                SqlDataReader dr = cmd.ExecuteReader();

                if (!dr.HasRows)
                {
                    Response.Redirect("Login.aspx");
                }

                while (dr.Read())
                {
                    idtxt.Value = dr["id"].ToString();
                    emailtxt.Value = dr["email"].ToString();
                    HttpCookie myCookie = new HttpCookie("code");
                  
                    // Set the cookie value.
                    myCookie.Value = code;
                   
                    // Add the cookie.
                    Response.Cookies.Add(myCookie);
                }
                con.Close();

            }
            else
            {
                Response.Redirect("Login.aspx");

            }


        }

        [System.Web.Services.WebMethod]
        public static string doResetPassword(string password, int id,string email,string code)
        {
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            try
            {
                SqlConnection con1 = new SqlConnection(Login.GetConnectionString());

                string query1 = "select id,Email from LH_User where resetCode = @code";
                con.Open();
                SqlCommand cmd1 = new SqlCommand(query1, con1);

                cmd1.Parameters.AddWithValue("@code", code);

                SqlDataReader dr1 = cmd1.ExecuteReader();

                if (!dr1.HasRows)
                {
                    return "diffrent code";
                }

                string query = "update LH_User set Password = @password where id = @id";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@password", password);

                SqlDataReader dr = cmd.ExecuteReader();

                con.Close();
                Login.sendEmail(email,"Password Reset Finished. ;)");
                return "Password Reset Done.";

            }
            catch (Exception)
            {
                con.Close();
                return "Failed to reset the password.";


            }

        }
    }
}
    