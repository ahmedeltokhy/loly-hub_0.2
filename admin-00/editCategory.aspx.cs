using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class editCategory : System.Web.UI.Page
    {
        int id = -1;
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


            int userID = -1;
            if (!int.TryParse(Request.QueryString["id"], out userID) && !IsPostBack)
            {
                Response.Redirect("Categories.aspx");
            }
            if (!IsPostBack)
            {
                id = userID;
                useridForm.Value = userID.ToString();
                Session["formID"] = userID;
            }
            if (IsPostBack)
            {
                saveCategory();
            }
            SqlConnection con = new SqlConnection(Login.GetConnectionString());

            string query = "select * from LH_category where id = @id";

            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@id", userID);

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                catNametxt.Value = dr["category_name"].ToString();
            }

            con.Close();
        }

        protected void saveCategory()
        {

            if (IsPostBack)
            {
               

                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                string query = "update LH_category set category_name = @name where id = @id";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", catNametxt.Value);
              
                int id = int.Parse(Session["formID"].ToString());
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader dr = cmd.ExecuteReader();
                message.InnerText = "Saved";
                userForm.Visible = false;
            }
        }
    }
}