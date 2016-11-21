<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="loly_hub_0._2.admin.Categories" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CMS-Categries Page</title>
    <meta name="description" content=" " />
    <meta name="author" content=" " />
    <meta name="HandheldFriendly" content="true" />
    <meta name="MobileOptimized" content="320" />
    <!-- Use maximum-scale and user-scalable at your own risk. It disables pinch/zoom. Think about usability/accessibility before including.-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="stylesheet" type="text/css" href="css/lib/bootstrap-min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!--[if lt IE 9]>
          <script src="js/vendor/html5shiv.min.js"></script>
          <script src="js/vendor/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="logo">
                        <a href="#">
                            <img src="images/logo.png" alt=""></a>
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
                            <img src="images/icons/categories.png" alt=""></div>
                        <!-- End .icon -->
                        <h3>Categories</h3>
                        <a class="btn btn-success" href="/admin/AddCategory.aspx">ADD NEW</a>
                    </div>
                    <!-- End .section title -->
                    <div class="table-page">
                        <div runat="server" id="tableContainer" class="table-responsive">
                        </div>
                        <!-- End .table-responsive -->
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
                        <img src="images/footer-logo.png" alt="">
                        <p>© 2016 LOLYHUB. ALL RIGHTS RESERVED.</p>
                    </div>
                    <!-- End .rights -->
                </div>
                <!-- End .col-sm-6 -->
                <div class="col-sm-6">
                    <div class="visa">
                        <img src="images/visa.png" alt=""></div>
                    <!-- End .visa -->
                </div>
                <!-- End .col-sm-6 -->
            </div>
            <!-- End .row -->
        </div>
        <!-- End .container -->
    </footer>
    <script src="js/vendor/jquery.min.js" charset="utf-8"></script>
    <script src="js/vendor/bootstrap.min.js" charset="utf-8"></script>
    <script src="js/lib.js" charset="utf-8"></script>
    <script src="js/script.js" charset="utf-8"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
    <script>
        function deleteUser(id, row) {
            $.ajax({
                type: "POST",
                url: "Categories.aspx/delete",
                data: '{id: ' + id + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function OnSuccess(response) {

                    alert(response.d);
                    if (response.d != "User Can't be deleted.")
                        $("#row_" + row).remove();
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
    </script>
</body>
</html>
