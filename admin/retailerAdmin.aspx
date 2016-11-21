<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="retailerAdmin.aspx.cs" Inherits="loly_hub_0._2.admin.retailerAdmin" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CMS</title>
    <meta name="description" content=" " />
    <meta name="author" content=" " />
    <meta name="HandheldFriendly" content="true" />
    <meta name="MobileOptimized" content="320" />
    <!-- Use maximum-scale and user-scalable at your own risk. It disables pinch/zoom. Think about usability/accessibility before including.-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="stylesheet" type="text/css" href="/admin/css/lib/bootstrap-min.css">
    <link rel="stylesheet" type="text/css" href="/admin/css/style.css">
    <!--[if lt IE 9]>
          <script src="js/vendor/html5shiv.min.js"></script>
          <script src="js/vendor/respond.min.js"></script>
    <![endif]-->
    <style>
#search div{
    display:inline-block;
}
    </style>
</head>
<body>
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="logo">
                        <a href="#">
                            <img src="/admin/images/logo.png" alt=""></a>
                    </div>
                    <!-- End .logo -->
                </div>
                <!-- End .col-md-3 -->
                <div class=" col-md-9">
                    <a id="touch-menu" class="mobile-menu" href="#"><i class="fa fa-bars"></i>Menu</a>
                    <div class="main-menu ">
                        <ul class="menu">
                            <li><a href="/admin/Default.aspx">Home</a></li>
                            <li><a href="/admin/Programs.aspx">Programs</a></li>
                            <li><a href="/admin/Products.aspx">Products</a></li>
                            <li><a href="/admin/users.aspx">Users</a></li>
                            <li><a href="/admin/Categories.aspx">Categories</a></li>
                            <li><a href="/admin/retailer.aspx">Retailer</a></li>
                            <div class="user-area">
                                <a href="#"><i class="fa fa-user-plus"></i>Sign Up</a>
                                <a href="#"><i class="fa fa-key"></i>Sign In</a>
                            </div>
                            <!-- End .user-area -->
                        </ul>
                    </div>
                    <!-- end main-menu -->
                </div>
                <!-- End  col-md-9 -->

            </div>
            <!-- End .row -->
        </div>
        <!-- End .container -->
    </div>
    <!-- End .header -->
    <section class="cms-section">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-2">
                    <div class="section title">
                        <div class="icon">
                            <img src="/admin/images/icons/categories.png" alt="">
                        </div>
                        <!-- End .icon -->
                        <h3>Retailer Admin </h3>
                    </div>
                    <!-- End .section title -->
                    <form runat="server" id="searchForm">
                    <div class="users-page">
                        <h4>Search orders</h4>
                        <hr />
                       
                             <div>
                            <div runat="server" id="search">
                                <div id="radioButtons" runat="server">
                                    <input type="radio" checked name="group" runat="server" value="" id="orderID" />
                                    Order ID
                                    <br />
                                    <input type="radio" name="group" runat="server" value="" id="mobile" />
                                    Mobile Number<br />

                                </div>
                                <div id="searchdata">
                                    <input type="number" runat="server" id="searchtxt" /> <br />
                                    <asp:Button type="submit" runat="server" id="searchbtn" value="Search" OnClick="searchbtn_Click" Text="Search" />
                                </div>
                            </div>

                               

                        </div>
                       

                       <div runat="server" id="orderDetails">
                           
                       </div>

                        <div runat="server" id="soldMessage">
                            This order already recieved.
                        </div>
                          <div id="sms" runat="server">
                                     <div runat="server" id="sendSMS">
                                         <asp:Button runat="server" ID="sendSMSbtn" Text="Send SMS" OnClick="sendSMSbtn_Click" />
                                     </div>

                              <div runat="server" id="verifySMS">
                                  <div runat="server" id="errorMessage"></div>
                                  <input type="text" maxlength="5" runat="server" id="verifyTxt" />
                                  <asp:Button runat="server" ID="verifybtn" Text="Verify" OnClick="verifybtn_Click" />
                              </div>
                                 </div>
                        <div runat="server" id="billNumber">
                            <label>Enter Bill Number</label><br />
                            <input type="text" runat="server" id="billNumbertxt" />
                             <asp:Button runat="server" ID="billNumberbtn" Text="Send" OnClick="billNumberbtn_Click" />
                        </div>

                        <div runat="server" id="finishMessage">
                            Done.<br />
                            Thanks.<br />
                            <a href="retailerAdmin.aspx">Begin again</a>
                        </div>
                    </div>
                    </form>
                    <label id="message" runat="server"></label>
                </div>
                <!-- End .col-lg-8 -->
            </div>
            <!-- End .row -->
        </div>
        <!-- End .programs-page -->
        </div>
                <!-- End .col-md-10 col-md-offset-2 -->
        </div>
            <!-- End .row -->
        </div>
        <!-- End .container -->
    </section>
    <!-- End .cms-section -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="rights">
                        <img src="/admin/images/footer-logo.png" alt="">
                        <p>© 2016 LOLYHUB. ALL RIGHTS RESERVED.</p>
                    </div>
                    <!-- End .rights -->
                </div>
                <!-- End .col-sm-6 -->
                <div class="col-sm-6">
                    <div class="visa">
                        <img src="/admin/images/visa.png" alt="">
                    </div>
                    <!-- End .visa -->
                </div>
                <!-- End .col-sm-6 -->
            </div>
            <!-- End .row -->
        </div>
        <!-- End .container -->
    </footer>
    <script src="/admin/js/vendor/jquery.min.js" charset="utf-8"></script>
    <script src="/admin/js/vendor/bootstrap.min.js" charset="utf-8"></script>
    <script src="/admin/js/lib.js" charset="utf-8"></script>
    <script src="/admin/js/script.js" charset="utf-8"></script>
</body>
</html>
