<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="loly_hub_0._2.resetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
      <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Lolyhub Website</title>

    <!--****************** bootstrap stylesheet *****************-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <!--****************** Fonts *****************-->
    <link rel="stylesheet" href="fonts/font-awesome/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!--****************** Slider Stylesheets *****************-->






    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server" action="resetPassword.aspx/doResetPassword" style="width: 30%;display: block;margin: 30px auto;">
    <div>
    <input type="hidden" runat="server" id="idtxt" />
        <input type="hidden" runat="server" id="emailtxt" />
      <div class="form-group">
           <asp:TextBox ID="txtPswd" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
	   </div>
        <div class="form-group">
            <asp:TextBox ID="txtrePswd" runat="server" CssClass="form-control" placeholder="Re-Enter Password" TextMode="Password"></asp:TextBox>
        </div>
          <a id="Button2" class="btn btn-primary btn-lg btn-block" runat="server" onclick="validate()">Reset</a>
         
    </div>
    </form>

    <!--************************************** END OF FOOTER SECTION ********************************-->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
 <script type="text/javascript">
     function validate() {
        
            var Password = document.getElementById('<%=txtPswd.ClientID %>').value;
            var RePassword = document.getElementById('<%=txtrePswd.ClientID %>').value;
            var id = parseInt(document.getElementById('<%=idtxt.ClientID %>').value);
            var email = $("#emailtxt").val();
            alert(email);
            if (Password == "") {
                alert("Please Enter New Password.");
                return false;
            }
            else if (Password != RePassword) {

                alert("Password do not match");
                return false;
            }
            doReset(Password,id,email);
                return true;
                     
        }

     function doReset(password,id,email) {
         $.ajax({
             type: "POST",
             url: "resetPassword.aspx/doResetPassword",
             // data: '{name: "' + programName + '",image:"' + imageSRC + '" }',
             data: "{'password':'" + password + "','id':'" + id + "','email':'" + email + "','code':'" + getCookie("code") + "'}",
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: OnSuccess,
             failure: function (response) {
                 alert(response.d);
             }
         });
         function OnSuccess(response) {
            
             alert(response.d);
             if (response.d == "different code") {
                 window.location.replace = "Login.aspx";

             }
         }
         return false;
    
     }

     function getCookie(cname) {
         var name = cname + "=";
         var ca = document.cookie.split(';');
         for (var i = 0; i < ca.length; i++) {
             var c = ca[i];
             while (c.charAt(0) == ' ') {
                 c = c.substring(1);
             }
             if (c.indexOf(name) == 0) {
                 return c.substring(name.length, c.length);
             }
         }
         return "";
     }
</script>
</body>
</html>
