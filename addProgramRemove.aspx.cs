using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2
{
    public partial class addProgramRemove : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = -1;
            if (Request.QueryString["id"] == null || !int.TryParse(Request.QueryString["id"], out id))
            {
                Response.Redirect("AddProgram.aspx");
            }

            try
            {
                SqlConnection con = new SqlConnection(Login.GetConnectionString());

                string query = "delete from LH_Programs where id = @id";

                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@id",id);

                SqlDataReader dr = cmd.ExecuteReader();
                Response.Redirect("AddProgram.aspx");
            }
            catch (Exception)
            {
                Response.Redirect("AddProgram.aspx");
                throw;
            }
        }
    }
}