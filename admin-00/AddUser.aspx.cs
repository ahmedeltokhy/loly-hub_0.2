using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class AddUser : System.Web.UI.Page
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
            SqlConnection con = new SqlConnection(Login.GetConnectionString());

            string query = "select * from LH_role";

            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                roleSelect.Items.Add(new ListItem(dr["title"].ToString(), dr["id"].ToString()));
            }
            roleSelect.DataBind();

            con.Close();

            con.Open();
            query = "select * from LH_retailer";

            cmd = new SqlCommand(query, con);

            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                retialerSelect.Items.Add(new ListItem(dr["name"].ToString(), dr["id"].ToString()));
            }
            con.Close();
        }
       

        protected void saveUser(object sender, EventArgs e)
        {
            Response.Write("AAAAAAAAAAAAAAAAAAAAAAA");
            Boolean activeval = active.Checked;

            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            string query = "insert into LH_User(UserName,  FirstName,  MiddleName,  LastName,  Email,  Country,  City,  State,  Mobile,  Street_Address, Zip_Code, DateOfBirth,active, Password, Create_Date,Update_Date,role,retailerID)" +
                                        "values(@username, @firstname, @middlename, @lastname, @email, @country, @city, @state, @mobile, @streetaddress, @zipcode, @dob,       @active,@password,@date,      @date,@role,@retailerID)";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", usernametxt.Value);
            cmd.Parameters.AddWithValue("@firstname", firstNametxt.Value);
            cmd.Parameters.AddWithValue("@middlename", middleNametxt.Value);
            cmd.Parameters.AddWithValue("@lastname", lastNametxt.Value);
            cmd.Parameters.AddWithValue("@password", passwordtxtr.Value);
            cmd.Parameters.AddWithValue("@email", emailtxt.Value);
            cmd.Parameters.AddWithValue("@country", countrytxt.Value);
            cmd.Parameters.AddWithValue("@city", citytxt.Value);
            cmd.Parameters.AddWithValue("@state", statetxt.Value);
            cmd.Parameters.AddWithValue("@mobile", mobiletxt.Value);
            cmd.Parameters.AddWithValue("@streetaddress", addresstxt.Value);
            cmd.Parameters.AddWithValue("@zipcode", ziptxt.Value);
            cmd.Parameters.AddWithValue("@dob", dobtxt.Value);
            cmd.Parameters.AddWithValue("@active", active.Checked);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            cmd.Parameters.AddWithValue("@role",roleSelect.Value);
            cmd.Parameters.AddWithValue("@retailerID", retialerSelect.Value);



            SqlDataReader dr = cmd.ExecuteReader();
            message.InnerText = "Saved";
            userForm.Visible = false;
        }
    }
    }
