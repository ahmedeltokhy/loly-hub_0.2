<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="SignUp.aspx.cs" Inherits="loly_hub_0._2.SignUp" %>

<!DOCTYPE html>
<html lang="en">
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
<body id="signin">
    <form id="form1" runat="server">
   <!--****************** Header *****************-->
  	<header>
		<a class="logo" href="#" title="LolyHub">Sign up</a>
	</header>

<!--************************************** END OF HEADER SECTION ********************************-->

	
<div class="row">
    <div id="activation" runat="server" style="text-align: center;font-size: 2em;">Account Created Please check your email for activation.</div>
  <div id="login" runat="server" class="col-md-4 col-md-offset-4">

  	<div class="col-xs-6 col-sm-4 col-md-5 signin"><h2><i class="fa fa-user-plus" aria-hidden="true"></i>Sign up</h2></div>
	<div class="col-xs-6 col-sm-6 col-md-7 text-right create">Already have an account?&nbsp;<a href="Login.aspx" title="Create your account">Sign in</a></div> 
	

	<div class="col-xs-12 col-sm-12 col-md12 form">
	
	<hr>
	
	<form>
	  <div class="form-group">
	    <input type="email" class="form-control" id="txtEmail" runat="server" placeholder="Enter your email" autocomplete="off">
          <asp:Label ID="lblemail" runat="server" ForeColor="Red" Text="Label"></asp:Label>
	  </div>
	  <div class="form-group">
	    <input type="email" class="form-control" id="txtremail" runat="server" placeholder="Re-enter your email" autocomplete="off">
	  </div>
        <div class="form-group">
            <asp:TextBox ID="txtUname" CssClass="form-control" runat="server" placeholder="Enter UserName" autocomplete="off"></asp:TextBox>
            <asp:Label ID="lbluname" runat="server" ForeColor="Red" Text="Label"></asp:Label>
       </div>
	   <div class="form-group">
           <asp:TextBox ID="txtPswd" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
            <span id="password_strength"></span>
	   </div>
        <div class="form-group">
            <asp:TextBox ID="txtrePswd" runat="server" CssClass="form-control" placeholder="Re-Enter Password" TextMode="Password"></asp:TextBox>
        </div>
	  <div class="form-group">
	    <input type="text" class="form-control" id="txtFname" runat="server" placeholder="First name" autocomplete="off">
	  </div>
	  <div class="form-group">
	    <input type="text" class="form-control" id="txtLname" runat="server" placeholder="Last name" autocomplete="off">
	  </div>
	  <div class="form-group">
	    <%--<input type="text" class="form-control" id="txtMobile" runat="server" placeholder="Mobile number">--%>
          <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" placeholder="Mobile number" autocomplete="off"></asp:TextBox>
          <asp:Label ID="lblmobile" runat="server" ForeColor="red" Text="Label"></asp:Label>
		</div>

		<%--<select class="form-control">
		  <option>Your country</option>
		  <option>UAE</option>
		  <option>Saudi</option>
		  <option>Egypt</option>
		  <option>Iraq</option>
		</select>--%>


	<hr>

	<p class="text-center">By Registering,you agree that you've read and accepted our <a href="">User Agreement</a>, you're at least 18 years old, and you consent to our <a href="">Privacy Notice</a> and receiving marketing communications from us.</p>
	<%--<button type="button" class="btn btn-primary btn-lg btn-block" runat="server">Sign up</button>--%>
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Sign up" OnClientClick=" return validate();" OnClick="Button1_Click" />
	</form>

	</div>
  </div>
</div>
	<footer>

		<hr>
		<p>© 2016 LOLYHUB. ALL RIGHTS RESERVED.</p>
	</footer>
<!--************************************** END OF FOOTER SECTION ********************************-->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
         <script type="text/javascript">
        function validate() {
            var Firstname = document.getElementById('<%=txtFname.ClientID %>').value;
            var LastName = document.getElementById('<%=txtLname.ClientID %>').value;
          <%--  var MiddleName = document.getElementById('<%=txtmname.ClientID%>').value;--%>
            var Mobile = document.getElementById('<%=txtMobile.ClientID%>').value;
            var Email = document.getElementById('<%=txtEmail.ClientID %>').value;
             var ReEmail = document.getElementById('<%=txtremail.ClientID %>').value;
<%--            var State = document.getElementById('<%=txtstate.ClientID %>').value;
            var ddlCountries = document.getElementById('<%=ddlCountries.ClientID %>').value;--%>

<%--            var ddlCities = document.getElementById('<%=ddlCities.ClientID %>').value;
            var DateOfBirth = document.getElementById('<%=dob.ClientID %>').value;--%>
            var UserName = document.getElementById('<%=txtUname.ClientID %>').value;
            var Password = document.getElementById('<%=txtPswd.ClientID %>').value;
            var RePassword = document.getElementById('<%=txtrePswd.ClientID %>').value;
            if (Firstname == "") {
                confirm("Enter First Name");
                return true;
            }
           
            if (LastName == "") {
                alert("Enter Last Name");
                return false;
            }
            if (Mobile == "" || Mobile == null) {
                alert("Please enter your Mobile No.");
                return false;
            }
            if (Mobile.length < 10 || Mobile.length > 10) {
                alert("Mobile No. is not valid, Please Enter 10 Digit Mobile No.");
                return false;
            }


            if (Email == "") {
                alert("Enter Email");
                return false;
            }              
            var emailPat = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            var EmailmatchArray = Email.match(emailPat);
            if (EmailmatchArray == null) {
                alert("Your email address seems incorrect. Please try again.");
                return false;
            }

            if (UserName == "") {
                alert("Enter UserName");
                return false;
            }
            if (Password != RePassword) {

                alert("Password do not match");
                return false;
            }
            if (Password.length < 6 || Password.length == 0) {
                alert("password Must not Be less than 6 characters or Empty.");
                return false;
            }
            if (pwdStrenth == 0) {
                alert("You Must Insert A Strong Password.");
                return false;

            }
            if (Email != ReEmail) {

                alert("Email do not match");
                return false;
            }
            else
            {
                return true;
            }
           
        }
</script>
         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
  
    $(function () {
        $("#txtPswd").bind("keyup", function () {
            //TextBox left blank.
            if ($(this).val().length == 0) {
                $("#password_strength").html("");
                return;
            }
 
            //Regular Expressions.
            var regex = new Array();
            regex.push("[A-Z]"); //Uppercase Alphabet.
            regex.push("[a-z]"); //Lowercase Alphabet.
            regex.push("[0-9]"); //Digit.
            regex.push("[$@$!%*#?&]"); //Special Character.
 
            var passed = 0;
 
            //Validate for each Regular Expression.
            for (var i = 0; i < regex.length; i++) {
                if (new RegExp(regex[i]).test($(this).val())) {
                    passed++;
                }
            }
 
 
            //Validate for length of Password.
            if (passed > 2 && $(this).val().length > 8) {
                passed++;
            }
 
            //Display status.
            var color = "";
            var strength = "";
            switch (passed) {
                case 0:
                case 1:
                    strength = "Weak";
                    color = "red";
                    pwdStrenth = 0;
                    break;
                case 2:
                    strength = "Good";
                    color = "darkorange";
                    pwdStrenth = 1;
                    break;
                case 3:
                case 4:
                    strength = "Strong";
                    color = "green";
                    pwdStrenth = 2;
                    break;
                case 5:
                    strength = "Very Strong";
                    color = "darkgreen";
                    pwdStrenth = 3;
                    break;
            }
            $("#password_strength").html(strength);
            $("#password_strength").css("color", color);
        });
    });
</script>
    </form>
</body>
</html>
