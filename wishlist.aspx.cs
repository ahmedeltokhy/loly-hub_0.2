using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;

namespace loly_hub_0._2
{
    public partial class wishlist : System.Web.UI.Page
    {
        int userID = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
                    if (Login.checkLogin(username, email, pwd,isSession) == null || userID == -1)
                    {
                        Response.Redirect("Login.aspx");
                    }
                    usernametxt.InnerText = username;

                    lhptxt.InnerText = (Login.UserLHP(userID) + Login.getProgramsCount(userID)).ToString();
                    hdfuserid.Value = userID.ToString();
                    int nuserid = Convert.ToInt32(hdfuserid.Value);
                    GetCountWishlist(nuserid);
                    GetCountofCart(nuserid);
                    SqlConnection con = new SqlConnection(Login.GetConnectionString());
                    string strsql = "select * from LH_product LHP join LH_wishList LHW on LHW.productID = LHP.ID " +
                        "join LH_product_image LHI on  LHI.ID = (select top 1 LHII.ID from LH_product_image LHII where LHII.product_id = LHP.ID) WHERE LHW.userID=@UserId";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(strsql, con);
                    //  cmd.Parameters.AddWithValue("@hdfuserid", hdfuserid.Value);
                    cmd.Parameters.AddWithValue("@UserId", hdfuserid.Value);
                    SqlDataReader dr = cmd.ExecuteReader();

                    int i = 0;

                    while (dr.Read())
                    {
                        createProduct(int.Parse(dr[0].ToString()), dr["image"].ToString(), dr["title"].ToString(), dr["description"].ToString(), float.Parse(dr["price"].ToString()),i,int.Parse(dr["earnedLP"].ToString()));
                        i++;
                    }
                    con.Close();
                    con.Open();
                    strsql = "select * from LH_Programs join LH_Rates on LH_Programs.Id = LH_Rates.Program_ID join LH_programs_list on LH_Programs.program = LH_programs_list.ID where LH_Rates.Approved = 1 and LH_Programs.User_Id = @userID";
                    cmd = new SqlCommand(strsql, con);
                    cmd.Parameters.AddWithValue("userID", 4);
                    dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        HtmlGenericControl walletGrid = new HtmlGenericControl("div");
                        walletContainer.Controls.Add(walletGrid);
                    }
                    con.Close();

                    //if ((Session["id"] == null || !int.TryParse(Session["id"].ToString(), out userID)) && (Request.Cookies["id"] == null || !int.TryParse(Request.Cookies["id"].Value, out userID)))
                    //{
                    //    Response.Redirect("Login.aspx");
                    //}
                    //else
                    //{
                    //    //  wishIconList_ex.InnerText = Session["Count"].ToString();
                    //    //txtuserid.Text = Session["Id"].ToString();
                    //    if ((Session["username"] == null || !int.TryParse(Session["username"].ToString(), out Username)) && (Request.Cookies["username"] == null || !int.TryParse(Request.Cookies["Username"].Value, out Username)))
                    //        wishuser.InnerText = Session["username"].ToString();                    
                    //}
                }
                else
                {
                    Response.Redirect("logout.aspx");
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }


        }
        //[System.Web.Services.WebMethod]
        //public static int AddWishlist(int userid, int productid)
        //{
        //    //  int userid = int.Parse(Request.Form["userID"]); int productid = int.Parse(Request.Form["productID"]);
        //    //  Response.Write("AAA----UserID:"+userid.ToString()+"----productID:"+productid.ToString());
        //    int cnt = 0;
        //    try
        //    {

        //        if (userid > 0 && productid > 0)
        //        {
        //            SqlConnection con = new SqlConnection(Login.GetConnectionString());
        //            string Sql = "delete from LH_WishList where UserId=@userid and ProductId=@productid";
        //            con.Open();
        //            SqlCommand cmd = new SqlCommand(Sql, con);
        //            cmd.Parameters.AddWithValue("@UserId", userid);
        //            cmd.Parameters.AddWithValue("@ProductId", productid);
        //            cmd.CommandType = CommandType.Text;
        //            cmd.ExecuteNonQuery();
        //            con.Close();
        //            //  GetCount(userid);
        //            //Product p = new Product();
        //            //p.GetCount(userid);

        //            cnt = GetCount(userid);
        //        }

        //    }
        //    catch (System.Data.SqlClient.SqlException ex)
        //    {
        //        string msg = "Insert Error:";
        //        msg += ex.Message;
        //        throw new Exception(msg);
        //    }
        //    return cnt;
        //}

        [System.Web.Services.WebMethod]
        public static int AddWishlist(int userid, int productid)
        {
            //  int userid = int.Parse(Request.Form["userID"]); int productid = int.Parse(Request.Form["productID"]);
            //  Response.Write("AAA----UserID:"+userid.ToString()+"----productID:"+productid.ToString());
            int cnt = 0;
            bool BRecExist = false;

            try
            {
                SqlConnection con1 = new SqlConnection(Login.GetConnectionString());
                SqlCommand cmd1 = new SqlCommand("select ProductID from LH_WishList where UserId = " + userid + " and ProductID=" + productid + " ", con1);
                // SqlParameter param = new SqlParameter();
                //param.ParameterName = "@UserID";
                //param.Value = userid;
                // cmd1.Parameters.Add(param);
                con1.Open();
                SqlDataReader reader = cmd1.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                con1.Close();
                int numRows = dt.Rows.Count;
                if (numRows > 0)
                {
                    BRecExist = true;
                    return 0;
                }
                else
                {
                    BRecExist = false;

                }


                if (userid > 0 && productid > 0 && BRecExist == false)
                {
                    SqlConnection con = new SqlConnection(Login.GetConnectionString());
                    string Sql = "insert into LH_WishList(UserId,ProductID)values(@val1,@val2)";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(Sql, con);
                    cmd.Parameters.AddWithValue("@val1", userid);
                    cmd.Parameters.AddWithValue("@val2", productid);
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    cnt = GetCount(userid);
                }

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            if (BRecExist == false)
                return cnt;
            else
                return 0;
        }


        [System.Web.Services.WebMethod]
        public static int removeWishList(int userid, int productid)
        {

            try
            {
                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                string query = "delete from LH_WishList where productID = @productID and UserId = @userID";

                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.Parameters.AddWithValue("@productID", productid);
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataReader dr = cmd.ExecuteReader();
                return GetCount(userid);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        public static string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        }
        //  [System.Web.Services.WebMethod]
        public static int GetCount(int userid)
        {

            int ncount = -1;
            //string   wishList = Request.Form["WISHLIST"];
            // int count=-1;
            // Session["Count"] = 0;
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            string strsql = "select Count(*) from LH_WishList where UserId=@userid";
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(strsql, con);
                cmd.Parameters.AddWithValue("@userid", userid);
                ncount = (int)cmd.ExecuteScalar();
                // HttpContext.Current.Session["Count"] = ncount;
                //for (int Count = 0; Count <= ncount; ncount++)
                //{
                //Session["CountWishIcon"] = ncount;
                //Label wishList = (Label)this.form1.FindControl("wishList");
                //wishIconList_ex.InnerText = ncount.ToString();
                //}

                //  wishList.InnerText =Convert.ToString(ncount);
                // wishList.InnerText=             HttpContext.Current.Session["Count"].ToString();
                //Label wishList = (Label)page.FindControl("wishList");
                //  ncount = ncount - 1;
                return ncount;

            }


            catch (System.Data.SqlClient.SqlException ex)
            {

                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                con.Close();

            }

        }
        public int GetCountWishlist(int userid)
        {

            int ncount = -1;
            //string   wishList = Request.Form["WISHLIST"];
            // int count=-1;
            // Session["Count"] = 0;
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            string strsql = "select Count(*) from LH_WishList where UserId=@userid";
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(strsql, con);
                cmd.Parameters.AddWithValue("@userid", userid);
                ncount = (int)cmd.ExecuteScalar();
                // HttpContext.Current.Session["Count"] = ncount;
                //for (int Count = 0; Count <= ncount; ncount++)
                //{
                //Session["CountWishIcon"] = ncount;
                //Label wishList = (Label)this.form1.FindControl("wishList");
                //wishIconList_ex.InnerText = ncount.ToString();
                //}

                wishIconList_ex.InnerText = Convert.ToString(ncount);
                // wishList.InnerText=             HttpContext.Current.Session["Count"].ToString();
                //Label wishList = (Label)page.FindControl("wishList");
                return ncount;

            }


            catch (System.Data.SqlClient.SqlException ex)
            {

                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                con.Close();

            }

        }
        protected void createProduct(int productID, string image, string title, string description, float pricev,int i, int earnedLP)
        {
            HtmlGenericControl mainDiv = new HtmlGenericControl("div");
            mainDiv.Attributes["class"] = "col-sm-6 col-md-4";
            mainDiv.Attributes["id"] = "main_" + i;
            HtmlGenericControl li = new HtmlGenericControl("li");
            li.Attributes["class"] = "list-group-item";
            HtmlGenericControl innerDiv = new HtmlGenericControl("div");
            innerDiv.Attributes["class"] = "product-container";

            HtmlGenericControl wishList = new HtmlGenericControl("a");
            wishList.Attributes["class"] = "heart";
            wishList.Attributes["title"] = "";
            wishList.Attributes["href"] = "#";
            HtmlGenericControl wishListI1 = new HtmlGenericControl("i");
            wishListI1.Attributes["class"] = "fa fa-heart-o";
            wishListI1.Attributes["aria-hidden"] = "true";
            wishList.Controls.Add(wishListI1);

            HtmlGenericControl wishListI2 = new HtmlGenericControl("i");
            wishListI2.Attributes["class"] = "fa fa-heart";
            wishListI2.Attributes["aria-hidden"] = "true";
            wishListI2.Attributes["id"] = "wish_" + i;
            wishListI2.Attributes["style"] = "color:lightred;opacity:10";
            wishListI2.Attributes["onclick"] = "javascript: removeWishList(" + productID + ","+i+");";
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
            productImage.Attributes["src"] =  image;

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
            pATC.Controls.Add(new LiteralControl("Earning <strong>"+earnedLP+" LP</strong>"));

            addToCart.Controls.Add(pATC);

            HtmlGenericControl buttonATC = new HtmlGenericControl("button");
            buttonATC.Attributes["type"] = "button";
            buttonATC.Attributes["class"] = "btn btn-default add-card";
            buttonATC.Attributes["onclick"] = "javascript: add2Cart(" + productID + ","+i+");";
            buttonATC.Controls.Add(new LiteralControl("<i class='fa fa-shopping-cart' aria-hidden='true'></i>Add to Cart"));
            addToCart.Controls.Add(buttonATC);
            innerDiv.Controls.Add(addToCart);

            li.Controls.Add(innerDiv);
            HtmlGenericControl iteration = new HtmlGenericControl("input");
            iteration.Attributes["id"] = "iteration_" + i;
            iteration.Attributes["value"] = i.ToString();
            iteration.Attributes["hidden"] = "hidden";
            mainDiv.Controls.Add(iteration);
            mainDiv.Controls.Add(li);
            productList.Controls.Add(mainDiv);
        }

        [System.Web.Services.WebMethod]
        public static int Add2Cart(int userid, int productid)
        {
            int cnt = 0;
            bool BRecExist = false;
            try
            {
                SqlConnection con1 = new SqlConnection(Login.GetConnectionString());
                SqlCommand cmd1 = new SqlCommand("select product_ID from LH_cart where user_ID = " + userid + " and product_ID=" + productid + " ", con1);
                con1.Open();
                SqlDataReader reader = cmd1.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                con1.Close();
                int numRows = dt.Rows.Count;
                if (numRows > 0)
                {
                    BRecExist = true;
                    return 0;
                }
                else
                {
                    BRecExist = false;

                }

                if (userid != null && productid != null)
                {
                    SqlConnection con = new SqlConnection(Login.GetConnectionString());
                    string Sql = "insert into LH_cart(user_ID,product_ID,quantity)values(@val1,@val2,1)";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(Sql, con);
                    cmd.Parameters.AddWithValue("@val1", userid);
                    cmd.Parameters.AddWithValue("@val2", productid);
                   
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();

                    con.Close();
                    //  GetCount(userid);
                    cnt = GetCartCount(userid);

                }

            }
            catch (Exception ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            if (BRecExist == false)
                return cnt;
            else
                return 0;

        }
        public static int GetCartCount(int userid)
        {

            int ncount = -1;
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            string strsql = "select Count(*) from LH_cart where user_ID=@userid";
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(strsql, con);
                cmd.Parameters.AddWithValue("@userid", userid);
                ncount = (int)cmd.ExecuteScalar();

                return ncount;

            }


            catch (System.Data.SqlClient.SqlException ex)
            {

                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                con.Close();

            }

        }

        public int GetCountofCart(int userid)
        {

            int ncount = -1;
            //string   wishList = Request.Form["WISHLIST"];
            // int count=-1;
            // Session["Count"] = 0;
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            string strsql = "select Count(*) from LH_cart where user_ID=@userid";
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(strsql, con);
                cmd.Parameters.AddWithValue("@userid", userid);
                ncount = (int)cmd.ExecuteScalar();
                CartIconList_ex.InnerText = Convert.ToString(ncount);

                return ncount;

            }


            catch (System.Data.SqlClient.SqlException ex)
            {

                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                con.Close();

            }

        }
    }
}