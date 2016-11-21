<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activation.aspx.cs" Inherits="loly_hub_0._2.activation" %>


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
    <div id="activationtxt" runat="server" style="text-align: center;font-size: 2em;">Account activated.<br />

        Login From <a href="Login.aspx">Here</a>
    </div>
    <div id="error" runat="server" style="text-align: center;font-size: 2em;">Account activation Failed Please Try again or contact system administration.</div>
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
