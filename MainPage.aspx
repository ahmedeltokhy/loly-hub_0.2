<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="loly_hub_0._2.MainPage" %>

<!DOCTYPE html>
<html lang="en">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Lolyhub Website</title>

    <!--****************** bootstrap stylesheet *****************-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="slider/css/style.css" />

    <!--****************** Fonts *****************-->
    <link rel="stylesheet" href="fonts/font-awesome/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!--****************** Slider Stylesheets *****************-->


    <!--****************** JS files *****************-->
		<script type="text/javascript" src="slider/js/modernizr.custom.28468.js"></script>





    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body  id="home">
    <form id="form1" runat="server">
   <!--****************** Header *****************-->
  	<header>
<!--****************** NavBar *****************-->
	   	<nav class="navbar navbar-default" role="navigation">
<!--****************** Nav Container *****************-->
			   <div runat="server" id="sign" class="container">
			      <ul class="nav navbar-nav navbar-right">
			         <li class="active"><a href="SignUp.aspx"><i class="fa fa-user-plus" aria-hidden="true"></i>
 Signup</a></li>
			         <li><a href="Login.aspx"><i class="fa fa-sign-in" aria-hidden="true"></i> login</a></li>	
			      </ul>
			   </div>
			   
		</nav>
<!--****************** Page Header *****************-->
		   	<div class="page-header">
			   	<div class="container">
			   		<nav class="navbar" role="navigation">

<!--****************** Navbar *****************-->
				   <div id="logo" class="navbar-header">
				      <a class="navbar-brand" href="#" title="LolyHub">LolyHub</a>
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
								<li><a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i><span class="noticon"><small>0</small></span> Wish List</a></li>
								<li><a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span class="noticon"><small>0</small></span>Cart</a></li>
							</ul>

						      
					</div><!--****************** End of Menu *****************-->
					   
					</nav> <!--****************** end of NavBar *****************-->
			   	</div> <!--****************** end of Container *****************-->
		   	</div> <!--****************** end of Page Header *****************-->



			<div id="da-slider" class="da-slider">
				<div class="da-slide">
					<h2>Join Lolyhub now!</h2>
					<p>It’s free! Earn 100 points just by signing in!</p>
					<a href="#" class="da-link">Join Now</a>
					<div class="da-img"><img src="slider/images/1.png" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<h2>Manage your points</h2>
					<p>If lost counting your miles, or points. Lolyhub can help manage all of your rewarding points into one wallat</p>
					<a href="#" class="da-link">Read more</a>
					<div class="da-img"><img src="slider/images/2.png" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<h2>Revolution</h2>
					<p>You can almost get anything you wish for in lolyhub's market place</p>
					<a href="#" class="da-link">Read more</a>
					<div class="da-img"><img src="slider/images/3.png" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<h2> One lolypoint is 0.16$</h2>
					<p>Once you registered in lolyhub start redeeming vouchers and get extra money in Lolypoints </p>
					<a href="#" class="da-link">Read more</a>
					<div class="da-img"><img src="slider/images/4.png" alt="image01" /></div>
				</div>
				<nav class="da-arrows">
					<span class="da-arrows-prev"></span>
					<span class="da-arrows-next"></span>
				</nav>
			</div>

	</header>

<!--************************************** END OF HEADER SECTION ********************************-->

	<div id="featured-products" class="row">
		<div class="container">
			<div id="featured-one" class="col-xs-6 col-sm-3">
				<h4>Summer offers</h4>
	         	<p> Lolyhub can help you find great things for your Kids</p>
                <p> Get special offers with lolypoints</p>
				<h5 class="price">Starting at <strong>399 LP</strong></h5>
				<img src="images/accessories1.png">
	      	</div>

	      	<div id="featured-two" class="col-xs-6 col-sm-5">
	      		<div class="featured-one">
		      		<div>
			      		<h4>accessories</h4>
			         	<p> Earn more with lolypoints    </p>
                          
						<h5 class="price">Starting at <strong>150 LP</strong></h5>
					</div>
					<img src="images/watch.png">
				</div>
				<div class="featured-two">
		      		<div>
			      		<h4>Electronics</h4>
			         	<p>Start selecting the voucher you wish to redeem </p>
                       
						<h5 class="price">Starting at <strong>599 LP</strong></h5>
					</div>
					<img src="images/tablet.png">
				</div>
			</div>

      
	      	<div id="featured-three" class="col-xs-6 col-sm-3">
	         	<h4>Travel with Lolyhub</h4>
	         	<p>Convert your miles into lolypoints </p>
                  <p> And get more than a ticket </p>
				<h5 class="price">Starting at <strong>1999 LP</strong></h5>
				<img src="images/tour.png">
	      	</div>
		</div>
	</div>

<!--************************************** END OF FOUR SECTION ********************************-->

	
	<div class="row">

		<div class="products">
			<div class="container">
				<h4 class="section-title text-center">Featured Products</h4>
				<ul id="filter" class="list-group">
					<li><a href="#">Maecenas</a></li>
					<li><a href="#">Maecenas</a></li>
					<li><a href="#">Maecenas</a></li>
				</ul>

				<ul class="products-list list-group">
				   
				   <li class="list-group-item col-xs-6 col-sm-2">
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

				   <li class="list-group-item col-xs-6 col-sm-2">
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

				   <li class="list-group-item col-xs-6 col-sm-2">
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

				   <li class="list-group-item col-xs-6 col-sm-2">
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

				   <li class="list-group-item col-xs-6 col-sm-2">
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

				   <li class="list-group-item col-xs-6 col-sm-2">
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

				   <li class="list-group-item col-xs-6 col-sm-2">
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

				   <li class="list-group-item col-xs-6 col-sm-2">
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

				</ul>
			</div>
		</div>
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
   <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script type="text/javascript" src="slider/js/jquery.cslider.js"></script>
		<script type="text/javascript">
			$(function() {
			
				$('#da-slider').cslider();
				
			});
		</script>

    </form>
</body>
</html>
