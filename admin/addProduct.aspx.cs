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
    public partial class addProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Login.GetConnectionString());

            string query = "select * from LH_category";

            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                categorytxt.Items.Add(new ListItem(dr["category_name"].ToString(), dr["id"].ToString()));
            }

            con.Close();

            query = "select * from LH_retailer";

            con.Open();

            cmd = new SqlCommand(query, con);

            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                RetailerSelect.Items.Add(new ListItem(dr["name"].ToString(), dr["id"].ToString()));
            }

            con.Close();

        }

        [System.Web.Services.WebMethod]
        public static string saveProduct(string images,string title,int price, int category,string description, bool featured,int earnedLP,int retailer,int earnedExpiry,int productExpiry)//saveProduct(string title, List<string> images, int category, int price)
        {
            try
            {
                SqlConnection con = new SqlConnection(Login.GetConnectionString());

                string query = "insert into LH_Product(title, description, price, category, featured,earnedLP,retailerID,earnedExpiry,createDate,updateDate)values(@title,@description,@price,@category,@featured,@earnedLP,@retialer,@earnedExpiry,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);SELECT CAST(scope_identity() AS int)";

                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@title",title);
                cmd.Parameters.AddWithValue("@description",description);
                cmd.Parameters.AddWithValue("@price",price);
                cmd.Parameters.AddWithValue("@category",category);
                cmd.Parameters.AddWithValue("@featured",featured);
                cmd.Parameters.AddWithValue("@earnedLP",earnedLP);
                cmd.Parameters.AddWithValue("@retialer", retailer);
                cmd.Parameters.AddWithValue("@earnedExpiry", earnedExpiry);
                int modified = (Int32)cmd.ExecuteScalar();
                con.Close();


                JavaScriptSerializer json = new JavaScriptSerializer();
                List<string> mystring = json.Deserialize<List<string>>(images);
                con.Open();
                foreach (var image in mystring)
                {
                    query = "insert into LH_product_image(product_id,image) Values(@id,@image)";

                    cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@id",modified);
                    cmd.Parameters.AddWithValue("@image",image);

                    SqlDataReader dr = cmd.ExecuteReader();
                    dr.Close();
                }
                con.Close();
                return "Product Saved.";  
            }
            catch (Exception e)
            {
                
                return "Failed to Save.";
            }



        }
    }
}