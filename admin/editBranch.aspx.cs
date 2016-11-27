using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class editBranch : System.Web.UI.Page
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


            int branchID = -1;
            if (!int.TryParse(Request.QueryString["id"], out branchID) && !IsPostBack)
            {
                Response.Redirect("Branches.aspx");
            }
           
               SqlConnection con = new SqlConnection(Login.GetConnectionString());

            string query = "select * from LH_Retailer_Branches where ID  = @id";

            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@id", branchID);

            SqlDataReader dr = cmd.ExecuteReader();
            idtxt.Value = branchID.ToString();
            while (dr.Read())
            {
                //titletxt.Value = dr["title"].ToString();
                branchId.Value = dr["branchID"].ToString();
                branchAddress.Value = dr["address"].ToString();
                branchPhone.Value = dr["phone"].ToString();
                string selectedRetailer = dr["retailerID"].ToString();
                con.Close();
               
                query = "select * from LH_retailer";
                con.Open();
                cmd = new SqlCommand(query, con);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    ListItem item = new ListItem(dr["name"].ToString(), dr["id"].ToString());
                    if (selectedRetailer == dr["id"].ToString())
                    {
                        item.Selected = true;
                    }
                    RetailerSelect.Items.Add(item);

                }


                

            }
            con.Close();

        }

        [System.Web.Services.WebMethod]
        public static string saveBranch(string data)
        {
            try
            {
                JavaScriptSerializer json = new JavaScriptSerializer();
                List<string> mystring = json.Deserialize<List<string>>(data);

                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                string query = "UPDATE [LH_Retailer_Branches] SET [retailerID] = @retailerID,[branchID] = @branchID,[address] = @address,[phone] = @phone where id = @id";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@retailerID", mystring[3]);
                cmd.Parameters.AddWithValue("@branchID", mystring[0]);
                cmd.Parameters.AddWithValue("@address", mystring[1]);
                cmd.Parameters.AddWithValue("@phone", mystring[2]);
                cmd.Parameters.AddWithValue("@id", mystring[4]);
               
                cmd.ExecuteReader();
                con.Close();


                
                
                return "Changes Saved.";
            }
            catch (Exception exc)
            {

                return "Failed to Save.";
            }



        }



        [System.Web.Services.WebMethod]
        public static string deleteImage(int id)
        {
            try
            {
                SqlConnection con = new SqlConnection(Login.GetConnectionString());

                string query = "delete LH_product_image where id = @id";
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@id", id);

                cmd.ExecuteReader();
                return "Item deleted.";
            }
            catch (Exception)
            {
                return "Failed to delete.";
                throw;
            }
            
        }
    }
}