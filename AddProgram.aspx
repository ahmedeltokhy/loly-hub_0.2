<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProgram.aspx.cs" Inherits="loly_hub_0._2.AddProgram" %>

<!DOCTYPE html>
<html lang="en">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Add Program Page</title>

    <!--****************** bootstrap stylesheet *****************-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <!--****************** Fonts *****************-->
    <link rel="stylesheet" href="fonts/font-awesome/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!--****************** Slider Stylesheets *****************-->


    <!--****************** JS files *****************-->





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
<body class="add-program">
    <form id="form1" runat="server">
        <!--****************** Header *****************-->
        <header>
            <!--****************** NavBar *****************-->
            <nav class="navbar navbar-default" role="navigation">
                <!--****************** Nav Container *****************-->
                <div class="container">
                    <div class="logged-in row">
                        <div class="col-xs-6 col-md-4">
                            <div class="user-name">
                                Hello <a href="UserInfo.aspx"><b runat="server" id="usernametxt"></b></a>
                                <ul>
                                    <li><a href="UserInfo.aspx"><i class="fa fa-user"></i>Profile</a></li>
                                    <li><a href="#"><i class="fa fa-history"></i>history</a></li>
                                    <li><a onclick="deleteAllCookies()" href="logout.aspx"><i class="fa fa-lock"></i>LogOut</a></li>
                                </ul>
                            </div>
                            <!-- End .user-name -->
                           
                            </div>
                            <!-- End  col-md-9 -->

                        </div>
                        <div class="loly col-xs-6 col-md-3 col-md-offset-5 text-right">
                            <h4>Loly Balance is : <b runat="server" id="lhptxt"></b></h4>
                        </div>
                    </div>
                </div>

            </nav>
            <!--****************** Page Header *****************-->
            <div class="page-header">
                <div class="container">
                    <nav class="navbar" role="navigation">

                        <!--****************** Navbar *****************-->
                        <div id="logo" class="navbar-header">
                            <a class="navbar-brand" href="products.aspx" title="LolyHub">LolyHub</a>
                        </div>
                        <div class="menu">

                            <!--Left Align
				      <ul id="category" class="nav navbar-nav navbar-left">
				         <li class="dropdown">
				            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
				               Shop By <b>Category</b>
				               <i class="fa fa-chevron-down" aria-hidden="true"></i>
				            </a>

                    <ul class="dropdown-menu">
				               <li><a href="#">Category 1</a></li>
				               <li><a href="#">Category 2</a></li>
				               <li><a href="#">Category 3</a></li>
				               <li><a href="#">Category 3</a></li>
				               <li><a href="#">Category 3</a></li>
				               <li><a href="#">Category 3</a></li>
				               <li><a href="#">Category 3</a></li>
				               <li><a href="#">Category 3</a></li>

				               <li class="divider"></li>
				               <li><a href="#">Category 4</a></li>
				               <li><a href="#">Category 4</a></li>
				               <li><a href="#">Category 4</a></li>
				               <li><a href="#">Category 4</a></li>

				               <li class="divider"></li>
				               <li><a href="#">Category 5</a></li>
				               <li><a href="#">Category 5</a></li>
				               <li><a href="#">Category 5</a></li>
				               <li><a href="#">Category 5</a></li>
				            </ul>

				         </li>
				      </ul>
				      ****************** end of dropdown *****************-->
                            <div id="search" class="navbar-form navbar-left" role="search">

                                <div class="input-group col-md-6">
                                    <input type="text" class="form-control" placeholder="Search">

                                    <span class="input-group-btn">
                                        <input class="btn btn-default" type="submit" value="&#xf002;" />
                                    </span>

                                </div>
                                <!-- /input-group -->

                            </div>


                            <ul id="menu-right" class="nav navbar-nav navbar-right">
                                <li><a href="wishlist.aspx"><i class="fa fa-heart-o" aria-hidden="true"></i><span class="noticon"><small runat="server" id="wishListTxt"></small></span>Wish List</a></li>
                                <li><a href="Cart.aspx"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span class="noticon"><small runat="server" id="cartTxt"></small></span>Cart</a></li>
                            </ul>


                        </div>
                        <!--****************** End of Menu *****************-->

                    </nav>
                    <!--****************** end of NavBar *****************-->
                </div>
                <!--****************** end of Container *****************-->
            </div>
            <!--****************** end of Page Header *****************-->

            <div class="col-sm-12">
            <div class="cat-navigation">
	            <a class="home" href="/"><i class="fa fa-home"></i></a>
	                      <a runat="server" id="categoryLink" href="#">Add Programs</a>
                       
	          </div><!-- End .cat-navigation -->
          </div><!-- End .col-sm-12 -->

        </header>

        <!--************************************** END OF HEADER SECTION ********************************-->

        <div id="notification" class="row">

            <div class="container">
                <div id="primary-text" class="col-xs-12 col-md-8">
                    <h3><font color="red">Add Your Points to Your Profile By Choosing Your Membership Programs</font></h3>
                    <%--	<button type="button" class="btn btn-primary text-right" runat="server">Skip</button>--%>
                    <asp:Button ID="Button1" CssClass="btn btn-primary text-right" runat="server" Text="Skip" OnClick="Button1_Click" />
                </div>
                <div id="secn-text" class="col-xs-6 col-md-4">
                    <h4>Loly Advice</h4>
                    <p>
                        You need to add and register one program
		at least <b>to start using Loly Points.</b>
                    </p>
                </div>
            </div>

        </div>

        <!--****************** END OF NOTIFICATIONS *****************-->
        <div id="sortby" class="row">

            <div class="container">

                <div class=" sortby col-xs-6 col-md-6">
                    <h4 class="col-xs-6 col-md-5 text-right">Sort Programs</h4>

                    <span class="col-xs-6 col-md-7">
                        <select id="programCategory" runat="server" class="form-control">
                            <option value="-1">View All</option>

                        </select>
                    </span>
                </div>
                <div class="byname col-xs-6 col-md-6">
                    <h4 class="col-xs-6 col-md-4 text-right">Search Programs</h4>
                    <span class="col-xs-6 col-md-7">
                        <input runat="server" id="programSearchtxt" type="text" class="form-control" placeholder="Search by Name">
                        <span class="input-group-btn">
                            <asp:Button runat="server" CssClass="btn btn-default" type="submit" value="&#xf002;" OnClick="search_Click" />
                        </span>
                    </span>

                </div>

            </div>

        </div>
        <!--****************** END OF Sort *****************-->
        <div id="add-section" class="row program-item">
            <div class="container">
                <h3>Loyality Programs</h3>
                <ul id="programList" runat="server" class="list-inline" style="width: 100%">
                </ul>
            </div>
        </div>

        <!--************************************** END OF ADD SECTION ********************************-->

        <div id="remove-section" class="row program-item">
            <div class="container">
                <h3>Registered Programs</h3>
                <ul id="registered" runat="server" class="list-inline" style="width: 100%">
                </ul>
            </div>
        </div>




        <!--************************************** END OF ADD SECTION ********************************-->


        <footer>

            <div class="container">
                <div class="row">

                    <div id="news" class="footer-widget col-xs-6 col-sm-4">

                        <h4 class="footer-title">Newsletter</h4>
                        <ul class="list-group">
                            <li class=""><a href="#">About</a></li>
                            <li class=""><a href="#">Privacy Policy</a></li>
                            <li class=""><a href="#">Terms&Conditions</a></li>
                            <li class=""><a href="#">Contact Us</a></li>
                            <li class=""><a href="#">Products</a></li>
                        </ul>
                        <ul class="list-group">
                            <li class=""><a href="#">Support</a></li>
                            <li class=""><a href="#">SiteMap</a></li>
                            <li class=""><a href="#">FAQ</a></li>
                            <li class=""><a href="#">Shipping</a></li>
                            <li class=""><a href="#">Returns</a></li>
                        </ul>
                    </div>

                    <div id="contact" class="footer-widget col-xs-6 col-sm-4">

                        <h4 class="footer-title">Contact Us</h4>
                        <strong>
                            <i class="fa fa-map-marker" aria-hidden="true"></i>Address:
                        </strong>
                        <p>
                            1234 Avenue, Exit 18, Riyadh 98765, KSA
                        </p>
                        <strong>
                            <i class="fa fa-phone" aria-hidden="true"></i>PHONE:
                        </strong>
                        <p>
                            (966) 11 456 789
                        </p>
                        <strong>
                            <i class="fa fa-envelope-o" aria-hidden="true"></i>Email:
                        </strong>
                        <p>
                            email@lolyhub.com
                        </p>

                    </div>
                    <!--****************** End of Contact Us *****************-->
                    <div id="subscribe" class="footer-widget col-xs-6 col-sm-4">
                        <h4 class="footer-title">Subscribe</h4>
                        <div class="col-lg-12">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Enter Your Email..">

                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        Subscribe
                                    </button>
                                </span>

                            </div>
                            <!-- /input-group -->

                        </div>
                        <!-- /.col-lg-6 -->
                        <ul class="social-icon">
                            <li><a href="" title="facebook"><i class="fa fa-facebook-official" aria-hidden="true"></i></a></li>
                            <li><a href="" title="twitter"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
                            <li><a href="" title="google plus"><i class="fa fa-google-plus-official" aria-hidden="true"></i></a></li>
                            <li><a href="" title="linkedin"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>

                        </ul>
                    </div>
                    <!--****************** col-xs-6 col-sm-4 *****************-->

                    <!--****************** END OF SUBSCRIBE *****************-->
                </div>
                <!--****************** End of Row *****************-->


            </div>
            <div class="copyrights row">
                <div class="container">
                    <div class="col-xs-8 col-sm-6">© 2016 <a href="#">LOLYHUB</a>. ALL RIGHTS RESERVED.</div>
                    <div class="col-xs-8 col-sm-6 text-right">
                        <img src="images/creditcards.png">
                    </div>
                </div>
            </div>
        </footer>
        <!--************************************** END OF FOOTER SECTION ********************************-->

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/sticky-kit.min.js"></script>
        <script src="js/bootstrap-datetimepicker.min.js"></script>
        <script src="js/script.js"></script>


    </form>
</body>
</html>
