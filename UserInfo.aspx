<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="loly_hub_0._2.UserInfo" %>

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
<body id="signin">
    <form id="form1" runat="server">
        <!--****************** Header *****************-->
        <header>
            <a class="logo" href="/" title="LolyHub">User Info</a>
        </header>

        <!--************************************** END OF HEADER SECTION ********************************-->


        <div class="row">

            <div id="login" class="col-md-4 col-md-offset-4">

                <div class="col-xs-6 col-sm-4 col-md-5 signin">
                    <h2><i class="fa fa-user-plus" aria-hidden="true"></i>User Info</h2>
                </div>
                <%--<div class="col-xs-6 col-sm-6 col-md-7 text-right create">Already have an account?&nbsp;<a href="Login.aspx" title="Create your account">Sign in</a></div> --%>


                <div class="col-xs-12 col-sm-12 col-md12 form">

                    <hr>
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" id="txtEmail" runat="server" placeholder="Enter your email" autocomplete="off">
                </div>
                <%--  <div class="form-group">
	    <input type="email" class="form-control" id="txtremail" runat="server" placeholder="Re-enter your email" autocomplete="off">
	  </div>
        <div class="form-group">
            <asp:TextBox ID="txtUname" CssClass="form-control" runat="server" placeholder="Enter UserName" autocomplete="off"></asp:TextBox>
       </div>
	   <div class="form-group">
           <asp:TextBox ID="txtPswd" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
	   </div>
        <div class="form-group">
            <asp:TextBox ID="txtrePswd" runat="server" CssClass="form-control" placeholder="Re-Enter Password" TextMode="Password"></asp:TextBox>
        </div>--%>
                <div class="form-group">
                    <input type="text" class="form-control" id="txtFname" runat="server" placeholder="First name" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="txtLname" runat="server" placeholder="Last name" autocomplete="off">
                </div>
                <div class="form-group">
                    <%--<input type="text" class="form-control" id="txtMobile" runat="server" placeholder="Mobile number">--%>
                    <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" placeholder="Mobile number" autocomplete="off"></asp:TextBox>
                </div>

                <%--<select class="form-control">
		  <option>Your country</option>
		  <option>UAE</option>
		  <option>Saudi</option>
		  <option>Egypt</option>
		  <option>Iraq</option>
		</select>--%>


                <hr />
                <div runat="server" id="messageTxt"></div>
                <hr />
                <%--<p class="text-center">By Registering,you agree that you've read and accepted our <a href="">User Agreement</a>, you're at least 18 years old, and you consent to our <a href="">Privacy Notice</a> and receiving marketing communications from us.</p--%><%-->--%>
                <%--<button type="button" class="btn btn-primary btn-lg btn-block" runat="server">Sign up</button>--%>
                <div style="margin: auto; width: 15em;">
                    <div class="abc">
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-lg btn-block" Width="100" Height="40" Text="Update" OnClick="Button1_Click" />
                    </div>
                    <div class="abc">
                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary btn-lg btn-block" Width="100" Height="40" Text="Cancel" OnClick="Button2_Click" /></div>

                </div>
        &nbsp;
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

    </form>
</body>
</html>
