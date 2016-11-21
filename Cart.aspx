<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="loly_hub_0._2.Cart" %>

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
  <body id="products" class="card-page">
      <form id="form1" runat="server">
<!--****************** Header *****************-->
  	<header>
<!--****************** NavBar *****************-->
	   	<nav class="navbar navbar-default" role="navigation">
<!--******************* Nav Container *****************-->
		  		<div class="container">
				    <div class="logged-in row">
              <div class="col-md-4">
                <div class="user-name">
                  Hello <a href="UserInfo.aspx"><b id="cartuser" runat="server"></b></a>
                  <ul>
                    <li><a href="UserInfo.aspx"><i class="fa fa-user"></i>Profile</a></li>
                    <li><a href="#"><i class="fa fa-history"></i>history</a></li>
                     <li><a onclick="deleteAllCookies()" href="logout.aspx"><i class="fa fa-lock"></i>LogOut</a></li>
                  </ul>
                </div><!-- End .user-name -->
                  <div class=" col-md-9">
                               
                            </div>
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
					                  <input class="btn btn-default" type="submit" value="&#xf002;" />
					               </span>

					            </div><!-- /input-group -->

						      </form>


						    <ul id="menu-right" class="nav navbar-nav navbar-right">
								<li><a href="wishlist.aspx"><i class="fa fa-heart-o" aria-hidden="true"></i><span class="noticon"><small id="wishIconList_ex" runat="server">0</small></span> Wish List</a></li>
								<li><a href="Cart.aspx"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span class="noticon"><small id="CartIconList_ex" runat="server">0</small></span>Cart</a></li>
							</ul>


					</div><!--****************** End of Menu *****************-->

					</nav> <!--****************** end of NavBar *****************-->
			   	</div> <!--****************** end of Container *****************-->
		   	</div> <!--****************** end of Page Header *****************-->
          <div class="col-sm-12">
            <div class="cat-navigation">
	            <a class="home" href="/"><i class="fa fa-home"></i></a>
	                      <a runat="server" id="categoryLink" href="#">Cart</a>
                       
	          </div><!-- End .cat-navigation -->
          </div><!-- End .col-sm-12 -->


	</header>

<!--************************************** END OF HEADER SECTION ********************************-->

	<div class="container" >
	  <div class="row" >


	    <div class="products  col-sm-12 col-md-9 col-lg-9" >

	        <div class="col-sm-12">

          </div><!-- End .col-sm-12 -->

          <div class="col-sm-12" >
            <div class="card-items" >
              <div class="title" id="container1" runat="server">
                <h3>Cart Items</h3>
              </div><!-- End .title -->
              <%--<div class="item" >
                <div class="thumb">
                  <img src="images/watch.png" alt="">
                </div><!-- End .thumb -->
                <div class="item-title">
                  <a href="#">Samsung Galaxy Gear Smartwatch</a>
                </div><!-- End .item-title -->
                <div class="quantity">
                  <p>Quantity</p>
                  <div  class="lp-count">
                    <div class="bttn plus"><i class="fa fa-plus"></i></div>
                    <input type="text" value="1">
                    <div class="bttn minus"><i class="fa fa-minus"></i></div>
                  </div><!-- End .lp-count -->
                </div><!-- End .quantity -->
                <div class="price-lp">
                  <p>Price LP</p>
                  <h4>5000</h4>
                </div><!-- End .price-lp -->
                <div class="remove">
                  <p><a class="remove-item" href="#"><i class="fa fa-times-circle-o"></i></a></p>
                </div><!-- End .remove -->
              </div><!-- End .item -->
              <div class="item">
                <div class="thumb">
                  <img src="images/watch.png" alt="">
                </div><!-- End .thumb -->
                <div class="item-title">
                  <a href="#">Samsung Galaxy Gear Smartwatch</a>
                </div><!-- End .item-title -->
                <div class="quantity">
                  <p>Quantity</p>
                  <div  class="lp-count">
                    <div class="bttn plus"><i class="fa fa-plus"></i></div>
                    <input type="text" value="1">
                    <div class="bttn minus"><i class="fa fa-minus"></i></div>
                  </div><!-- End .lp-count -->
                </div><!-- End .quantity -->
                <div class="price-lp">
                  <p>Price LP</p>
                  <h4>5000</h4>
                </div><!-- End .price-lp -->
                <div class="remove">
                  <p><a class="remove-item" href="#"><i class="fa fa-times-circle-o"></i></a></p>
                </div><!-- End .remove -->
              </div><!-- End .item -->
              <div class="item">
                <div class="thumb">
                  <img src="images/watch.png" alt="">
                </div><!-- End .thumb -->
                <div class="item-title">
                  <a href="#">Samsung Galaxy Gear Smartwatch</a>
                </div><!-- End .item-title -->
                <div class="quantity">
                  <p>Quantity</p>
                  <div  class="lp-count">
                    <div class="bttn plus"><i class="fa fa-plus"></i></div>
                    <input type="text" value="1">
                    <div class="bttn minus"><i class="fa fa-minus"></i></div>
                  </div><!-- End .lp-count -->
                </div><!-- End .quantity -->
                <div class="price-lp">
                  <p>Price LP</p>
                  <h4>5000</h4>
                </div><!-- End .price-lp -->
                <div class="remove">
                  <p><a class="remove-item" href="#"><i class="fa fa-times-circle-o"></i></a></p>
                </div><!-- End .remove -->
              </div><!-- End .item -->--%>
              <div class="total-count-items">
                <p>Total : <span class="number">15,000</span></p>
              </div><!-- End .total-count-items -->
            </div><!-- End .card-items -->

          </div><!-- End .col-sm-12-->
          <div class="clearfix"></div><!-- End .clearfix -->
          <div class="col-sm-12">
            <div id="select-redeemable">
              <h3 class="title">Select Your Redeemable Programs</h3><!-- End .title -->
              <div class="select-redeemable-items">
                <div class="row" id="programs" runat="server">
                 <%-- <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item " data-id="co-1">
                      <a href="#"><img src="images/co/co-1.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item " data-id="co-2">
                      <a href="#"><img src="images/co/co-2.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item " data-id="co-3">
                      <a href="#"><img src="images/co/co-3.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item " data-id="co-4">
                      <a href="#"><img src="images/co/co-4.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item " data-id="co-5">
                      <a href="#"><img src="images/co/co-5.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item " data-id="co-6">
                      <a href="#"><img src="images/co/co-1.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item " data-id="co-7">
                      <a href="#"><img src="images/co/co-2.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item " data-id="co-8">
                      <a href="#"><img src="images/co/co-3.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item " data-id="co-9">
                      <a href="#"><img src="images/co/co-5.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item " data-id="co-10">
                      <a href="#"><img src="images/co/co-1.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item " data-id="co-11">
                      <a href="#"><img src="images/co/co-2.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->
                  <div class="col-xs-6 ocol-sm-4 col-md-3 col-lg-2">
                    <div class="item " data-id="co-12">
                      <a href="#"><img src="images/co/co-3.png" alt=""><span class="icon"><i class="fa fa-check-circle"></i></span></a>
                    </div><!-- End .item -->
                  </div><!-- End .col-xs-6 ocol-sm-4 col-md-3 col-lg-2 -->--%>

                </div><!-- End .row -->
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
                  <div class="lp-num"><span>LP</span> <b>8000</b></div><!-- End .lp-num -->
                  <div class="proceed" id="callproceed" runat="server"><a href="#"><i class="fa fa-check"></i>proceed</a></div><!-- End .proceed -->
                </div><!-- End .checkout-count -->
              </div><!-- End table-responsive -->
            </div><!-- End #checkout-lp -->
          </div><!-- End .col-sm-12 -->
          <div class="clearfix"></div><!-- End .clearfix -->

	      </div>
           
        <div id="wishlist" class="col-xs-12 col-md-3">
    			<h4 class="title">Cart Summary <span id="kk" runat="server">()</span></h4><!-- End .title -->

          <div class="side-body">
            <div class="total">
              <p class="number"></p>
            </div><!-- End .total -->
            <button id="show-select-redeemable" type="button" class="btn btn-success">Proceed to checkout</button>
          </div><!-- End .side-body -->
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
       <input type="hidden" id="hdnpoints" runat="server">
        <input type="hidden" id="hdfuserid" runat="server">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
	 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
  <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/sticky-kit.min.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>
    <script src="js/script.js"></script>
 <script>
     (function () {
         var ncount = 0;
     })();
     var pageUrl = "/Cart.aspx";

     function deleteCartItem(productID, UserID) {
         var data = {};
         data.productID = parseInt(productID.toString());
         data.userID = parseInt(UserID.toString());
         var json = JSON.stringify(data);
         $.ajax({
             type: "POST",
             url: pageUrl + '/Deletecartitem',
             data: '{userid:' + UserID + ',productID:' + productID + '}',
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             dataFilter: function (data) { return data; },
             success: function (data) {

                 document.getElementById("CartIconList_ex").innerText = data.d;

             },

             failure: function (response) {
                 alert(response.d);
             }
         });

     }

            window.onload = function () {
                $("#callproceed").click(function () {
                    var productsElements = document.getElementsByClassName("productID");
                    var productsQuantityElements = document.getElementsByClassName("quantities");

                    var productsValues = new Array();

                    for (var i = 0; i < productsElements.length; i++) {
                     //   alert(productsElements[i].value);
                        productsValues.push(new Array(productsElements[i].value,productsQuantityElements[i].value));
                     //   alert(productsValues);
                    }
                    
                    var programIDs = document.getElementsByClassName("programIDval");
                    var programsPoints = document.getElementsByClassName("points2Redeem");
                    var programUsernames = document.getElementsByClassName("ProgramUserName");

                    var programValues = new Array();

                    for (var i = 0; i < programIDs.length; i++) {
                        programValues.push(new Array(programIDs[i].value, programsPoints[i].value, programUsernames[i].value,null));
                  //      alert(programValues);
                    }

                    var userID = parseInt($("#hdfuserid").val());

                  //  alert(userID);

                    var data = {};
                    data.products = productsValues;
                    data.userid = userID;
                    data.programs = programValues;
                    var json = JSON.stringify(data);


                    ///////////////////////////////////////////////////////////////
                   
                    
                    $.ajax({
                        type: "POST",
                        url: pageUrl + '/AddProceed1',
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        dataFilter: function (data) { return data; },
                        success: function (response) {
                            alert(response.d);
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
