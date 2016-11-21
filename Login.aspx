<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="loly_hub_0._2.Login" %>

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
    <script type="text/javascript">
        function noBack() {
            window.history.forward(1)
        }

        noBack();
        window.onload = noBack;
        window.onpageshow = function (evt) { if (evt.persisted) noBack() }
        window.onunload = function () { void (0) }

        $(function () {
            /*
            * this swallows backspace keys on any non-input element.
            * stops backspace -> back
            */
            var rx = /INPUT|SELECT|TEXTAREA/i;

            $(document).bind("keydown keypress", function (e) {
                if (e.which == 8) { // 8 == backspace
                    if (!rx.test(e.target.tagName) || e.target.disabled || e.target.readOnly) {
                        e.preventDefault();
                    }
                }
            });
        });

    </script>
</head>
<body id="signin">
    <form id="form1" runat="server">
        <!--****************** Header *****************-->
        <asp:TextBox ID="txtUname" runat="server" Height="0" Width="0"></asp:TextBox>
        <header>
            <a class="logo" href="#" title="LolyHub">Sign in</a>
        </header>

        <!--************************************** END OF HEADER SECTION ********************************-->


        <div class="row">
            <div id="login" class="col-md-4 col-md-offset-4">
                <div class="col-xs-6 col-sm-6 signin">
                    <h2 id="signtxt"><i class="fa fa-sign-in" aria-hidden="true"></i><span id="signinlbl">Sign in</span><span hidden="hidden" id="forgotlbl">Forgot Password</span> </h2>
                </div>
                <div class="col-xs-6 col-sm-6 text-right create"><a href="SignUp.aspx" title="Create your account">Create your Lolyhub account</a></div>
                <div class="col-xs-12 col-sm-12 col-md12 form">
                    <hr>
                    <div runat="server" id="messagestxt"></div>
                    <div>
                        <div id="loginForm">
                            <div class="form-group">
                                <input type="email" class="form-control" id="txtemail" runat="server" placeholder="Email or UserName" autocomplete="off" />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="txtpswd" runat="server" placeholder="Password" autocomplete="off" />
                            </div>
                        </div>
                        <div id="forgotForm" style="display: none;">
                            <input type="text" autocomplete="off" class="form-control" id="forgotEmail" runat="server" required="required" placeholder="Email or UserName" />
                        </div>

                        <div class="row">
                            <%--<div id="stayconnected" class="checkbox col-sm-6 col-md-5">
			    <label>
			      <input runat="server" id="rememberMe" type="checkbox" /> Stay signed in
			    </label>
			</div>--%>
                            <div id="forgotAsk" class="col-sm-6 col-md-6 pull-right text-right" style="line-height: 35px;">
                                <a href="#" onclick="showForgot()">Forget your password?</a>
                            </div>

                            <div id="signAsk" class="col-sm-6 col-md-6 pull-right text-right" style="line-height: 35px; display: none">
                                <a href="#" onclick="showsignin()">Sign in</a>
                            </div>
                        </div>

                        <hr>

                        <p class="text-center">
                            Using a puplic or shared account? Uncheck to protect your account<br />
                            <a href="#">Learn more</a>
                        </p>
                        <%--  <button  type="button" class="btn btn-primary btn-lg btn-block" runat="server">Sign In</button>--%>
                        <asp:Button ID="Button1" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="Sign In" OnClick="Button1_Click" UseSubmitBehavior="false" />
                        <a id="Button2" class="btn btn-primary btn-lg btn-block" runat="server" onclick="sendForgot()" style="display: none;">Send</a>
                    </div>

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
        <script>
            function showForgot() {
                alert("Forgot");

                $("#loginForm").hide();
                $("#forgotForm").show();

                $("#signinlbl").hide();
                $("#forgotlbl").show();

                $("#stayconnected").hide();

                $("#signAsk").show();
                $("#forgotAsk").hide();

                $("#Button1").hide();
                $("#Button2").show();


            };

            function showsignin() {
                alert("sign in");

                $("#loginForm").show();
                $("#forgotForm").hide();

                $("#signinlbl").show();
                $("#forgotlbl").hide();

                $("#stayconnected").show();

                $("#signAsk").hide();
                $("#forgotAsk").show();


                $("#Button1").show();
                $("#Button2").hide();
            };

            function sendForgot() {
                alert("Send Code");
                if ($("#forgotEmail").val() == "") {
                    alert("Enter UserName Or Email.");
                }
                else {

                    $.ajax({
                        type: "POST",
                        url: "Login.aspx/sendForgot",
                        // data: '{name: "' + programName + '",image:"' + imageSRC + '" }',
                        data: "{'email':'" + $("#forgotEmail").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: OnSuccess,
                        failure: function (response) {
                            alert(response.d);
                        }
                    });

                    function OnSuccess(response) {
                        alert(response.d);
                    }
                }
            };
        </script>
    </form>
</body>
</html>
