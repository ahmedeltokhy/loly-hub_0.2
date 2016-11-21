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
    public partial class editProduct : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {


            int role = -1;
            if (Session["Role"] != null || Request.Cookies["role"] != null)
            {
                if (Session["Role"] != null) int.TryParse(Session["Role"].ToString(), out role);
                if (Request.Cookies["role"] != null) int.TryParse(Request.Cookies["role"].Value, out role);
            }
            if (role != 1)
            {
                Response.Redirect("../default.aspx");
            }
            else
            {
                Response.Write("admin Login!");
            }


            int productID = -1;
            if (!int.TryParse(Request.QueryString["id"], out productID) && !IsPostBack)
            {
                Response.Redirect("Products.aspx");
            }
           
               SqlConnection con = new SqlConnection(Login.GetConnectionString());

            string query = "select * from LH_Product where id  = @id";

            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@id", productID);

            SqlDataReader dr = cmd.ExecuteReader();
            idtxt.Value = productID.ToString();
            while (dr.Read())
            {
                titletxt.Value = dr["title"].ToString();
                description.Value = dr["description"].ToString();
                Pricetxt.Value = dr["price"].ToString();
                featured.Checked = Boolean.Parse(dr["featured"].ToString());
                string category =dr["category"].ToString();

                con.Close();
                query = "select * from LH_category";
                con.Open();
                cmd = new SqlCommand(query, con);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    ListItem item = new ListItem(dr["category_name"].ToString(), dr["id"].ToString());
                    if (category == dr["id"].ToString())
                    {
                        item.Selected = true;
                    }
                    categorytxt.Items.Add(item);

                }

            }
            con.Close();

            con.Open();

            HtmlGenericControl div = new HtmlGenericControl("div");
            div.Attributes["class"] = "jFiler-items jFiler-row";

            HtmlGenericControl ul = new HtmlGenericControl("ul");
            ul.Attributes["class"] = "jFiler-items-list jFiler-items-grid";

           

            query = "select * from LH_product_image where product_id = @id";

            cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@id", productID);

            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                ul.Controls.Add(new LiteralControl("<li id='item-"+dr["id"]+"' class='jFiler-item' data-jfiler-index='5' style=''> <div class='jFiler-item-container'> <div class='jFiler-item-inner'> <div class='jFiler-item-thumb'> <div class='jFiler-item-status'></div><div class='jFiler-item-info'> <span class='jFiler-item-title'><b title='delta.jpg'>delta.jpg</b></span> <span class='jFiler-item-others'>9.19 KB</span> </div><div class='jFiler-item-thumb-image'> <img src='" + dr["image"] + "' draggable='false'> </div></div><div class='jFiler-item-assets jFiler-row'> <ul class='list-inline pull-left'> <li> <div class='jFiler-jProgressBar' style='display: none;'> <div class='bar' style='width: 100%;'></div></div><div class='jFiler-item-others text-success'> <i class='icon-jfi-check-circle'></i> Success </div></li></ul> <ul class='list-inline pull-right'> <li> <a onClick=' deleteImage("+dr["id"]+")' class='icon-jfi-trash jFiler-item-trash-action'></a> </li></ul> </div></div></div></li>"));
            }
            div.Controls.Add(ul);

            container_temp.Controls.Add(div);

            con.Close();
        }

        [System.Web.Services.WebMethod]
        public static string saveProduct(string images, string title, int price, int category, string description,int id,bool featured)
        {
            try
            {
                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                string query = "update LH_Product set title = @title, description = @description, price = @price, category = @category, featured = @featured where id = @id";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@title", title);
                cmd.Parameters.AddWithValue("@description", description);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@category", category);
                cmd.Parameters.AddWithValue("@featured", featured);
                cmd.Parameters.AddWithValue("@id", id);

                cmd.ExecuteReader();
                con.Close();


                JavaScriptSerializer json = new JavaScriptSerializer();
                List<string> mystring = json.Deserialize<List<string>>(images);
                con.Open();
                foreach (var image in mystring)
                {
                    query = "insert into LH_product_image(product_id,image) Values(@id,@image)";

                    cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@image", image);

                    SqlDataReader dr = cmd.ExecuteReader();
                    dr.Close();
                    
                }
                return "Changes Saved.";
            }
            catch (Exception)
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