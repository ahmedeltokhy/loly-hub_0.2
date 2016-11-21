using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loly_hub_0._2.admin
{
    public partial class Default : System.Web.UI.Page
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
        }
    }
}