using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class AddProgram : System.Web.UI.Page
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

                SqlConnection con = new SqlConnection(Login.GetConnectionString());

                string query = "select * from LH_Programs_category where isActive = 1";

                con.Open();

                SqlCommand cmd = new SqlCommand(query,con);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    categorytxt.Items.Add(new ListItem(dr["category_name"].ToString(),dr["id"].ToString()));
                }

                con.Close();

                query = "select * from LH_country";

                con.Open();

                cmd = new SqlCommand(query, con);

                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    country.Items.Add(new ListItem(dr["name"].ToString(), dr["id"].ToString()));
                }

                con.Close();
            }
        }

        [System.Web.Services.WebMethod]
        public static string saveProgram(string name, string image, float rate,float revenu,int max, int min,int category,int country,string nameofvalue,string url,bool[] flags)
         {
            try
            {
                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                string query = "INSERT INTO LH_programs_list(name,logo,category,rate,revenueRate,max,min,countryID,nameOfValue,url,[usernameFlag],[passwordFlag],[pinCodeFlag],[userIDFlag],[emailFlag],[mobileFlag],[otpFlag],createDate,updateDate) VALUES(@name,@image,@cateogry,@rate,@revenue,@max,@min,@country,@nameOfValue,@url,@usernameFlag,@passwordFlag,@pinCodeFlag,@userIDFlag,@emailFlag,@mobileFlag,@otpFlag,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@image", image);
                cmd.Parameters.AddWithValue("@rate", rate);
                cmd.Parameters.AddWithValue("@revenue", revenu);
                cmd.Parameters.AddWithValue("@min", min);
                cmd.Parameters.AddWithValue("@max",max);
                cmd.Parameters.AddWithValue("@cateogry",category);
                cmd.Parameters.AddWithValue("@country", country);
                cmd.Parameters.AddWithValue("@nameOfValue",nameofvalue);
                cmd.Parameters.AddWithValue("@url", url);
                cmd.Parameters.AddWithValue("@usernameFlag", flags[0]); cmd.Parameters.AddWithValue("@emailFlag", flags[4]);
                cmd.Parameters.AddWithValue("@passwordFlag", flags[1]); cmd.Parameters.AddWithValue("@mobileFlag", flags[5]);
                cmd.Parameters.AddWithValue("@pinCodeFlag", flags[2]); cmd.Parameters.AddWithValue("@otpFlag", flags[6]);
                cmd.Parameters.AddWithValue("@userIDFlag", flags[3]);


                SqlDataReader dr = cmd.ExecuteReader();
                return "Changes Saved.";
            }
            catch (Exception)
            {

                return "Failed to Save.";
            }
            
           

        }
    }
}