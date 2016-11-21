using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class matchRetailer : System.Web.UI.Page
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

            SqlConnection con = new SqlConnection(Login.GetConnectionString());

            string query = "select ID,username from LH_user";

            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                usersSelect.Items.Add(new ListItem(dr["username"].ToString(),dr["ID"].ToString()));
            }

            con.Close();

            query = "select * from LH_retailer";

            con.Open();

            cmd = new SqlCommand(query, con);

            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                retailerSelect.Items.Add(new ListItem(dr["name"].ToString(), dr["ID"].ToString()));
            }
        }

        protected void saveMatch(object sender, EventArgs e)
        {
            int userid = int.Parse(usersSelect.Value);
            int retailerid = int.Parse(retailerSelect.Value);
        }
    }
}