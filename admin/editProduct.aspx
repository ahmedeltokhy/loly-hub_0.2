<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editProduct.aspx.cs" Inherits="loly_hub_0._2.admin.editProduct" %>


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
                        <h3>Users </h3>
                    </div>
                    <!-- End .section title -->
                    <div class="users-page">
                        <div class="row">
                            <div class="col-lg-8">
                                <div runat="server" id="container_temp"></div>
                                <form enctype="multipart/form-data" id="userForm" runat="server" method="post">
                                    <input type="hidden" runat="server" id="idtxt" />
                                    <div class="input-row ">
                                        <input type="file" name="logo" id="filer_input2" runat="server">
                                    </div>
                                    <!-- End .input-row -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="text" class="form-control" id="titletxt" runat="server" placeholder="Title">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <input type="text" class="form-control" id="description" runat="server" placeholder="Description">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->


                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Price</label>
                                                <input type="number" min="1" class="form-control" id="Pricetxt" runat="server">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->


                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Earned LP</label>
                                                <input type="number" min="1" class="form-control" id="earned" runat="server">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->

                                     <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>earned LP Expiry</label>
                                                <input type="number" class="form-control" id="expiryLP" runat="server">
                                            
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
                                                <select class="form-control" id="categorytxt" runat="server"></select>
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
                                                <select class="form-control" id="retailerSelect" runat="server"></select>
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->


                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Featured</label>
                                                <input class="form-control" type="checkbox" id="featured" runat="server">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->

                                     <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Vertical</label>
                                                <input class="form-control" type="checkbox" id="isVertical" runat="server">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->
                                  
                                      <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-row">
                                                <label>Product Expiry</label>
                                                <input type="number" class="form-control" id="productExpiry" runat="server">
                                            </div>
                                            <!-- End .input-row -->
                                        </div>
                                        <!-- End .col-md-6 -->
                                    </div>
                                    <!-- End .row -->
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
                var imageSRC = $(".input-row  .jFiler-item-thumb-image img");
                var oldImages = $("#container_temp .jFiler-item .jFiler-item-container .jFiler-item-thumb img");
                var title = $("#titletxt").val();
                var description = $("#description").val();
                var price = parseFloat($("#Pricetxt").val());
                var earnedLP = parseInt($("#earned").val());
                var category = parseInt($("#categorytxt").val());
                var retailer = parseInt($("#retailerSelect").val());
                var id = parseInt($("#idtxt").val());
                var featured = $("#featured")[0].checked;
                var earnedExpiry = parseInt($("#expiryLP").val());
                var productExpiry = parseInt($("#productExpiry").val());
                var imgArray = new Array;
                if ((oldImages.length == 0 && imageSRC.length == 0)) {
                    imgArray.push("/images/noimage.png");
                }
                if (imageSRC.length != 0) {
                    for (var i = 0; i < imageSRC.length; i++) {
                        imgArray.push(imageSRC[i].src);
                    }
                }
                var programName = $("#Nametxt").val();

                addProduct();
                function addProduct() {
                    $.ajax({
                        type: "POST",
                        url: "editProduct.aspx/saveProduct",
                        // data: '{name: "' + programName + '",image:"' + imageSRC + '" }',
                        data: "{'images':'" + JSON.stringify(imgArray) + "','title':'" + title + "','price':'" + price + "','category':'" + category + "','retailer':'" + retailer + "','description':'" + description + "','id':'" + id + "','featured':'" + featured + "','earnedLP':'" + earnedLP + "','earnedExpiry':'" + earnedExpiry + "','productExpiry':'" + productExpiry + "'}",
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
