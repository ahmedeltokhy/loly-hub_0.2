using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class addProgramCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void saveCategory()
        {

           
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {


                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                string query = "insert into LH_programs_category(category_name) values(@name) ";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", catNametxt.Value);
                SqlDataReader dr = cmd.ExecuteReader();
                message.InnerText = "Saved";
                userForm.Visible = false;
            }
        }
    }
}