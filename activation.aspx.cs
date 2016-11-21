using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2
{
    public partial class activation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["c"] != null)
            {
                int id = -1;
                string email = null;
                string code = Request.QueryString["c"];
                SqlConnection con = new SqlConnection(Login.GetConnectionString());

                string query = "select id,Email from LH_User where activationCode = @code";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@code", code);

                SqlDataReader dr = cmd.ExecuteReader();

                if (!dr.HasRows)
                {
                    Response.Write("Activation Failed.");
                }
                else
                {
                    while (dr.Read())
                    {
                        id = int.Parse(dr["id"].ToString());
                        email = dr["email"].ToString();

                        con.Close();
                        con.Open();
                        query = "update LH_user set active = 1 where id = @id";

                        cmd = new SqlCommand(query, con);

                        cmd.Parameters.AddWithValue("@id", id);

                        cmd.ExecuteReader();
                        con.Close();
                        break;
                    }

                    Login.sendEmail(email, "Account Activated.");
                    activationtxt.Visible = true;
                    error.Visible = false;
                }
            }
            else
            {
                activationtxt.Visible = false;
                error.Visible = true;
            }
        }
    }
}