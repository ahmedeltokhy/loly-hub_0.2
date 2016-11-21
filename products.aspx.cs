using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;

namespace loly_hub_0._2
{
    public partial class products : System.Web.UI.Page
    {
        //  bool recordexist = false;
        int userID = -1;
        int cat = -1;
        public bool record = false;
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
                if (Login.checkLogin(username, email, pwd, isSession) == null || userID == -1)
                {
                    Response.Redirect("Login.aspx");
                }

                usernametxt.InnerText = username.ToString();
                hdfuserid.Value = userID.ToString();
                int nuserid = Convert.ToInt32(hdfuserid.Value);
                GetCountWishlist(nuserid);
                GetCountofCart(nuserid);

                //wishListTxt.InnerText = Login.countWishList(userID).ToString();

                //cartTxt.InnerText = Login.countCart(userID).ToString();
                lhptxt.InnerText = (Login.UserLHP(userID) + Login.getProgramsCount(userID)).ToString();
                usernametxt.InnerText = username;
                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                SqlCommand cmd;
                string strsql;
                SqlDataReader dr;
                try
                {

                    if (Request.QueryString["cat"] == null || !int.TryParse(Request.QueryString["cat"], out cat))
                    {





                        strsql = "SELECT LP.ID,LP.title,LP.description,LP.price,LP.earnedLP,LP.category,LPI.ID,LPI.image,LPI.product_id,LHW.ID,CASE WHEN LHW.ID IS NULL THEN '0' ELSE '1' END AS IsSelected FROM LH_PRODUCT LP JOIN LH_PRODUCT_IMAGE LPI ON LPI.ID =" +
                           "(SELECT TOP 1 LPII.ID FROM LH_PRODUCT_IMAGE LPII WHERE LPII.PRODUCT_ID=LP.ID) LEFT join LH_WISHLIST LHW ON LHW.ID  =" + "(SELECT ID FROM LH_WISHLIST LHWW WHERE LHWW.PRODUCTID = LP.ID AND USERID = @userID) ";
                        con.Open();
                        cmd = new SqlCommand(strsql, con);
                        cmd.Parameters.AddWithValue("@userID", userID);
                        dr = cmd.ExecuteReader();
                        int i = 0;
                        while (dr.Read())
                        {
                            createProduct(int.Parse(dr[0].ToString()), dr["image"].ToString(), dr["title"].ToString(), dr["description"].ToString(), float.Parse(dr["price"].ToString()), dr["IsSelected"].ToString(),i,int.Parse(dr["earnedLP"].ToString()));
                            i++;
                        }
                        con.Close();

                    }

                    else
                    {
                        con = new SqlConnection(Login.GetConnectionString());
                        strsql = "SELECT LP.ID,LP.title,LP.earnedLP,LP.description,LP.price,LP.category,LPI.ID,LPI.product_id,LPI.image,LHW.ID,CASE WHEN LHW.ID IS NULL THEN '0' ELSE '1' END AS IsSelected FROM LH_PRODUCT LP JOIN LH_PRODUCT_IMAGE LPI ON LPI.ID =" +
                           "(SELECT TOP 1 LPII.ID FROM LH_PRODUCT_IMAGE LPII WHERE LPII.PRODUCT_ID=LP.ID) LEFT join LH_WISHLIST LHW ON LHW.ID  =" + "(SELECT ID FROM LH_WISHLIST LHWW WHERE LHWW.PRODUCTID = LP.ID AND USERID = @userID) where LP.category = @category";
                        con.Open();
                        cmd = new SqlCommand(strsql, con);
                        cmd.Parameters.AddWithValue("@userID", userID);
                        cmd.Parameters.AddWithValue("@category", cat);
                        dr = cmd.ExecuteReader();
                        int i = 0;
                        while (dr.Read())
                        {
                            createProduct(int.Parse(dr[0].ToString()), dr["image"].ToString(), dr["title"].ToString(), dr["description"].ToString(), float.Parse(dr["price"].ToString()), dr["IsSelected"].ToString(),i,int.Parse(dr["earnedLP"].ToString()));
                            i++;
                        }
                        con.Close();

                        strsql = "select * from LH_Category where id = @id";

                        con.Open();
                        cmd = new SqlCommand(strsql, con);

                        cmd.Parameters.AddWithValue("@id", cat);

                        dr = cmd.ExecuteReader();

                        while (dr.Read())
                        {
                            pagetitle.InnerText = dr["category_name"].ToString();
                        }

                        con.Close();
                    }




                    con.Open();
                    strsql = "select * from LH_Programs join LH_Rates on LH_Programs.program = LH_Rates.Program_ID join LH_programs_list on LH_Programs.program = LH_programs_list.ID where LH_Rates.Approved = 1 and LH_Programs.User_Id =  @userID";
                    cmd = new SqlCommand(strsql, con);
                    cmd.Parameters.AddWithValue("@userID", userID);
                    dr = cmd.ExecuteReader();
                    float total = 0;
                    while (dr.Read())
                    {
                        HtmlGenericControl walletGrid = new HtmlGenericControl("div");
                        walletGrid.Attributes["class"] = "wallet-grid";
                        HtmlGenericControl name = new HtmlGenericControl("h4");
                        name.InnerText = dr["name"].ToString();
                        walletGrid.Controls.Add(name);

                        HtmlGenericControl ul = new HtmlGenericControl("ul");
                        HtmlGenericControl li1 = new HtmlGenericControl("li");
                        li1.Controls.Add(new LiteralControl("You hace <b>" + dr["points"] + "</b> Points"));
                        ul.Controls.Add(li1);
                        HtmlGenericControl li2 = new HtmlGenericControl("li");
                        li2.Controls.Add(new LiteralControl("Value mony: <b>" + float.Parse(dr["rate"].ToString()) * float.Parse(dr["points"].ToString()) + " SAR</b>"));
                        ul.Controls.Add(li2);
                        HtmlGenericControl points = new HtmlGenericControl("h5");
                        points.Attributes["class"] = "points";
                        points.Controls.Add(new LiteralControl(float.Parse(dr["rate"].ToString()) * float.Parse(dr["points"].ToString()) + " Loly Points (i)"));
                        ul.Controls.Add(points);
                        walletGrid.Controls.Add(ul);

                        walletContainer.Controls.Add(walletGrid);

                        total += float.Parse(dr["rate"].ToString()) * float.Parse(dr["points"].ToString());


                    }
                    con.Close();
                    string query = "select LHP from LH_User where Id = @id";
                    con.Open();

                    cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@id", userID);

                     dr = cmd.ExecuteReader();
                    int earned = 0;
                    while (dr.Read())
                    {
                        earned = int.Parse(dr["LHP"].ToString());
                    }
                    balance.InnerText = earned.ToString();
                    con.Close();

                    totaltxt.InnerText = total.ToString();

                    strsql = "select * from LH_category";
                    con.Open();
                    cmd = new SqlCommand(strsql, con);

                    dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        categoryItems.Controls.Add(new LiteralControl(" <li><a href='products.aspx?cat=" + dr["id"] + "'>" + dr["category_name"] + "</a></li>"));
                    }
                    con.Close();
                }
                catch (Exception exc)
                {

                    throw;
                }
            }
            else
            {
                Response.Redirect("logout.aspx");
            }

        }

        protected void search_button_click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                //string strsql = "select * from LH_product join LH_product_image on  LH_product_image.ID =" +
                //    "(select top 1 LH_product_image.ID from LH_product_image where LH_product_image.product_id = LH_product.ID) where LH_product.title like @searchTxt or LH_product.description like @searchTxt";

                string strsql = "SELECT LP.ID,LP.title,LP.description,LP.earnedLP,LP.price,LP.category,LPI.ID,LPI.product_id,LPI.image,LHW.ID,CASE WHEN LHW.ID IS NULL THEN '0' ELSE '1' END AS IsSelected FROM LH_PRODUCT LP JOIN LH_PRODUCT_IMAGE LPI ON LPI.ID =" +
                    "(SELECT TOP 1 LPII.ID FROM LH_PRODUCT_IMAGE LPII WHERE LPII.PRODUCT_ID=LP.ID) LEFT join LH_WISHLIST LHW ON LHW.ID  =" + "(SELECT ID FROM LH_WISHLIST LHWW WHERE LHWW.PRODUCTID = LP.ID AND USERID = @userID)  where LP.title like @searchTxt or LP.description like @searchTxt ";


                con.Open();
                SqlCommand cmd = new SqlCommand(strsql, con);
                cmd.Parameters.AddWithValue("searchTxt", "%" + search_txt.Value + "%");
                cmd.Parameters.AddWithValue("@userID", userID);
                SqlDataReader dr = cmd.ExecuteReader();

                productList.InnerHtml = "";
                int i = 0;
                while (dr.Read())
                {
                    createProduct(int.Parse(dr[0].ToString()), dr["image"].ToString(), dr["title"].ToString(), dr["description"].ToString(), float.Parse(dr["price"].ToString()), dr["IsSelected"].ToString(),i,int.Parse(dr["earnedLP"].ToString()));
                    i++;
                }
                con.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void createProduct(int productID, string image, string title, string description, float pricev, string isSelectedstr, int i, int earnedLP)
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
            wishListI2.Attributes["id"] = "wish_" + i.ToString();
            if (isSelectedstr == "1")
            {

                wishListI2.Attributes["style"] = "color:lightred;opacity:10";
                wishListI2.Attributes["onclick"] = "javascript: removeWishList(" + productID + ","+i+");";
            }
            else
                wishListI2.Attributes["onclick"] = "javascript: fnAddWishIcon(" + productID + "," + i + ");";


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
            pATC.Controls.Add(new LiteralControl("Earning <strong>"+earnedLP+" LP</strong>"));

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

        protected void Addprograms(object sender, EventArgs e)
        {
            Response.Redirect("AddProgram.aspx");
        }
        [System.Web.Services.WebMethod]
        public static int Add2Cart(int userid, int productid, int quantity)
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
                    string Sql = "insert into LH_cart(user_ID,product_ID,quantity)values(@val1,@val2,@val3)";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(Sql, con);
                    cmd.Parameters.AddWithValue("@val1", userid);
                    cmd.Parameters.AddWithValue("@val2", productid);
                    cmd.Parameters.AddWithValue("@val3", quantity);
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();

                    con.Close();
                    //  GetCount(userid);
                    cnt = GetCartCount(userid);

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
                cartTxt.InnerText = Convert.ToString(ncount);

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

                wishListTxt.InnerText = Convert.ToString(ncount);
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
    }
}