using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class AddProgram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            int role = -1;
            if (Session["role"] != null) int.TryParse(clsRidjindalEncryption.Decrypt(Session["role"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256), out role);
            if (role != 1)
            {
                Response.Redirect("../default.aspx");
            }
            else
            {
                Response.Write("admin Login!");
            }
        }

        [System.Web.Services.WebMethod]
        public static string saveProgram(string name, string image, float rate)
         {
            try
            {
                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                string query = "INSERT INTO LH_programs_list(name,logo,rate) VALUES(@name,@image,@rate)";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@image", image);
                cmd.Parameters.AddWithValue("@rate", rate);

                SqlDataReader dr = cmd.ExecuteReader();
                return "Changes Saved.";
            }
            catch (Exception)
            {

                return "Failed to Save.";
            }
            
           

        }
    }
}