<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editUser.aspx.cs" Inherits="loly_hub_0._2.admin.editUser" %>

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
                            <li><a href="/admin/categories.aspx">Categories</a></li>
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
                            <img src="/admin/images/icons/users.png" alt=""></div>
                        <!-- End .icon -->
                        <h3>Users </h3>
                    </div>
                    <!-- End .section title -->
                    <div class="users-page">
                        <div class="row">
                            <div class="col-lg-8">
                                <form action="editUser.aspx/saveUser" id="userForm" runat="server" method="post">
                                    <input type="hidden" runat="server" id="useridForm" />
                                    <div class="input-row ">
                                        <input type="file" name="files[]" id="filer_input2" runat="server" multiple="multiple">
                                    </div>
                                    <!-- End .input-row -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="text" class="form-control" id="firstNametxt" runat="server" placeholder="First Name">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="text" class="form-control" id="countrytxt" runat="server" placeholder="Country">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="text" class="form-control" id="middleNametxt" runat="server" placeholder="Middle name">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="text" class="form-control" id="citytxt" runat="server" placeholder="City">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="text" class="form-control" id="lastNametxt" runat="server" placeholder="Last name">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="text" class="form-control" id="statetxt" runat="server" placeholder="State">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="text" class="form-control" id="usernametxt" runat="server" placeholder="User Name">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->

                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="text" class="form-control" id="passwordtxtr" runat="server" placeholder="Password">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="text" class="form-control" id="addresstxt" runat="server" placeholder="Address">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="text" class="form-control" id="emailtxt" runat="server" placeholder="Email">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="text" class="form-control" id="ziptxt" runat="server" placeholder="Zip code">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="tel" class="form-control" id="mobiletxt" runat="server" placeholder="Mobile">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="date" class="form-control" id="dobtxt" runat="server" placeholder="Date Of Birth">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <select runat="server" id="roleSelect" class="form-control" placeholder="Role"></select>
                                            </div>
                                            <!-- End .input-row -->
                                             <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <select runat="server" id="retailerSelect" class="form-control" placeholder="retailer">
                                                    <option value="-1">--------</option>
                                                </select>
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="checkbox" class="" id="active" runat="server" value="Active"><span> Active</span>
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->

                                    </div>
                                    <!-- End .row -->



 <div class="col-md-6">
                                    <div class="input-row">
                                        <asp:Button class="btn btn-danger" runat="server" Text="SUBMIT" />
                                    </div>
                                    <!-- End .input-row -->
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
                        <img src="/admin/images/visa.png" alt=""></div>
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
    <script>
        $(document).ready(function () {
            var role = $('#roleSelect').val();
            if (role == "4") {
                $("#retailerSelect").show();
            }
            else {
                $("#retailerSelect").hide();
                $("#retailerSelect").val(-1);
            }
            $('#roleSelect').on('change', function () {
                var role = $('#roleSelect').val();
                if (role == "4") {
                    $("#retailerSelect").show();
                }
                else {
                    $("#retailerSelect").hide();
                    $("#retailerSelect").val(-1);
                }
            });
        });

    </script>
</body>
</html>
