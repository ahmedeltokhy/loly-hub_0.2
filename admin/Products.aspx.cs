using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class Products : System.Web.UI.Page
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

            SqlConnection con = null;
            try
            {
                con = new SqlConnection(Login.GetConnectionString());

                string query = "select * from LH_Product join LH_category on LH_product.category = LH_Category.ID join LH_product_image  on  LH_product_image.ID = (select top 1 LH_product_image.ID from LH_product_image where LH_product_image.product_id = LH_product.ID)";

                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataReader dr = cmd.ExecuteReader();


                HtmlTable userTable = new HtmlTable();
                userTable.Attributes["id"] = "userTable";
                userTable.Attributes["class"] = "table table-bordered";
                HtmlTableRow header = new HtmlTableRow();

                HtmlTableCell idHeader = new HtmlTableCell("th");
                idHeader.InnerText = "ID";
                header.Cells.Add(idHeader);

                HtmlTableCell ImageHeader = new HtmlTableCell("th");
                ImageHeader.InnerText = "Image";
                header.Cells.Add(ImageHeader);

                HtmlTableCell titleHeader = new HtmlTableCell("th");
                titleHeader.InnerText = "Title";
                header.Cells.Add(titleHeader);

                HtmlTableCell priceHeader = new HtmlTableCell("th");
                priceHeader.InnerText = "price";
                header.Cells.Add(priceHeader);

                HtmlTableCell categoryHeader = new HtmlTableCell("th");
                categoryHeader.InnerText = "Category";
                header.Cells.Add(categoryHeader);

                userTable.Rows.Add(header);
                int count = 1;
                while (dr.Read())
                {
                    string rowID = "row_" + count.ToString();
                    HtmlTableRow row = new HtmlTableRow();
                    row.Attributes["id"] = rowID;
                    row.Attributes["class"] = "usersRows";

                    HtmlTableCell id = new HtmlTableCell("th");
                    id.InnerText = dr[0].ToString();
                    row.Cells.Add(id);

                    HtmlTableCell image = new HtmlTableCell();
                    image.InnerHtml = "<img width='113' height='50' src='" + dr["image"].ToString() + "' />";
                    row.Cells.Add(image);
                    
                    HtmlTableCell title = new HtmlTableCell();
                    title.InnerText = dr["title"].ToString();
                    row.Cells.Add(title);

                    HtmlTableCell price = new HtmlTableCell();
                    price.InnerText = dr["price"].ToString();
                    row.Cells.Add(price);

                    HtmlTableCell category = new HtmlTableCell();
                    category.InnerText = dr["category_name"].ToString();
                    row.Cells.Add(category);

                    HtmlTableCell delete = new HtmlTableCell();
                    delete.InnerHtml = "<a href='#' onClick='deleteUser(" + dr[0] + "," + count + ")'>Delete</a>";
                    row.Cells.Add(delete);

                    HtmlTableCell edit = new HtmlTableCell();
                    edit.InnerHtml = "<a runat='server' id='edit_" + count + "' href='editProduct.aspx?id=" + dr[0] + "' onClick='editUser(" + dr[0] + ")'>Edit</a>";
                    row.Cells.Add(edit);

                    userTable.Rows.Add(row);
                    count++;
                }
                tableContainer.Controls.Add(userTable);
                con.Close();
            }
            catch (Exception)
            {
                con.Close();
                throw;
            }
        }

        [System.Web.Services.WebMethod]
        public static string delete(string id)
        {
            try
            {
                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                string query = "delete LH_product where id =@id;delete LH_product_image where product_id = @id;delete LH_WishList where ProductId = @id;delete LH_cart where product_ID = @id";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", int.Parse(id));
                cmd.ExecuteReader();
                return (id + " Deleted");


            }
            catch (Exception e)
            {

                return "User Can't be deleted.";
            }

        }
    }
}