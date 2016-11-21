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
    public partial class product : System.Web.UI.Page
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

                if (Login.checkLogin(username, email, pwd, clsRidjindalEncryption.Decrypt(Session["login"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256) == "1") == null || userID == -1)
                {
                    Response.Redirect("Login.aspx");
                }
                int productID;
                if (Request.QueryString["id"] == null || !int.TryParse(Request.QueryString["id"], out productID))
                {
                    Response.Redirect("Products.aspx");
                }
                else
                {
                    lhptxt.InnerText = (Login.UserLHP(userID) + Login.getProgramsCount(userID)).ToString(); 
                    usernametxt.InnerText = username;
                    hdfuserid.Value = userID.ToString();
                    wishListTxt.InnerText = Login.countWishList(userID).ToString();
                    cartTxt.InnerText = Login.countCart(userID).ToString();
                    title_label.InnerText = productID.ToString();
                    SqlConnection con = new SqlConnection(Login.GetConnectionString());
                    SqlConnection con1 = new SqlConnection(Login.GetConnectionString());
                    string strsql = "select * from LH_product join LH_category on LH_product.category = LH_category.id where LH_product.id =@productID";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(strsql, con);
                    cmd.Parameters.AddWithValue("@productID", productID);
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        title_label.InnerText = dr["title"].ToString();
                        titleTxt.InnerText = dr["title"].ToString();
                        categoryLink.HRef = "products.aspx?id=" + dr["id"].ToString();
                        categoryLink.InnerText = dr["category_name"].ToString();
                        wishList.Attributes["onclick"] = "javascript: fnAddWishIcon(" + productID + ");";
                        price.InnerText = dr["price"].ToString();
                        strsql = "select * from LH_product_image where product_id =@productID";
                        con1.Open();
                        cmd = new SqlCommand(strsql, con1);
                        cmd.Parameters.AddWithValue("@productID", productID);
                        SqlDataReader dr1 = cmd.ExecuteReader();
                        bool firstImageFlag = true;
                        while (dr1.Read())
                        {
                            HtmlGenericControl li = new HtmlGenericControl("li");
                            if (firstImageFlag)
                            {
                                li.Attributes["class"] = "active";
                                firstImageFlag = false;
                                firstImage.Src = dr1["image"].ToString();
                            }
                            HtmlGenericControl img = new HtmlGenericControl("img");
                            img.Attributes["src"] = dr1["image"].ToString();
                            li.Controls.Add(img);
                            productImage.Controls.Add(li);
                        }
                    }

                    SqlConnection conn = new SqlConnection(Login.GetConnectionString());
                    string strsql1 = "select * from LH_Programs join LH_Rates on LH_Programs.program = LH_Rates.Program_ID join LH_programs_list on LH_Programs.program = LH_programs_list.ID where LH_Rates.Approved = 1 and LH_Programs.User_Id = @userID";
                    conn.Open();
                    SqlCommand cmd1 = new SqlCommand(strsql1, conn);
                    cmd1.Parameters.AddWithValue("@userID", hdfuserid.Value);
                    SqlDataReader dr2 = cmd1.ExecuteReader();

                    int i = 0;
                    while (dr2.Read())
                    {
                        i++;
                        Createprogram(int.Parse(dr2[1].ToString()), dr2[10].ToString(), dr2["logo"].ToString(), dr2["name"].ToString(), dr2["points"].ToString(), dr2["program"].ToString(), i);
                        //  wishlistbar(dr2[16].ToString());
                    }
                    conn.Close();
                }
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }

        [System.Web.Services.WebMethod]
        public static int AddWishlist(int userid, int productid)
        {
            //  int userid = int.Parse(Request.Form["userID"]); int productid = int.Parse(Request.Form["productID"]);
            //  Response.Write("AAA----UserID:"+userid.ToString()+"----productID:"+productid.ToString());
            int cnt = 0;
            try
            {

                if (userid != null && productid != null)
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
                    //  GetCount(userid);
                    //    Product p = new Product();
                    //p.GetCount(userid);

                    //   cnt = p.GetCount(userid);
                }

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            return cnt;
        }
        public static string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        }
        //  [System.Web.Services.WebMethod]
        public int GetCount(int userid)
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
                Session["CountWishIcon"] = ncount;
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
        private void Add()
        {

        }
        protected void Createprogram(int User_Id, string Rates, string logo, string name, string points, string program, int colCnt)
        {
            HtmlGenericControl maindiv = new HtmlGenericControl("div");
            maindiv.Attributes["class"] = "col-xs-6 ocol-sm-4 col-md-3 col-lg-2";

            HtmlGenericControl item = new HtmlGenericControl("div");
            item.Attributes["class"] = "item";
            item.Attributes["data-id"] = "co-" + colCnt;

            HtmlGenericControl a = new HtmlGenericControl("a");
            a.Attributes["href"] = "#";

            HtmlGenericControl img = new HtmlGenericControl("img");
            img.Attributes["src"] =  logo;
            a.Controls.Add(img);

            HtmlGenericControl span = new HtmlGenericControl("span");
            span.Attributes["class"] = "icon";
            HtmlGenericControl i = new HtmlGenericControl("i");
            i.Attributes["class"] = "fa fa-check-circle";

            span.Controls.Add(i);

            HtmlGenericControl input = new HtmlGenericControl("input");
            input.Attributes["type"] = "hidden";
            // input.Attributes["Value"] = points;

            input.Attributes["Value"] = points + "$" + Rates + "$" + program;
            hdnpoints.Value = points;



            a.Controls.Add(input);
            a.Controls.Add(span);

            item.Controls.Add(a);
            maindiv.Controls.Add(item);




            programs.Controls.Add(maindiv);



            //HtmlGenericControl innerdiv = new HtmlGenericControl("div");
            //innerdiv.Attributes["class"] = "row";
        }
        [System.Web.Services.WebMethod]
        public static bool AddProceed(int userid, string[] arrSubProducts, string[] arrSubPoints, int quantity)
        {
            bool result = false;
            try
            {

                string Sql = "";
                for (int i = 0; i < arrSubPoints.Length; i++)
                {
                    int calPoints = 0;
                    int points = 0;

                    string Sqlex = "";
                    Sqlex = "select Points from lh_programs where User_Id=" + userid + " and program=" + arrSubProducts[i];

                    try
                    {
                        SqlConnection con = new SqlConnection(Login.GetConnectionString());
                        con.Open();
                        SqlCommand cmd = new SqlCommand(Sqlex, con);
                        cmd.CommandType = CommandType.Text;
                        points = (Int32)cmd.ExecuteScalar();
                        con.Close();
                    }
                    catch (System.Data.SqlClient.SqlException ex)
                    {
                        string msg = "Insert Error:";
                        msg += ex.Message;
                        result = false;
                        throw new Exception(msg);
                    }

                    if (arrSubProducts[i].Length > 0 && arrSubPoints[i].Length > 0)
                    {
                        if (points == -1)
                            points = 0;
                        if (String.IsNullOrEmpty(arrSubPoints[i]))
                            arrSubPoints[i] = "0";
                        int npointa = points;
                        int npointb = Convert.ToInt32(arrSubPoints[i]);
                        calPoints = npointa - npointb;
                        if (i == 0)
                        {
                            Sql = " update LH_Programs set Points=" + calPoints + ", Update_Date=getDate() where User_Id=" + userid + " AND program=" + arrSubProducts[i] + "; ";
                            Sql += " insert into LH_Order(Product_ID,UseID,Quantity,Shipment_status,CreateDate,Updatedate) values(" + arrSubProducts[i] + ", " + userid + "," + quantity + ",0,getdate(),getdate())";
                        }
                        else
                        {
                            Sql += " update LH_Programs set Points=" + calPoints + ", Update_Date=getDate() where User_Id=" + userid + " AND program=" + arrSubProducts[i] + "; ";
                            Sql += " insert into LH_Order(Product_ID,UseID,Quantity,Shipment_status,CreateDate,Updatedate) values(" + arrSubProducts[i] + ", " + userid + "," + quantity + ",0,getdate(),getdate())";
                        }
                    }
                }
                if (userid.ToString().Length > 0)
                {
                    SqlConnection con = new SqlConnection(Login.GetConnectionString());
                    con.Open();
                    SqlCommand cmd = new SqlCommand(Sql, con);
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    result = true;
                  
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                result = false;
                throw new Exception(msg);
            }
            return result;
        }
    }
}
