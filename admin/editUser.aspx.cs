using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class editUser : System.Web.UI.Page
    {
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {

            int roleInt = -1;
            if (Session["role"] != null) int.TryParse(clsRidjindalEncryption.Decrypt(Session["role"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256), out roleInt);
            if (roleInt != 1)
            {
                Response.Redirect("../default.aspx");
            }
            else
            {
                Response.Write("admin Login!");
            }


            int userID = -1;
            if (!int.TryParse(Request.QueryString["id"], out userID) && !IsPostBack)
            {
                Response.Redirect("users.aspx");
            }
            if (!IsPostBack)
            {
                id = userID;
                useridForm.Value = userID.ToString();
                Session["formID"] = userID;
            }


            if (IsPostBack)
            {
                saveUser();
            }

            SqlConnection con = new SqlConnection(Login.GetConnectionString());

            string query = "select * from LH_user where ID = @userID";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@userID", userID);
            SqlDataReader dr = cmd.ExecuteReader();
            string role = "";
            string retailer = "";
            while (dr.Read())
            {
                usernametxt.Value = dr["username"].ToString();
                firstNametxt.Value = dr["FirstName"].ToString();
                middleNametxt.Value = dr["MiddleName"].ToString();
                lastNametxt.Value = dr["LastName"].ToString();
                emailtxt.Value = dr["email"].ToString();
                mobiletxt.Value = dr["mobile"].ToString();
                addresstxt.Value = dr["Street_Address"].ToString();
                ziptxt.Value = dr["Zip_Code"].ToString();
                countrytxt.Value = dr["country"].ToString();
                citytxt.Value = dr["city"].ToString();
                statetxt.Value = dr["state"].ToString();
             //   dobtxt.Value = DateTime.Parse(dr["DateOfBirth"].ToString()).ToString("dd-mm-yyyy") ;
                active.Checked = Boolean.Parse(dr["active"].ToString());
                role = dr["role"].ToString();
                retailer = dr["retailerID"].ToString();
                con.Close();
                query = "select * from LH_role";
                con.Open();
                cmd = new SqlCommand(query, con);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    ListItem item = new ListItem(dr["title"].ToString(), dr["id"].ToString());
                    if (role == dr["id"].ToString())
                    {
                        item.Selected = true;
                    }
                    roleSelect.Items.Add(item);

                }
                con.Close();
                query = "select * from LH_retailer";
                con.Open();
                cmd = new SqlCommand(query, con);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    ListItem item = new ListItem(dr["name"].ToString(), dr["id"].ToString());
                    if (retailer == dr["id"].ToString())
                    {
                        item.Selected = true;
                    }
                    retailerSelect.Items.Add(item);

                }
            }
        }

        protected void saveUser()
        {

            if (IsPostBack)
            {
                Boolean activeval = active.Checked; 

                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                string query = "update LH_User set UserName = @username,FirstName = @firstname,MiddleName = @middlename,LastName = @lastname,Email = @email, country = @country,City = @city,State = @state,Mobile = @mobile,Street_Address = @streetaddress,Zip_Code = @zipcode,DateOfBirth = @dob,active = @active, role = @role ";
                if (passwordtxtr.Value != "")  query += "Password = @password,";
                query += "where id = @userid";
                    //query += "Email = @email, country = @country,City = @city,State = @state,Mobile = @mobile,Street_Address = @streetaddress,Zip_Code = @zipcode where id = @userid";
                    con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username",usernametxt.Value);
                cmd.Parameters.AddWithValue("@firstname", firstNametxt.Value);
                cmd.Parameters.AddWithValue("@middlename", middleNametxt.Value);
                cmd.Parameters.AddWithValue("@lastname", lastNametxt.Value);
               if (passwordtxtr.Value != "") cmd.Parameters.AddWithValue("@password",passwordtxtr.Value);
                cmd.Parameters.AddWithValue("@email", emailtxt.Value);
                cmd.Parameters.AddWithValue("@country", countrytxt.Value);
                cmd.Parameters.AddWithValue("@city", citytxt.Value);
                cmd.Parameters.AddWithValue("@state", statetxt.Value);
                cmd.Parameters.AddWithValue("@mobile", mobiletxt.Value);
                cmd.Parameters.AddWithValue("@streetaddress", addresstxt.Value);
                cmd.Parameters.AddWithValue("@zipcode", ziptxt.Value);
                cmd.Parameters.AddWithValue("@dob", dobtxt.Value);
                cmd.Parameters.AddWithValue("@active", active.Checked);
                cmd.Parameters.AddWithValue("@role", roleSelect.Value);

                int id = int.Parse(Session["formID"].ToString());
                cmd.Parameters.AddWithValue("@userid", id);

                SqlDataReader dr = cmd.ExecuteReader();
                message.InnerText = "Saved";
                userForm.Visible = false;
            }
        }
    }
}