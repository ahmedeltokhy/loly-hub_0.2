using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class addBranch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Login.GetConnectionString());

            
            string query = "select * from LH_retailer";

            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                RetailerSelect.Items.Add(new ListItem(dr["name"].ToString(), dr["id"].ToString()));
            }

            con.Close();

        }

        [System.Web.Services.WebMethod]
        public static string saveBranch(string dataArray)
        {
            try
            {
                JavaScriptSerializer json = new JavaScriptSerializer();
                List<string> mystring = json.Deserialize<List<string>>(dataArray);

                SqlConnection con = new SqlConnection(Login.GetConnectionString());

                string query = "INSERT INTO [LH_Retailer_Branches]([retailerID],[branchID],[address],[phone]) VALUES(@retailerID,@branchID,@address,@phone)";

                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@retailerID", mystring[3]);
                cmd.Parameters.AddWithValue("@branchID", mystring[0]);
                cmd.Parameters.AddWithValue("@address", mystring[1]);
                cmd.Parameters.AddWithValue("@phone", mystring[2]);


                cmd.ExecuteReader();


                
                
                return "Branch Saved.";  
            }
            catch (Exception e)
            {
                
                return "Failed to Save.";
            }



        }
    }
}