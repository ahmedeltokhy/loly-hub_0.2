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
    public partial class Cart : System.Web.UI.Page
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
                int cnt = 0;
                lhptxt.InnerText = (Login.UserLHP(userID) + Login.getProgramsCount(userID)).ToString(); ;
                hdfuserid.Value = userID.ToString();
                int nuserid = Convert.ToInt32(hdfuserid.Value);
                GetCountWishlist(nuserid);
                GetCountofCart(nuserid);
                cartuser.InnerText = username;
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
                    Createprogram(int.Parse(dr2["User_Id"].ToString()), double.Parse(dr2["Rate"].ToString()), dr2["logo"].ToString(), dr2["name"].ToString(), dr2["points"].ToString(), dr2["program"].ToString(), i,dr2["username"].ToString());
                    //  wishlistbar(dr2[16].ToString());

                }
                conn.Close();

                SqlConnection con1 = new SqlConnection(Login.GetConnectionString());
                string strsql = "select * from LH_product LHP join LH_Cart LHC on LHC.product_ID = LHP.ID " +
                    "join LH_product_image LHI on  LHI.ID = (select top 1 LHII.ID from LH_product_image LHII where LHII.product_id = LHP.ID) WHERE LHC.user_ID=@userID";
                con1.Open();
                SqlCommand cmd = new SqlCommand(strsql, con1);
                cmd.Parameters.AddWithValue("@userID", hdfuserid.Value);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    cnt++;
                    CreateCart(dr["title"].ToString(), dr["description"].ToString(), float.Parse(dr["price"].ToString()), dr["image"].ToString(), dr["ID"].ToString());
                    kk.InnerText = Convert.ToString(cnt);
                    //  string totlpts = totalpnts.InnerText;

                }
                con1.Close();

            }
            else
            {
                Response.Redirect("logout.aspx");
            }
            
        }
        public static string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        }
        protected void CreateCart(string title, string description, float price, string image1, string productID)
        {
            HtmlGenericControl maindiv = new HtmlGenericControl("div");
            maindiv.Attributes["class"] = "item";

            HtmlGenericControl th = new HtmlGenericControl("div");
            th.Attributes["class"] = "thumb";

            HtmlGenericControl pic = new HtmlGenericControl("img");
            pic.Attributes["src"] =  image1;
            pic.Attributes["alt"] = "";
            th.Controls.Add(pic);
            maindiv.Controls.Add(th);

            HtmlGenericControl itmc = new HtmlGenericControl("div");
            itmc.Attributes["class"] = "item-title";

            HtmlGenericControl a = new HtmlGenericControl("a");
            a.Attributes["href"] = "product.aspx?id="+productID;
            
            a.Controls.Add(new LiteralControl(title));
            itmc.Controls.Add(a);

            HtmlGenericControl productIDA = new HtmlGenericControl("input");
            productIDA.Attributes["value"] = productID;
            productIDA.Attributes["class"] = "productID";
            productIDA.Attributes["hidden"] = "hidden";
            itmc.Controls.Add(productIDA);

            maindiv.Controls.Add(itmc);

            HtmlGenericControl qnty = new HtmlGenericControl("div");
            qnty.Attributes["class"] = "quantity";

            HtmlGenericControl p1 = new HtmlGenericControl("p");
            p1.Controls.Add(new LiteralControl("Quantity "));
            qnty.Controls.Add(p1);
            //  maindiv.Controls.Add(qnty);

            HtmlGenericControl lpcnt = new HtmlGenericControl("div");
            lpcnt.Attributes["class"] = "lp-countEx";

            HtmlGenericControl bplus = new HtmlGenericControl("div");
            bplus.Attributes["class"] = "bttn plus";

            HtmlGenericControl i1 = new HtmlGenericControl("i");
            i1.Attributes["class"] = "fa fa-plus";
            bplus.Controls.Add(i1);
            lpcnt.Controls.Add(bplus);
            qnty.Controls.Add(lpcnt);

            HtmlGenericControl input1 = new HtmlGenericControl("input");
            input1.Attributes["type"] = "text";
            input1.Attributes["id"] = "qnty";
            input1.Attributes["Class"] = "quantities";
            input1.Attributes["value"] = "1";
            lpcnt.Controls.Add(input1);
            qnty.Controls.Add(lpcnt);

            HtmlGenericControl bminus = new HtmlGenericControl("div");
            bminus.Attributes["class"] = "bttn minus";

            HtmlGenericControl i2 = new HtmlGenericControl("i");
            i2.Attributes["class"] = "fa fa-minus";
            bminus.Controls.Add(i2);
            lpcnt.Controls.Add(bminus);
            qnty.Controls.Add(lpcnt);

            maindiv.Controls.Add(qnty);

            HtmlGenericControl prclp = new HtmlGenericControl("div");
            prclp.Attributes["class"] = "price-lp";

            HtmlGenericControl p2 = new HtmlGenericControl("p");
            p2.Controls.Add(new LiteralControl(price + "LP"));
            prclp.Controls.Add(p2);

            HtmlGenericControl h1 = new HtmlGenericControl("h4");
            h1.Controls.Add(new LiteralControl(Convert.ToString(price)));
            prclp.Controls.Add(h1);
            maindiv.Controls.Add(prclp);

            HtmlGenericControl rmv = new HtmlGenericControl("div");
            rmv.Attributes["class"] = "remove";
            HtmlGenericControl p3 = new HtmlGenericControl("p");
            HtmlGenericControl a1 = new HtmlGenericControl("a");
             a1.Attributes["class"] = "remove-item";
          //  a1.Attributes["id"] = "deletecartitem";
            a1.Attributes["href"] = "#";

            HtmlGenericControl i3 = new HtmlGenericControl("i");
            i3.Attributes["class"] = "fa fa-times-circle-o";
            i3.Attributes["id"] = "deletecartitem";
            i3.Attributes["onclick"] = "deleteCartItem("+productID+","+userID+")";
            a1.Controls.Add(i3);
            p3.Controls.Add(a1);
            rmv.Controls.Add(p3);
            maindiv.Controls.Add(rmv);

            container1.Controls.Add(maindiv);

        }
        [System.Web.Services.WebMethod]
        public static int Deletecartitem(int userid, int productID)
        {
           
           

            int cnt = 0;
            try
            {
                
               
                {
                    SqlConnection con1 = new SqlConnection(Login.GetConnectionString());
                    string Sql1 = "delete from LH_cart where user_ID=@userid and product_ID=@product_ID";
                    con1.Open();
                    SqlCommand cmd1 = new SqlCommand(Sql1, con1);
                    cmd1.Parameters.AddWithValue("@UserId", userid);
                    cmd1.Parameters.AddWithValue("@product_ID", productID);
                    cmd1.CommandType = CommandType.Text;
                    cmd1.ExecuteNonQuery();
                    con1.Close();
                    //  GetCount(userid);
                    //Product p = new Product();
                    //p.GetCount(userid);

                    cnt = GetCount(userid);
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

        public static int GetCount(int userid)
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
        protected void Createprogram(int User_Id, double Rates, string logo, string name, string points, string program, int colCnt,string username)
        {
            HtmlGenericControl maindiv = new HtmlGenericControl("div");
            maindiv.Attributes["class"] = "col-xs-6 ocol-sm-4 col-md-3 col-lg-2";

            HtmlGenericControl item = new HtmlGenericControl("div");
            item.Attributes["class"] = "item";
            item.Attributes["data-id"] = "co-" + colCnt;

            HtmlGenericControl a = new HtmlGenericControl("a");
            a.Attributes["href"] = "#";

            HtmlGenericControl img = new HtmlGenericControl("img");
            img.Attributes["src"] = logo;
            a.Controls.Add(img);

            HtmlGenericControl span = new HtmlGenericControl("span");
            span.Attributes["class"] = "icon";
            HtmlGenericControl i = new HtmlGenericControl("i");
            i.Attributes["class"] = "fa fa-check-circle";

            span.Controls.Add(i);

            HtmlGenericControl input = new HtmlGenericControl("input");
            input.Attributes["type"] = "hidden";
            // input.Attributes["Value"] = points;

            input.Attributes["Value"] = points + "$" + Rates + "$" + program + "$" +username;
            hdnpoints.Value = points;
            a.Controls.Add(input);

            HtmlGenericControl usernameHidden = new HtmlGenericControl("input");
            usernameHidden.Attributes["type"] = "hidden";
            usernameHidden.Attributes["class"] = "ProgramUserName";
            usernameHidden.Attributes["Value"] = username;
         //   a.Controls.Add(usernameHidden);
            a.Controls.Add(span);

            item.Controls.Add(a);
            maindiv.Controls.Add(item);




            programs.Controls.Add(maindiv);



            //HtmlGenericControl innerdiv = new HtmlGenericControl("div");
            //innerdiv.Attributes["class"] = "row";
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
        [System.Web.Services.WebMethod]
        public static string AddProceed1(int userid, string[][] products, string[][] programs)
        {
            try
            {
                webService.Service1Client client1 = new webService.Service1Client();
                WebService3.Service1Client client2 = new WebService3.Service1Client();
                for (int i = 0; i < programs.Length; i++)
                {
                    switch (programs[i][0])
                    {
                        case "1":

                            int result1 = client1.subtract(programs[i][2], int.Parse( programs[i][1]));
                            if (result1 == -1)
                            {
                                //rollBack
                                rollBack(programs);

                                return "general error in STC program ";
                            }
                            else if (result1 == -2)
                            {
                                //rollBack
                                rollBack(programs);

                                return "Insufficient Points for STC program ";
                            }
                            else
                            {
                                programs[i][3] = result1.ToString(); 
                            }
                            break;

                        case "2":
                            int result2 = client2.subtract(programs[i][2], int.Parse(programs[i][1]));
                            if (result2 == -1)
                            {
                                //rollBack
                                rollBack(programs);
                                return "general error in Delta program ";
                            }
                           else if (result2 == -2)
                            {
                                //rollBack
                                rollBack(programs);
                                return "Insufficient Points for Delta program ";
                            }
                            else
                            {
                                //save checkout
                                programs[i][3] = result2.ToString();
                            }
                            break;

                        
                    }
                }
                if (!saveCheckout(userid,products))
                {
                    rollBack(programs);
                    return ("Error Saving the products");
                }
                return "Done.";

            }
            catch (Exception e)
            {
                return "General Error!";
                throw;
            }
            
        }

        private static void rollBack(string[][] programs)
        {
            for (int i = 0; i <programs.Length; i++)
            {
                switch (programs[i][0])
                {
                    case "1":
                        webService.Service1Client client1 = new webService.Service1Client();

                        if (programs[i][3] !=null) client1.rollBack(programs[i][2], int.Parse(programs[i][3]));
                        break;

                    case "2":

                        WebService3.Service1Client client2 = new WebService3.Service1Client();
                        if (programs[i][3] != null) client2.rollBack(programs[i][2], int.Parse(programs[i][3]));
                        break;
                    default:
                        break;
                }
            }
        }

        private static bool saveCheckout(int userid,string[][] products)
        {
            try
            {
                //save checkout
                SqlConnection con = new SqlConnection(Login.GetConnectionString());

                string query = "insert into LH_Order([UseID],[Shipment_status],[CreateDate],[Updatedate]) OUTPUT INSERTED.ID values(@userID,0,getDate(),getDate())";

                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@userID", userid);

                int orderID = (int)cmd.ExecuteScalar();

                con.Close();
                for (int j = 0; j < products.Length; j++)
                {

                    query = "INSERT INTO [LH_order_details]([OrderId],[ProductId],[Quantity],[CreateDate],[UpdateDate]) OUTPUT INSERTED.ID VALUES(@OrderId,@ProductId,@Quantity,getDate(),getDate())";

                    con.Open();

                    cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@orderId", orderID);
                    cmd.Parameters.AddWithValue("@ProductId", products[j][0]);
                    cmd.Parameters.AddWithValue("@Quantity", products[j][1]);

                    cmd.ExecuteReader();
                    con.Close();
                }

                for (int i = 0; i < products.Length; i++)
                {
                    query = "delete from LH_cart where user_ID = @userID and  product_ID = @productID";
                    con.Open();

                    cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@userID", userid);
                    cmd.Parameters.AddWithValue("@ProductID", products[i][0]);

                    cmd.ExecuteReader();

                    con.Close();
                }
                int totalEarned = 0;
                for (int i = 0; i < products.Length; i++)
                {
                    query = "select * from LH_Product where ID = @productID";
                    con.Open();

                    cmd = new SqlCommand(query, con);

                   
                    cmd.Parameters.AddWithValue("@ProductID", products[i][0]);

                   SqlDataReader dr =  cmd.ExecuteReader();
                    while (dr.Read())
                    {

                        int earned = int.Parse(dr["earnedLP"].ToString());
                        totalEarned += earned;

                    }
                    con.Close();
                }

                query = "update LH_User set LHP = LHP+@earned where id=@id";
                con.Open();
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@earned",totalEarned);
                cmd.Parameters.AddWithValue("@id",userid);
                cmd.ExecuteReader();

                con.Close();
                return true;
            }
            catch (Exception e)
            {

                return false;
            }

        }
    }
}