<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProgram.aspx.cs" Inherits="loly_hub_0._2.admin.AddProgram" %>

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
                            <img src="/admin/images/icons/users.png" alt=""></div>
                        <!-- End .icon -->
                        <h3>Users </h3>
                    </div>
                    <!-- End .section title -->
                    <div class="users-page">
                        <div class="row">
                            <div class="col-lg-8">
                                <form enctype="multipart/form-data" id="userForm" runat="server" method="post">
                                    <div class="input-row ">
                                        <input type="file" name="logo" id="filer_input2" runat="server">
                                    </div>
                                    <!-- End .input-row -->
                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Program's Name</label>
                                                <input type="text" class="form-control" id="Nametxt" runat="server" placeholder="Program's Name">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->

                                    </div>
                                    <!-- End .row -->

                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Category</label>
                                                <select class="form-control" id="categorytxt" runat="server">
                                                    <option value="-1">-------Select Category---------</option>
                                                </select>
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->

                                     <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Country</label>
                                                <select class="form-control" id="country" runat="server">
                                                    <option value="-1">-------Select Country---------</option>
                                                </select>
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->

                                     <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Name Of Value</label>
                                                <input type="text" class="form-control" id="nameOfValue" runat="server" placeholder="Name Of Value">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->

                                    </div>
                                    <!-- End .row -->

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>URL</label>
                                                <input type="text" class="form-control" id="url" runat="server" placeholder="URL">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->

                                    </div>
                                    <!-- End .row -->

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Rate</label>
                                                <input type="number" class="form-control" id="rate" runat="server" placeholder="Rate">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->

                                    </div>
                                    <!-- End .row -->

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Revenu</label>
                                                <input type="number" class="form-control" id="revenu" runat="server" placeholder="Revenu">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Maximum Points</label>
                                                <input type="number" class="form-control" id="maxPoints" runat="server" placeholder="Maximum Points">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Minimum Points</label>
                                                <input type="number" class="form-control" id="minPoints" runat="server" placeholder="Minimum Points">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->

                                    <%-- Flags --%>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>username</label>
                                                <input class="form-control" type="checkbox" id="username" runat="server">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>password</label>
                                                <input class="form-control" type="checkbox" id="password" runat="server">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>pin code</label>
                                                <input class="form-control" type="checkbox" id="pinCode" runat="server">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>user ID</label>
                                                <input class="form-control" type="checkbox" id="userID" runat="server">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Email</label>
                                                <input class="form-control" type="checkbox" id="email" runat="server">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>mobile</label>
                                                <input class="form-control" type="checkbox" id="mobile" runat="server">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>otp</label>
                                                <input class="form-control" type="checkbox" id="otp" runat="server">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->
                                    <%-- End --%>
                                    <div class="input-row">
                                        <a href="#" id="Submit1" class="btn btn-danger">Save</a>
                                        <%--<asp:Button class="btn btn-danger" OnClick="saveProgram"  runat="server" Text="SUBMIT"/>--%>
                                    </div>
                                    <!-- End .input-row -->
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
        window.onload = function () {
            $("#Submit1").click(function () {
                var imageSRC = $(".jFiler-item-thumb-image img")[0].src;
                var programName = $("#Nametxt").val();
                var valueName = $("#nameOfValue").val();
                var url = $("#url").val();
                var rate = $("#rate").val();
                rate = parseFloat(rate);
                var revenue = parseFloat($("#revenu").val());
                var max = parseInt($("#maxPoints").val());
                var min = parseInt($("#minPoints").val());
                var category = parseInt($("#categorytxt").val());
                var country = parseInt($("#country").val());
                //flags

                var username = $("#username")[0].checked;
                var password = $("#password")[0].checked;
                var pinCode = $("#pinCode")[0].checked;
                var userID = $("#userID")[0].checked;
                var email = $("#email")[0].checked;
                var mobile = $("#mobile")[0].checked;
                var otp = $("#otp")[0].checked;
                var flags = new Array(username,password,pinCode,userID,email,mobile,otp);
                //end
               
                addProgram();
               
                function addProgram() {
                    $.ajax({
                        type: "POST",
                        url: "AddProgram.aspx/saveProgram",
                        data: '{name: "' + programName + '",image:"' + imageSRC + '",rate:' + rate + ',revenu:' + revenue + ',max:' + max + ',min:' + min + ',category:' + category + ',country:' + country + ',nameofvalue:"' + valueName + '",url:"' + url + '",flags:' + JSON.stringify(flags) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: OnSuccess,
                        failure: function (response) {
                            alert(response.d);
                        }
                    });
                }
                function OnSuccess(response) {
                    alert(response.d);
                }
                return false;
            });
        };
    </script>
</body>
</html>
