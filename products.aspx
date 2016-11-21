<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="products.aspx.cs" Inherits="loly_hub_0._2.products" %>

<!DOCTYPE html>
<html lang="en">
  <head>
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
  <body id="products">
      <form id="form1" runat="server">
<!--****************** Header *****************-->
  	<header>
<!--****************** NavBar *****************-->
	   	<nav class="navbar navbar-default" role="navigation">
<!--******************* Nav Container *****************-->
		  		<div class="container">
				    <div class="logged-in row">
					  <div class="col-md-4">
                          <input hidden runat="server" id="userIDhidden" />
              <div class="user-name">
                Hello <a href="UserInfo.aspx"><b runat="server" id="usernametxt"></b></a>
                <ul>
                  <li><a href="#"><i class="fa fa-user"></i>Profile</a></li>
                  <li><a href="#"><i class="fa fa-history"></i>history</a></li>
                  <li><a onclick="deleteAllCookies()" href="logout.aspx"><i class="fa fa-lock"></i>LogOut</a></li>
                </ul>
              </div><!-- End .user-name -->
            </div>
					  <div class="loly col-md-3 col-md-offset-5 text-right"><h4>Loly Balance is : <b runat="server" id="lhptxt"></b></h4></div>
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

				      <!--Left Align-->
				      <ul id="category" class="nav navbar-nav navbar-left">
				         <li class="dropdown">
				            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
				               Shop By <b>Category</b>
				               <i class="fa fa-chevron-down" aria-hidden="true"></i>
				            </a>

                    <ul class="dropdown-menu" runat="server" id="categoryItems">
				               
				            </ul>

				         </li>
				      </ul>
				      <!--****************** end of dropdown *****************-->
						      <form id="search" class="navbar-form navbar-left" role="search">

						        <div class="input-group col-md-6">
					               <input type="text" class="form-control" runat="server"  id="search_txt" placeholder="Search">

					               <span class="input-group-btn">
					                  <asp:Button runat="server" CssClass="btn btn-default" value="&#xf002;" OnClick="search_button_click"></asp:Button>
					               </span>

					            </div><!-- /input-group -->

						      </form>


						     <ul id="menu-right" class="nav navbar-nav navbar-right">
								<li><a href="wishlist.aspx"><i class="fa fa-heart-o" aria-hidden="true"></i><span class="noticon"><small runat="server" id="wishListTxt"></small></span> Wish List</a></li>
								<li><a href="Cart.aspx"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span class="noticon"><small runat="server" id="cartTxt"></small></span>Cart</a></li>
							</ul>


					</div><!--****************** End of Menu *****************-->

					</nav> <!--****************** end of NavBar *****************-->
			   	</div> <!--****************** end of Container *****************-->
		   	</div> <!--****************** end of Page Header *****************-->


	</header>

<!--************************************** END OF HEADER SECTION ********************************-->



	<div class="row">


		<div id="wallet" runat="server" class="col-xs-6 col-md-2">
			<h4>Wallet Details</h4>
            <div id="walletContainer" runat="server">
                
            </div>
		
			<div class="wallet-grid">
				<a href="AddProgram.aspx"  type="button" class="btn btn-primary btn-lg">Add Programs</a>
				<img src="images/lpiconlrg.png" title="LP icon">
				<h4 class="total">Total LP : <b id="totaltxt" runat="server"></b></h4>
				<small>Earnet Balance : <b id="balance" runat="server"></b></small>
			</div>
		</div>



		<div class="products col-xs-6 col-md-8">

				<h4 runat="server" id="pagetitle" class="section-title text-left">Products</h4>

				<ul runat="server" id="productList" class="products-list list-group" style="width:100%">
<%--
				   <div class="col-sm-6 col-md-4">
				     <li class="list-group-item">
                         
				     <div class="product-container">
				               <a href="#" class="heart" title="">
				                    <i class="fa fa-heart-o" aria-hidden="true"></i>
				                    <i class="fa fa-heart" aria-hidden="true" style="color:lightred;"></i>
				       </a>

				       <a href="#"><h4 class="title">HP Laptop Transformer</h4></a>
				         <div class="image-block">
				           <img src="images/product1.jpg">
				                    <button type="button" class="btn btn-default details">More Details</button>
				         </div>
				         <p class="product-summary">
				           is simply dummy text of the printing and typesetting industry.
				         </p>
				                   <span class="price">Price <b>10 LP</b></span>
				                   <div class="btn-group-vertical">
				                    <p> Earning <strong>2 LP</strong></p>
				                    <button type="button" class="btn btn-default add-card"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Add to Cart</button>
				                 </div>
				               </div>
                            
				     </li>
				    </div><!-- End .col-sm-6 col-md-4 -->

           <div class="col-sm-6 col-md-4">
				     <li class="list-group-item">
				     <div class="product-container">
				               <a href="" class="heart" title="">
				                    <i class="fa fa-heart-o" aria-hidden="true"></i>
				                    <i class="fa fa-heart" aria-hidden="true" style="color:lightred;"></i>
				       </a>

				       <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
				         <div class="image-block">
				           <img src="images/product1.jpg">
				                    <button type="button" class="btn btn-default details">More Details</button>
				         </div>
				         <p class="product-summary">
				           is simply dummy text of the printing and typesetting industry.
				         </p>
				                   <span class="price">Price <b>10 LP</b></span>
				                   <div class="btn-group-vertical">
				                    <p> Earning <strong>2 LP</strong></p>
				                    <button type="button" class="btn btn-default add-card"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Add to Cart</button>
				                 </div>
				               </div>
				     </li>
				   </div><!-- End .col-sm-6 col-md-4 -->

           <div class="col-sm-6 col-md-4">
				     <li class="list-group-item">
				     <div class="product-container">
				               <a href="" class="heart" title="">
				                    <i class="fa fa-heart-o" aria-hidden="true"></i>
				                    <i class="fa fa-heart" aria-hidden="true" style="color:lightred;"></i>
				       </a>

				       <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
				         <div class="image-block">
				           <img src="images/product1.jpg">
				                    <button type="button" class="btn btn-default details">More Details</button>
				         </div>
				         <p class="product-summary">
				           is simply dummy text of the printing and typesetting industry.
				         </p>
				                   <span class="price">Price <b>10 LP</b></span>
				                   <div class="btn-group-vertical">
				                    <p> Earning <strong>2 LP</strong></p>
				                    <button type="button" class="btn btn-default add-card"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Add to Cart</button>
				                 </div>
				               </div>
				     </li>
				   </div><!-- End .col-sm-6 col-md-4 -->

           <div class="col-sm-6 col-md-4">
				     <li class="list-group-item">
				     <div class="product-container">
				               <a href="" class="heart" title="">
				                    <i class="fa fa-heart-o" aria-hidden="true"></i>
				                    <i class="fa fa-heart" aria-hidden="true" style="color:lightred;"></i>
				       </a>

				       <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
				         <div class="image-block">
				           <img src="images/product1.jpg">
				                    <button type="button" class="btn btn-default details">More Details</button>
				         </div>
				         <p class="product-summary">
				           is simply dummy text of the printing and typesetting industry.
				         </p>
				                   <span class="price">Price <b>10 LP</b></span>
				                   <div class="btn-group-vertical">
				                    <p> Earning <strong>2 LP</strong></p>
				                    <button type="button" class="btn btn-default add-card"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Add to Cart</button>
				                 </div>
				               </div>
				     </li>
				   </div><!-- End .col-sm-6 col-md-4 -->
           <div class="col-sm-6 col-md-4">
				     <li class="list-group-item">
				     <div class="product-container">
				               <a href="" class="heart" title="">
				                    <i class="fa fa-heart-o" aria-hidden="true"></i>
				                    <i class="fa fa-heart" aria-hidden="true" style="color:lightred;"></i>
				       </a>

				       <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
				         <div class="image-block">
				           <img src="images/product1.jpg">
				                    <button type="button" class="btn btn-default details">More Details</button>
				         </div>
				         <p class="product-summary">
				           is simply dummy text of the printing and typesetting industry.
				         </p>
				                   <span class="price">Price <b>10 LP</b></span>
				                   <div class="btn-group-vertical">
				                    <p> Earning <strong>2 LP</strong></p>
				                    <button type="button" class="btn btn-default add-card"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Add to Cart</button>
				                 </div>
				               </div>
				     </li>
				   </div><!-- End .col-sm-6 col-md-4 -->
           <div class="col-sm-6 col-md-4">
				     <li class="list-group-item">
				     <div class="product-container">
				               <a href="" class="heart" title="">
				                    <i class="fa fa-heart-o" aria-hidden="true"></i>
				                    <i class="fa fa-heart" aria-hidden="true" style="color:lightred;"></i>
				       </a>

				       <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
				         <div class="image-block">
				           <img src="images/product1.jpg">
				                    <button type="button" class="btn btn-default details">More Details</button>
				         </div>
				         <p class="product-summary">
				           is simply dummy text of the printing and typesetting industry.
				         </p>
				                   <span class="price">Price <b>10 LP</b></span>
				                   <div class="btn-group-vertical">
				                    <p> Earning <strong>2 LP</strong></p>
				                    <button type="button" class="btn btn-default add-card"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Add to Cart</button>
				                 </div>
				               </div>
				     </li>
				   </div><!-- End .col-sm-6 col-md-4 -->
           <div class="col-sm-6 col-md-4">
				     <li class="list-group-item">
				     <div class="product-container">
				               <a href="" class="heart" title="">
				                    <i class="fa fa-heart-o" aria-hidden="true"></i>
				                    <i class="fa fa-heart" aria-hidden="true" style="color:lightred;"></i>
				       </a>

				       <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
				         <div class="image-block">
				           <img src="images/product1.jpg">
				                    <button type="button" class="btn btn-default details">More Details</button>
				         </div>
				         <p class="product-summary">
				           is simply dummy text of the printing and typesetting industry.
				         </p>
				                   <span class="price">Price <b>10 LP</b></span>
				                   <div class="btn-group-vertical">
				                    <p> Earning <strong>2 LP</strong></p>
				                    <button type="button" class="btn btn-default add-card"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Add to Cart</button>
				                 </div>
				               </div>
				     </li>
				   </div><!-- End .col-sm-6 col-md-4 -->
                    --%>

				</ul>
			</div>

		

	</div>
<!--************************************** END OF PRODUCT SECTION ********************************-->
<!--************************************** END OF PRODUCT SECTION ********************************-->

		<div id="partners">
			<div class="container">
				<h4 class="section-title text-center">OUR PARTNERS & PROGRAMS</h4>
				<ul class="list-group">
				   <li class=""><img src="images/partner1.png"></li>
				   <li class=""><img src="images/partner2.png"></li>
				   <li class=""><img src="images/partner3.png"></li>
				   <li class=""><img src="images/partner4.png"></li>
				   <li class=""><img src="images/partner5.png"></li>
				</ul>
			</div>
		</div>


	</div>
<!--************************************** END OF Partner section ********************************-->

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
		                  <button class="btn btn-default" type="button" >
		                     Subscribe
		                  </button>
		               </span>

		            </div><!-- /input-group -->

		         </div><!-- /.col-lg-6 -->
		         <ul class="social-icon">
		         	<li><a href="" title="facebook"><i class="fa fa-facebook-official" aria-hidden="true"></i></a></li>
		         	<li><a href="" title="twitter"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
		         	<li><a href="" title="google plus"><i class="fa fa-google-plus-official" aria-hidden="true"></i></a></li>
		         	<li><a href="" title="linkedin"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>

		         </ul>
		      </div>  <!--****************** col-xs-6 col-sm-4 *****************-->

	<!--****************** END OF SUBSCRIBE *****************-->
		   </div> <!--****************** End of Row *****************-->


		</div>
		   <div class="copyrights row">
		   	<div class="container">
		   	    <div class="col-xs-8 col-sm-6">© 2016 <a href="#">LOLYHUB</a>. ALL RIGHTS RESERVED.</div>
		      	<div class="col-xs-8 col-sm-6 text-right"><img src="images/creditcards.png"></div>
		    </div>
		   </div>
	</footer>
<!--************************************** END OF FOOTER SECTION ********************************-->

      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/slick.min.js"></script>
      <script src="js/sticky-kit.min.js"></script>
      <script src="js/bootstrap-datetimepicker.min.js"></script>
      <script src="js/script.js"></script>
        <script>
            var pageUrl = "/products.aspx";
            function fnAddWishIcon(productID,i) {
                //$(this).css("opacity", "10");
                $.ajax({
                    type: "POST",
                    url: pageUrl + '/AddWishlist',
                    data: '{userid:' + $('#<%=hdfuserid.ClientID%>').val() + ',productid:' + productID + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    dataFilter: function (data) { return data; },
                    success: function (data) {
                        if (data.d == 0)
                            alert("This product is already exist in WishList");
                        else
                        {
                            document.getElementById("wishListTxt").innerText = data.d;
                            alert("This product is added in WishList");
                            $("#wish_" + i).attr("style", "color:lightred;opacity:10");
                            $("#wish_" + i).attr("onclick", "javascript: removeWishList(" + productID + "," + i + ");");
                           // window.form1.submit()
                        }
                            
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }

            function removeWishList(productID,i) {
                //$(this).css("opacity", "10");
                $.ajax({
                    type: "POST",
                    url: pageUrl + '/removeWishList',
                    data: '{userid:' + $('#<%=hdfuserid.ClientID%>').val() + ',productid:' + productID + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    dataFilter: function (data) { return data; },
                    success: function (data) {
                        if (data.d == -1) {
                            alert("there is problem in removing this product from wish list, please try again later or contact the administrator.");
                        }
                        else {
                            alert("product removed from wish list.");
                            $("#wish_" + i).removeAttr("style");
                            $("#wish_" + i).attr("onclick", "javascript: fnAddWishIcon(" + productID + "," + i + ");");
                            document.getElementById("wishListTxt").innerText = data.d;
                           // window.location.replace("products.aspx");
                        }
                            
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
        </script>
        <script>
            var pageUrl = "/products.aspx";
            function fnAddCartIcon(productID) {

                $.ajax({
                    type: "POST",
                    url: pageUrl + '/Add2Cart',
                    data: '{userid:' + $('#<%=hdfuserid.ClientID%>').val() + ',productid:' + productID + ',quantity:1}',
                                       contentType: "application/json; charset=utf-8",
                                       dataType: "json",
                                       dataFilter: function (data) { return data; },
                                       success: function (data) {
                                           if (data.d == 0)
                                               alert("This product is already exist in Cart");
                                           else
                                               document.getElementById("cartTxt").innerText = data.d;
                                       },
                                       failure: function (response) {
                                           alert(response.d);
                                       }
                                   });

                               }

        </script>
        <asp:HiddenField ID="hdfuserid" runat="server" />
</form>
  </body>
</html>
