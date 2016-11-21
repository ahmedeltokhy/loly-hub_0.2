using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class retailerAdmin : System.Web.UI.Page
    {
        string mobileNumber = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsCallback)
            {

                sendSMS.Visible = false;
                verifySMS.Visible = false;
                billNumber.Visible = false;
                finishMessage.Visible = false;
                soldMessage.Visible = false;

            }
        }

        protected void searchbtn_Click(object sender, EventArgs e)
        {
            int retailerID = -1;
            retailerID = int.Parse(clsRidjindalEncryption.Decrypt(Session["retailerID"].ToString(), "P@ssword", "123", "SHA1", 2, "%1234567890@#$%^", 256));
            SqlConnection con = new SqlConnection(Login.GetConnectionString());
            string query = "";

            SqlCommand cmd = new SqlCommand(query, con);

            bool sold = false;

            if (orderID.Checked)
            {
                query = "select *,u.Id AS userID, d.ID as detailID,d.OrderId as detailOrderID,d.ProductId as detailsProductID,d.Quantity as detailsQuantity,d.CreateDate as DetailsCreation,d.UpdateDate as detailsUpdate,p.title as productTitle,p.description as productDescription, p.price as productPrice, p.retailerID as productRetailerID  from LH_order_details as d join LH_product p on d.ProductId = p.ID  join LH_Order as o on o.Id = d.OrderId  join LH_User as u on o.UseID = u.Id   where p.retailerID = @retailerID and d.OrderId = @orderID";
                con.Open();

                cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@retailerID", retailerID);
                cmd.Parameters.AddWithValue("@orderID", int.Parse(searchtxt.Value));
            }

            if (mobile.Checked)
            {
                query = "select *,u.Id AS userID, d.ID as detailID,d.OrderId as detailOrderID,d.ProductId as detailsProductID,d.Quantity as detailsQuantity,d.CreateDate as DetailsCreation,d.UpdateDate as detailsUpdate,p.title as productTitle,p.description as productDescription, p.price as productPrice, p.retailerID as productRetailerID  from LH_order_details as d join LH_product p on d.ProductId = p.ID  join LH_Order as o on o.Id = d.OrderId  join LH_User as u on o.UseID = u.Id   where p.retailerID = @retailerID and u.Mobile = @mobile";
                con.Open();

                cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@retailerID", retailerID);
                cmd.Parameters.AddWithValue("@mobile", searchtxt.Value);
            }


            SqlDataReader dr = cmd.ExecuteReader();

            HtmlTable userTable = new HtmlTable();
            userTable.Attributes["id"] = "userTable";
            userTable.Attributes["class"] = "table table-bordered";
            HtmlTableRow header = new HtmlTableRow();

            HtmlTableCell idHeader = new HtmlTableCell("th");
            idHeader.InnerText = "ID";
            header.Cells.Add(idHeader);

            HtmlTableCell TitleHeader = new HtmlTableCell("th");
            TitleHeader.InnerText = "Title";
            header.Cells.Add(TitleHeader);

            HtmlTableCell DescriptionHeader = new HtmlTableCell("th");
            DescriptionHeader.InnerText = "Description";
            header.Cells.Add(DescriptionHeader);

            HtmlTableCell priceHeader = new HtmlTableCell("th");
            priceHeader.InnerText = "price";
            header.Cells.Add(priceHeader);

            HtmlTableCell QuantityHeader = new HtmlTableCell("th");
            QuantityHeader.InnerText = "Quantity";
            header.Cells.Add(QuantityHeader);

            HtmlTableCell TotalHeader = new HtmlTableCell("th");
            TotalHeader.InnerText = "Total Price";
            header.Cells.Add(TotalHeader);

            userTable.Rows.Add(header);
            List<int> productIDs = new List<int>();
            while (dr.Read())
            {
                if (!DBNull.Value.Equals(dr["billNumber"]))
                {
                    sold = true;
                }
                productIDs.Add(int.Parse(dr["ProductId"].ToString()));
                HtmlTableRow dataRow = new HtmlTableRow();

                HtmlTableCell id = new HtmlTableCell("td");
                id.InnerText = dr["detailsProductID"].ToString();
                dataRow.Cells.Add(id);

                HtmlTableCell Title = new HtmlTableCell("td");
                Title.InnerText = dr["productTitle"].ToString();
                dataRow.Cells.Add(Title);

                HtmlTableCell Description = new HtmlTableCell("td");
                Description.InnerText = dr["productDescription"].ToString();
                dataRow.Cells.Add(Description);

                HtmlTableCell price = new HtmlTableCell("td");
                price.InnerText = dr["productPrice"].ToString();
                dataRow.Cells.Add(price);

                HtmlTableCell Quantity = new HtmlTableCell("td");
                Quantity.InnerText = dr["detailsQuantity"].ToString();
                dataRow.Cells.Add(Quantity);

                HtmlTableCell Total = new HtmlTableCell("td");
                Total.InnerText = (int.Parse(dr["productPrice"].ToString()) * int.Parse(dr["detailsQuantity"].ToString())).ToString();
                dataRow.Cells.Add(Total);

                userTable.Rows.Add(dataRow);

                Session["UserMobile"] = dr["Mobile"].ToString();
                Session["userID"] = dr["userID"].ToString();
                Session["OrderID"] = dr["detailOrderID"].ToString();
            }
            con.Close();
            orderDetails.Controls.Add(userTable);
            Session["ProductIDs"] = productIDs;

            if (!sold)
            {
                sendSMS.Visible = true;
            }
            else
            {
                soldMessage.Visible = true;
            }
        }

        protected void sendSMSbtn_Click(object sender, EventArgs e)
        {
            string m = Session["UserMobile"].ToString();
            int userID = int.Parse(Session["userID"].ToString());
            int orderID = int.Parse(Session["OrderID"].ToString());
            string code = "";
            Random rand = new Random();
            for (int i = 0; i < 5; i++)
            {
                code += rand.Next(0, 9).ToString();
            }

            SqlConnection con = new SqlConnection(Login.GetConnectionString());

            string query = "update LH_User set mobileCode = @code where Id = @userID";

            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@code", code);
            cmd.Parameters.AddWithValue("@userID", userID);

            SqlDataReader dr = cmd.ExecuteReader();

            con.Close();
            //SendSMS(m, code);

            search.Visible = false;
            sendSMS.Visible = false;
            verifySMS.Visible = true;

        }

        public bool SendSMS(string mobile, string body)
        {
            if (!string.IsNullOrEmpty(mobile) && !string.IsNullOrEmpty(body))
            {
                try
                {
                    bool Send_SMS;
                    bool.TryParse(ConfigurationManager.AppSettings["Enable_SMS"], out Send_SMS);

                    if (Send_SMS)
                    {
                        string SMS_URL = ConfigurationManager.AppSettings["SMS_URL"];
                        string userid = clsRidjindalEncryption.Decrypt(ConfigurationManager.AppSettings["SMS_UserID"], "LHB", "123", "SHA1", 2, "%1234567890@#$%^", 256);
                        string userPass = clsRidjindalEncryption.Decrypt(ConfigurationManager.AppSettings["SMS_UserPass"], "LHB", "123", "SHA1", 2, "%1234567890@#$%^", 256);
                        string smsSender = clsRidjindalEncryption.Decrypt(ConfigurationManager.AppSettings["SMS_Sender"], "LHB", "123", "SHA1", 2, "%1234567890@#$%^", 256);


                        var request = (HttpWebRequest)WebRequest.Create(SMS_URL);
                        string postData = string.Format("userid={0}&password={1}&sender={2}&to={3}&msg={4}&encoding=utf-8",
                            userid, userPass, smsSender, mobile, body);

                        var data = Encoding.UTF8.GetBytes(postData);

                        request.Method = "POST";
                        request.ContentType = "application/x-www-form-urlencoded";
                        request.ContentLength = data.Length;

                        using (var stream = request.GetRequestStream())
                        {
                            stream.Write(data, 0, data.Length);
                        }

                        var response = (HttpWebResponse)request.GetResponse();

                        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();
                    }
                    return true;

                }
                catch (Exception ex)
                {
                    return false;
                    throw ex.InnerException;

                }
            }
            else
                return false;


        }

        protected void verifybtn_Click(object sender, EventArgs e)
        {
            string checkCode = verifyTxt.Value;
            int userID = int.Parse(Session["userID"].ToString());

            SqlConnection con = new SqlConnection(Login.GetConnectionString());

            string query = "select Id from LH_User where Id = @userID and mobileCode = @code";

            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@code", checkCode);
            cmd.Parameters.AddWithValue("@userID", userID);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                verifySMS.Visible = false;
                billNumber.Visible = true;
            }
            else
            {
                verifySMS.Visible = true;
                errorMessage.InnerText = "Wrong Code";

            }
            con.Close();

        }

        protected void billNumberbtn_Click(object sender, EventArgs e)
        {
            string billNumber = billNumbertxt.Value;
            List<int> productIDs = (List<int>)Session["productIDs"];
            string products = null;

            for (int i = 0; i < productIDs.Count; i++)
            {
                products += productIDs[i].ToString();

                if (i < productIDs.Count - 1)
                {
                    products += ",";
                }


            }
            SqlConnection con = new SqlConnection(Login.GetConnectionString());

            string query = "update  LH_order_details set BillNumber ='" + billNumber + "' where ProductId in(" + products + ")";

            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.ExecuteReader();
            finishMessage.Visible = true;
        }
    }
}
