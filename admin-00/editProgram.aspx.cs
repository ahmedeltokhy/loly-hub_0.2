using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class editProgram : System.Web.UI.Page
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

            int ID = -1;
            if (!int.TryParse(Request.QueryString["id"], out ID) && !IsPostBack)
            {
                Response.Redirect("Programs.aspx");
            }

            SqlConnection con = new SqlConnection(Login.GetConnectionString());

            string query = "select * from LH_Programs_List where id = @id";

            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@id", ID);

            SqlDataReader dr = cmd.ExecuteReader();
            idtxt.Value = ID.ToString();
            while (dr.Read())
            {
                Nametxt.Value = dr["name"].ToString();
                rate.Value = dr["rate"].ToString();
                oldImage.Attributes["src"] = dr["logo"].ToString();
            }

            con.Close();
        }
        [System.Web.Services.WebMethod]
        public static string saveProgram(string name, string image,int id,float rate)
        {
            try
            {
                string query;
                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                if (image == "null")
                {
                    query = "update LH_programs_list set name =@name,rate=@rate  where id = @id";

                }
                else
                {
                    query = "update LH_programs_list set name =@name, rate=@rate, logo =@image where id = @id";
                }
                
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@id",id);
                cmd.Parameters.AddWithValue("@rate", rate);
               if(image != "null") cmd.Parameters.AddWithValue("@image", image);

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