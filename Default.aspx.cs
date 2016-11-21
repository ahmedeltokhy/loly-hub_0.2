using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace loly_hub_0._2
{
    public partial class Default : System.Web.UI.Page
    {
        int userID = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] != null)
            {
                string username = null;
                if (Session["id"] != null) int.TryParse(clsRidjindalEncryption.Decrypt(Session["id"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256), out userID);
                if (Session["userName"] != null) username = clsRidjindalEncryption.Decrypt(Session["userName"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);
                string email = null;
                if (Session["email"] != null) email = clsRidjindalEncryption.Decrypt(Session["email"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);
                string pwd = null;
                if (Session["pwd"] != null) pwd = clsRidjindalEncryption.Decrypt(Session["pwd"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256);

                bool isSession = (Session["login"] != null) ? clsRidjindalEncryption.Decrypt(Session["login"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256) == "1" : false;
                if (Login.checkLogin(username, email, pwd,isSession) != null)
                {
                    sign.Visible = false;
                    usernameDiv.Visible = true;
                    usernametxt.InnerText = username;
                }
                else
                {
                    sign.Visible = true;
                    usernameDiv.Visible = false;
                }

                SqlConnection con = new SqlConnection(Login.GetConnectionString());

                string query = "SELECT LP.ID,LP.title,LPI.image,LP.description,LP.price,LP.category,LP.featured,LPI.ID,LPI.product_id,LPI.image,LHW.ID,CASE WHEN LHW.ID IS NULL THEN '0' ELSE '1' END AS IsSelected FROM LH_PRODUCT LP JOIN LH_PRODUCT_IMAGE LPI ON LPI.ID =(SELECT TOP 1 LPII.ID FROM LH_PRODUCT_IMAGE LPII WHERE LPII.PRODUCT_ID = LP.ID) LEFT join LH_WISHLIST LHW ON LHW.ID = (SELECT top 1 ID FROM LH_WISHLIST LHWW WHERE LHWW.PRODUCTID = LP.ID ) where LP.featured = 1";

                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    createProduct(int.Parse(dr[0].ToString()), dr[9].ToString(), dr["title"].ToString(), dr["description"].ToString(), float.Parse(dr["price"].ToString()), dr["IsSelected"].ToString());
                }
                con.Close();

            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }

        protected void createProduct(int productID, string image, string title, string description, float pricev, string isSelectedstr)
        {
            HtmlGenericControl mainDiv = new HtmlGenericControl("div");
            mainDiv.Attributes["class"] = "col-sm-6 col-md-4";
            HtmlGenericControl li = new HtmlGenericControl("li");
            li.Attributes["class"] = "list-group-item";
            HtmlGenericControl innerDiv = new HtmlGenericControl("div");
            innerDiv.Attributes["class"] = "product-container";

            HtmlGenericControl wishList = new HtmlGenericControl("a");
            wishList.Attributes["class"] = "heart";
            wishList.Attributes["title"] = "";
            // wishList.Attributes["href"] = "products.aspx?id=" + productID;
            HtmlGenericControl wishListI1 = new HtmlGenericControl("i");
            wishListI1.Attributes["class"] = "fa fa-heart-o";
            wishListI1.Attributes["aria-hidden"] = "true";
            wishList.Controls.Add(wishListI1);

            HtmlGenericControl wishListI2 = new HtmlGenericControl("i");
            wishListI2.Attributes["class"] = "fa fa-heart";
            wishListI2.Attributes["aria-hidden"] = "true";
            wishListI2.Attributes["style"] = "color:lightred;";

            if (isSelectedstr == "1")
                wishListI2.Attributes["style"] = "color:lightred;opacity:10";
            else
                wishListI2.Attributes["onclick"] = "javascript: fnAddWishIcon(" + productID + ");";


            wishList.Controls.Add(wishListI2);
            innerDiv.Controls.Add(wishList);

            HtmlGenericControl titleA = new HtmlGenericControl("a");
            titleA.Attributes["href"] = "product.aspx?id=" + productID;

            HtmlGenericControl titleH4 = new HtmlGenericControl("h4");
            titleH4.Attributes["class"] = "title";
            titleH4.InnerText = title;
            titleA.Controls.Add(titleH4);
            innerDiv.Controls.Add(titleA);

            HtmlGenericControl imageBlock = new HtmlGenericControl("div");
            imageBlock.Attributes["class"] = "image-block";

            HtmlGenericControl productImage = new HtmlGenericControl("img");
            productImage.Attributes["src"] = image;

            imageBlock.Controls.Add(productImage);
            imageBlock.Controls.Add(new LiteralControl("<a type='button' href='product.aspx?id=" + productID + "' class='btn btn-default details'>More Details</a>"));

            innerDiv.Controls.Add(imageBlock);

            HtmlGenericControl pSummary = new HtmlGenericControl("p");
            pSummary.Attributes["class"] = "product-summary";
            pSummary.InnerText = description;
            innerDiv.Controls.Add(pSummary);

            HtmlGenericControl price = new HtmlGenericControl("span");
            price.Attributes["class"] = "price";
            price.Controls.Add(new LiteralControl("Price <b>" + pricev + " LP</b>"));
            innerDiv.Controls.Add(price);

            HtmlGenericControl addToCart = new HtmlGenericControl("div");
            addToCart.Attributes["class"] = "btn-group-vertical";

            HtmlGenericControl pATC = new HtmlGenericControl("p");
            pATC.Controls.Add(new LiteralControl("Earning <strong>2 LP</strong>"));

            addToCart.Controls.Add(pATC);

            HtmlGenericControl buttonATC = new HtmlGenericControl("button");
            buttonATC.Attributes["type"] = "button";
            buttonATC.Attributes["class"] = "btn btn-default add-card";
            buttonATC.Attributes["onclick"] = "javascript: fnAddCartIcon(" + productID + ");";
            buttonATC.Controls.Add(new LiteralControl("<i class='fa fa-shopping-cart' aria-hidden='true'></i>Add to Cart"));
            addToCart.Controls.Add(buttonATC);
            innerDiv.Controls.Add(addToCart);

            li.Controls.Add(innerDiv);
            mainDiv.Controls.Add(li);
            productList.Controls.Add(mainDiv);
        }
    }
}