using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace loly_hub_0._2
{
    public partial class AddProgram : System.Web.UI.Page
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


                int id = Convert.ToInt32(userID.ToString());
                GetCount(id);
                wishListTxt.InnerText = Session["Count"].ToString();
                GetCartCount(id);
                cartTxt.InnerText = Session["CartCount"].ToString();
                usernametxt.InnerText = username;

                //wishListTxt.InnerText = Login.countWishList(userID).ToString();

                //cartTxt.InnerText = Login.countCart(userID).ToString();

                lhptxt.InnerText = (Login.UserLHP(userID)+Login.getProgramsCount(userID)).ToString();

                if (!IsPostBack)
                {
                    SqlConnection con = new SqlConnection(Login.GetConnectionString());
                    string query = "select * from LH_programs_list where id not in(select program from LH_Programs where user_Id = @userID)";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@userID", userID);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        createProgram(int.Parse(dr["id"].ToString()), dr["logo"].ToString());
                    }
                    programList.Controls.Add(new HtmlGenericControl("li"));
                    con.Close();





                    query = "select * from LH_Programs_category";

                    con.Open();

                    cmd = new SqlCommand(query, con);

                    dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        ListItem option = new ListItem(dr["name"].ToString(), dr["id"].ToString());
                        programCategory.Items.Add(option);
                    }

                }
                SqlConnection con1 = new SqlConnection(Login.GetConnectionString());
                string query1 = "select * from LH_Programs join LH_Programs_List on LH_Programs.program = LH_programs_list.id where user_Id = @userID";
                con1.Open();
                SqlCommand cmd1 = new SqlCommand(query1, con1);
                cmd1.Parameters.AddWithValue("@userID", userID);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                while (dr1.Read())
                {
                    createRegisteredProgram(int.Parse(dr1["id"].ToString()), dr1["logo"].ToString());
                }
                registered.Controls.Add(new HtmlGenericControl("li"));
                con1.Close();
            }

            else
            {
                Response.Redirect("Logout.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("products.aspx");

        }

        protected void createProgram(int id, string image)
        {
            
            HtmlGenericControl li = new HtmlGenericControl("li");
            li.Attributes["class"] = "col-xs-6 col-sm-2";
            HtmlGenericControl div = new HtmlGenericControl("div");
            HtmlGenericControl img = new HtmlGenericControl("img");
            img.Attributes["src"] = image;
            div.Controls.Add(img);
            HtmlGenericControl a = new HtmlGenericControl("a");
            a.Attributes["href"] = "addProgramRegister.aspx?id=" + id.ToString();
            a.Controls.Add(new LiteralControl("<span>+</span>"));
            div.Controls.Add(a);
            li.Controls.Add(div);
            programList.Controls.Add(li);
            programList.Controls.Add(new HtmlGenericControl("li"));
        }


        protected void createRegisteredProgram(int id, string image)
        {
            HtmlGenericControl li = new HtmlGenericControl("li");
            li.Attributes["class"] = "col-xs-6 col-sm-2";
            HtmlGenericControl div = new HtmlGenericControl("div");
            HtmlGenericControl img = new HtmlGenericControl("img");
            img.Attributes["src"] = image;
            div.Controls.Add(img);
            HtmlGenericControl a = new HtmlGenericControl("a");
            a.Attributes["href"] = "addProgramRemove.aspx?id=" + id.ToString();
            a.Attributes["class"] = "remove";
            a.Controls.Add(new LiteralControl("<span>X</span>"));
            div.Controls.Add(a);
            li.Controls.Add(div);
            registered.Controls.Add(li);
        }

        protected int GetCount(int uid)
        {
            int count;


            // int count=-1;
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            string strsql = "select Count(*) from LH_WishList where UserId=@uid";
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(strsql, con);
                cmd.Parameters.AddWithValue("@uid", uid);
                count = (int)cmd.ExecuteScalar();

                Session["Count"] = count;
                return count;

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
        protected int GetCartCount(int uid)
        {
            int Cartcount;


            // int count=-1;
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            string strsql = "select Count(*) from LH_cart where user_ID=@uid";
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(strsql, con);
                cmd.Parameters.AddWithValue("@uid", uid);
                Cartcount = (int)cmd.ExecuteScalar();

                Session["CartCount"] = Cartcount;
                return Cartcount;

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
      

        protected void search_Click(object sender, EventArgs e)
        {
            try
            {
                string searchValue = programSearchtxt.Value;
                int categoryID = int.Parse(programCategory.Value);
                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                string query = "select * from LH_programs_list where id not in(select program from LH_Programs where user_Id = @userID) ";
                if (categoryID != -1) query += " and category = @category ";
                if(searchValue != "") query+=" and name like @search";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userID", userID);
                if (categoryID != -1) cmd.Parameters.AddWithValue("@category", categoryID);
                if (searchValue != "") cmd.Parameters.AddWithValue("@search", "%" + searchValue + "%");
                SqlDataReader dr = cmd.ExecuteReader();
                programList.InnerHtml = "";
                while (dr.Read())
                {
                   
                    createProgram(int.Parse(dr["id"].ToString()), dr["logo"].ToString());
                }
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("products.aspx");
        //}
    }
}