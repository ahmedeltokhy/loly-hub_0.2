<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editBranch.aspx.cs" Inherits="loly_hub_0._2.admin.editBranch" %>


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
     <link rel="stylesheet" href="css/uikit.min.css" />
        <script src="js/ajax.jquery.min.js"></script>
        <script src="js/uikit.min.js"></script>
    
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
                        <h3>Branches </h3>
                    </div>
                    <!-- End .section title -->
                    <div class="users-page">
                        <div class="row">
                            <div class="col-lg-8">
                                <div runat="server" id="container_temp"></div>
                                <form enctype="multipart/form-data" id="userForm" runat="server" method="post">
                                    <input id="idtxt" runat="server" hidden="hidden" />
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Branch ID</label>
                                                <input type="text" class="form-control" id="branchId" runat="server" placeholder="branch ID">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>branch Address</label>
                                                <input type="text" class="form-control" id="branchAddress" runat="server" placeholder="branch Address">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->


                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>phone</label>
                                                <input type="text" class="form-control" id="branchPhone" runat="server" placeholder="branch Phone">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->

                                   
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Retailer</label>
                                                <select class="form-control" id="RetailerSelect" runat="server">
                                                    <option value="-1">------</option>
                                                </select>
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                   
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
                var branchID = $("#branchId").val();
                var branchAddress = $("#branchAddress").val();
                var branchPhone = $("#branchPhone").val();
                var retailer = $("#RetailerSelect").val();
                var id = parseInt($("#idtxt").val());
                var dataArray = new Array(branchID, branchAddress, branchPhone, retailer,id);

         
         
                addProduct();
                function addProduct() {
                    $.ajax({
                        type: "POST",
                        url: "editBranch.aspx/saveBranch",
                        // data: '{name: "' + programName + '",image:"' + imageSRC + '" }',
                        data: "{'data':'" + JSON.stringify(dataArray) + "'}",
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
                    location.reload();
                }
                return false;
            });
        };



        function deleteImage(id) {
            alert("Delete old Image");
            $.ajax({
                type: "POST",
                url: "editProduct.aspx/deleteImage",
                // data: '{name: "' + programName + '",image:"' + imageSRC + '" }',
                data: "{'id':'" + id + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function OnSuccess1(response) {
                    $("#item-" + id).remove();
                    alert(response.d);

                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

    </script>
</body>
</html>
