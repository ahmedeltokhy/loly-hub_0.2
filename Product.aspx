<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="loly_hub_0._2.product" %>

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
      <link rel="stylesheet" type="text/css" href="css/styleNew.css">
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
  <body id="products" class="product-page">
      <form id="form1" runat="server">
<!--****************** Header *****************-->
  	<header>
<!--****************** NavBar *****************-->
	   	<nav class="navbar navbar-default" role="navigation">
<!--******************* Nav Container *****************-->
		  		<div class="container">
				    <div class="logged-in row">
					  <div class="user-name">
                  Hello <a href="UserInfo.aspx"><b id="usernametxt" runat="server"></b></a>
                  <ul>
                    <li><a href="#"><i class="fa fa-user"></i>Profile</a></li>
                    <li><a href="#"><i class="fa fa-history"></i>history</a></li>
                   <li><a onclick="deleteAllCookies()" href="logout.aspx"><i class="fa fa-lock"></i>LogOut</a></li>
                  </ul>
                </div><!-- End .user-name -->
                        
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

				            <ul class="dropdown-menu">
				               <li><a href="#">Category 1</a></li>
				               <li><a href="#">Category 2</a></li>
				               <li><a href="#">Category 3</a></li>

				               <li class="divider"></li>
				               <li><a href="#">Category 4</a></li>

				               <li class="divider"></li>
				               <li><a href="#">Category 5</a></li>
				            </ul>

				         </li>
				      </ul>
				      <!--****************** end of dropdown *****************-->
						      <form id="search" class="navbar-form navbar-left" role="search">

                                <div class="input-group col-md-6">
                                    <input type="text" class="form-control" placeholder="Search">

                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-search" aria-hidden="true"></i>
                                        </button>
                                    </span>

					            </div><!-- /input-group -->

						      </form>


						    <ul id="menu-right" class="nav navbar-nav navbar-right">
								<li><a href="wishlist.aspx"><i class="fa fa-heart-o" aria-hidden="true"></i><span class="noticon"><small runat="server" id="wishListTxt">15</small></span> Wish List</a></li>
								<li><a href="Cart.aspx"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span class="noticon"><small runat="server" id="cartTxt">25</small></span>Cart</a></li>
							</ul>


					</div><!--****************** End of Menu *****************-->

					</nav> <!--****************** end of NavBar *****************-->
			   	</div> <!--****************** end of Container *****************-->
		   	</div> <!--****************** end of Page Header *****************-->


	</header>

<!--************************************** END OF HEADER SECTION ********************************-->

	<div class="container">
	  <div class="row">


	    <div class="products  col-sm-7 col-md-9 col-lg-10">

	        <div class="col-sm-12">
            <div class="cat-navigation">
	            <a class="home" href="/"><i class="fa fa-home"></i></a>
	                      <a runat="server" id="categoryLink" href="#"></a>
                        <span><i class="fa fa-angle-double-right"></i></span>
	                      <a href="#" runat="server" id="titleTxt"></a>
	          </div><!-- End .cat-navigation -->
          </div><!-- End .col-sm-12 -->
          <div class="col-sm-5 col-md-4">
            <div id="product-gallery">
              <div class="thumbs">
                <ul runat="server" id="productImage">
                  
                </ul>
              </div><!-- End .thumbs -->
              <div class="big-image active">
                <img runat="server" id="firstImage" src="" alt="">
              </div><!-- End .big-image -->
            </div><!-- End #product-gallery -->
          </div><!-- End .col-sm-5 col-md-4 -->
          <div class="col-sm-7 col-md-8">
            <div class="product-details">
              <h4 class="title" id="title" runat="server">
                <label id="title_label" runat="server"></label>
                <div class="add-to-wish">
                  <a href="#" id="wishList" runat="server" class="heart" title="">
  	                 <i class="fa fa-heart-o" aria-hidden="true"></i>
  	                 Add to Wish List
  	               </a>

                </div><!-- End .add-to-wish -->
              </h4><!-- End .title -->


      	        <div class="redeem-det">
      	          <h4><label runat="server" id="price"></label> <b>LP</b> <span>Plus You Earning <b>2 LP</b></span></h4>
                  <div id="this-product-lp" class="lp-countEx">
                    <div class="bttn plus"><i class="fa fa-plus"></i></div>
                    <input id="qnty" type="text" value="1">
                    <div class="bttn minus"><i class="fa fa-minus"></i></div>
                  </div><!-- End .lp-count -->
      	          <button id="show-select-redeemable" type="button" class="btn btn-success"><i class="fa fa-shopping-cart "></i>Redeem</button>
      	        </div><!-- End .redeem-det -->
                <div class="product-text">
                  <p>Planning a party is a fun process, especially if you are doing it together with our wonderful personnel. With over 10,000 products to choose from, our online Party Center keeps holding leading positions in the sphere of party supplies. Being a leading company in the sphere tightly connected with the...
                  </p>
                </div><!-- End .product-text -->
                <div class="categorys">
                  <span>Categories :</span> <a href="#">Mobile</a>, <a href="#">Samsung</a>, <a href="#">Smart Phones</a>, <a href="#">Smart Watch</a>
                </div><!-- End .categorys -->
                <div class="social-media">
                  <a class="facebook" href="#">
                    <i class="fa fa-facebook"></i>
                    <span>
                      Share On<br />
                      Facebook
                    </span>
                  </a>
                  <a class="twitter" href="#">
                    <i class="fa fa-twitter"></i>
                    <span>
                      Tweet This<br />
                      Product
                    </span>
                  </a>
                  <a class="pinterest" href="#">
                    <i class="fa fa-pinterest-p "></i>
                    <span>
                      Pin This<br />
                      Product
                    </span>
                  </a>
                  <a class="mail" href="#">
                    <i class="fa fa-envelope "></i>
                    <span>
                      Mail This<br />
                      Product
                    </span>
                  </a>
                </div><!-- End .social-media -->
            </div><!-- End .product-details -->

          </div><!-- End .col-sm-7 col-md-8 -->
          <div class="clearfix"></div><!-- End .clearfix -->
          <div class="col-sm-12">
            <div id="select-redeemable">
              <h3 class="title">Select Your Redeemable Programs</h3><!-- End .title -->
              <div class="select-redeemable-items">
                <div class="row" runat="server" id="programs">
                <%--  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item ">
                      <a href="#"><img src="images/co/co-1.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item ">
                      <a href="#"><img src="images/co/co-2.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item ">
                      <a href="#"><img src="images/co/co-3.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item ">
                      <a href="#"><img src="images/co/co-4.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item ">
                      <a href="#"><img src="images/co/co-5.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item ">
                      <a href="#"><img src="images/co/co-1.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item ">
                      <a href="#"><img src="images/co/co-2.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item ">
                      <a href="#"><img src="images/co/co-3.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item ">
                      <a href="#"><img src="images/co/co-5.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item ">
                      <a href="#"><img src="images/co/co-1.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item ">
                      <a href="#"><img src="images/co/co-2.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item ">
                      <a href="#"><img src="images/co/co-3.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->

                </div><!-- End .row -->--%>
              </div><!-- End .select-redeemable-items -->
            </div><!-- End #select-redeemable -->
          </div><!-- End .col-sm-12 -->
          <div class="col-sm-12">
            <div id="checkout-lp">
              <h3 class="title">Checkout with LP</h3><!-- End .title -->
              <div class="table-responsive">
                <table class="table">
                    <tr>
                      <td>Program</td>
                      <td>Redeemable Points</td>
                      <td>LP to Redeem</td>
                      <td>LP to Checkout</td>

                    </tr>


                </table>
                  <div class="checkout-count">
                   <div class="lp-num"><span>LP</span><b></b></div>
                                        <!-- End .lp-num -->
                <div class="proceed" id="callproceed" runat="server"><a href="#"><i class="fa fa-check"></i>proceed</a></div>
                </div><!-- End .checkout-count -->
              </div><!-- End table-responsive -->
            </div><!-- End #checkout-lp -->
          </div><!-- End .col-sm-12 -->
          <div class="clearfix"></div><!-- End .clearfix -->
          <h4 class="section-title text-center">Related To This Item</h4>
	        <ul class="products-list list-group">

	           <div class="col-sm-6 col-md-4">
	             <li class="list-group-item  ">
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
	             <li class="list-group-item  ">
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
	             <li class="list-group-item  ">
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



	        </ul>
	      </div>

	   

	  </div>
	</div><!-- End .container -->
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

		      <div id="news" class="footer-widget  col-sm-4">

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

		      <div id="contact" class="footer-widget  col-sm-4">

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
		      <div id="subscribe" class="footer-widget  col-sm-4">
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
		      </div>  <!--******************  col-sm-4 *****************-->

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
        <input type="hidden" id="hdfuserid" runat="server">
        <input type="hidden" id="hdnpoints" runat="server">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
	<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
  <script src="js/jquery-1.7.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <script src="js/script.js"></script>
       <script>
            (function () {
                var ncount = 0;
            })();
            var pageUrl = "/Product.aspx";
            window.onload = function () {
                $("#callproceed").click(function () {
                    var arrSubProducts = new Array();
                    var arrSubPoints = new Array();
                    for (i = 0; i < ncount; i++) {
                        arrSubProducts[i] = parseInt($("#hiddenpid" + (i + 1)).val())
                        arrSubPoints[i] = parseInt($("#input" + (i + 1)).val())
                    }
                    var data = {};
                    data.quantity = parseInt($("#qnty").val());
                    data.userid = parseInt($("#hdfuserid").val());
                    data.arrSubProducts = arrSubProducts;
                    data.arrSubPoints = arrSubPoints;
                    var json = JSON.stringify(data);

                    $.ajax({
                        type: "POST",
                        url: pageUrl + '/AddProceed',
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        dataFilter: function (data) { return data; },
                        success: function (response) {
                            alert("Pointst Redeemed successfully");
                            window.location.reload();
                        },
                        failure: function (response) {
                            alert(response.d);
                        }
                    });
                });
            };

        </script>
</form>
  </body>
</html>
