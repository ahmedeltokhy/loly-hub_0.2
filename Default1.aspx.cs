using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2
{
    public partial class Default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userID = -1;
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
                if (Login.checkLogin(username, email, pwd, isSession) != null)
                {
                    sign.Visible = false;
                    signup_menu.Visible = false;
                    login_menu.Visible = false;
                    wishListItem.Visible = true;
                    cartItem.Visible = true;
                    cartCount.InnerText = Login.countCart(userID).ToString();
                    wishListCount.InnerText = Login.countWishList(userID).ToString();
                    //usernameDiv.Visible = true;
                    //usernametxt.InnerText = username;
                }
                else
                {
                    sign.Visible = true;

                    signup_menu.Visible = true;
                    login_menu.Visible = true;
                    wishListItem.Visible = false;
                    cartItem.Visible = false;
                    //usernameDiv.Visible = false;
                }
            }
            else
            {
                sign.Visible = true;

                signup_menu.Visible = true;
                login_menu.Visible = true;
                wishListItem.Visible = false;
                cartItem.Visible = false;
                //usernameDiv.Visible = false;
            }
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            string query = "select * from LH_category";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);

           SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                categoryItems.Controls.Add(new LiteralControl(" <li><a href='products.aspx?cat=" + dr["id"] + "'>" + dr["category_name"] + "</a></li>"));
            }
            con.Close();
        }
        }
}