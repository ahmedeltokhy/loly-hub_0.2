using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class Categories : System.Web.UI.Page
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
            string query = "select * from LH_category where isActive = 1";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            HtmlTable userTable = new HtmlTable();
            userTable.Attributes["id"] = "userTable";
            userTable.Attributes["class"] = "table table-bordered";
            HtmlTableRow header = new HtmlTableRow();

            HtmlTableCell idHeader = new HtmlTableCell("th");
            idHeader.InnerText = "ID";
            header.Cells.Add(idHeader);

            HtmlTableCell usernameHeader = new HtmlTableCell("th");
            usernameHeader.InnerText = "Name";
            header.Cells.Add(usernameHeader);
            userTable.Rows.Add(header);
            int count = 1;
            while (dr.Read())
            {
                string rowID = "row_" + count.ToString();
                HtmlTableRow row = new HtmlTableRow();
                row.Attributes["id"] = rowID;
                row.Attributes["class"] = "usersRows";
                HtmlTableCell id = new HtmlTableCell("th");
                id.InnerText = dr[0].ToString();
                row.Cells.Add(id);

                HtmlTableCell username = new HtmlTableCell();
                username.InnerText = dr["category_name"].ToString();
                row.Cells.Add(username);

              

                HtmlTableCell delete = new HtmlTableCell();
                delete.InnerHtml = "<a href='#' onClick='deleteUser(" + dr[0] + "," + count + ")'>Delete</a>";
                row.Cells.Add(delete);

                HtmlTableCell edit = new HtmlTableCell();
                edit.InnerHtml = "<a runat='server' id='edit_" + count + "' href='editCategory.aspx?id=" + dr[0] + "' onClick='editUser(" + dr[0] + ")'>Edit</a>";
                row.Cells.Add(edit);

                userTable.Rows.Add(row);
                count++;
            }
            tableContainer.Controls.Add(userTable);
            con.Close();
        }


        [System.Web.Services.WebMethod]
        public static string delete(string id)
        {
            try
            {
                SqlConnection con = new SqlConnection(Login.GetConnectionString());
                string query = "update LH_category set isActive = 0 where id =@id";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", int.Parse(id));
                cmd.ExecuteReader();
                return (id + " Deleted");


            }
            catch (Exception e)
            {

                return "User Can't be deleted.";
            }

        }
    }
}