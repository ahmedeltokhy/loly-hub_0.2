<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default1.aspx.cs" Inherits="loly_hub_0._2.Default1" %>

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
    <link rel="stylesheet" type="text/css" href="css/slick.css" />

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
  <body id="home">
<!--****************** Header *****************-->
  	<header>
<!--****************** NavBar *****************-->
	   	<nav class="navbar navbar-default" role="navigation">
<!--****************** Nav Container *****************-->
			   <div runat="server" id="sign" class="container">
			      <ul class="nav navbar-nav navbar-right">
			         <li class="active"><a href="#"><i class="fa fa-user-plus" aria-hidden="true"></i>Signup</a></li>
			         <li><a href="#"><i class="fa fa-key" aria-hidden="true"></i> login</a></li>
			      </ul>
			   </div>

		</nav>
<!--****************** Page Header *****************-->
		   	<div class="page-header">
			   	<div class="container">
			   		<nav class="navbar" role="navigation">

<!--****************** Navbar *****************-->
				   <div id="logo" class="navbar-header">
				      <a class="navbar-brand" href="/" title="LolyHub">LolyHub</a>
				   </div>

				   <div class="menu">

				      <!--Left Align-->
				      <ul id="category" class="nav navbar-nav navbar-left">
				         <li class="dropdown">
				            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
				               Shop By <b>Category</b>
				               <i class="fa fa-chevron-down" aria-hidden="true"></i>
				            </a>

                    <ul runat="server" id="categoryItems" class="dropdown-menu">
				               <%--<li><a href="#">Category 1</a></li>
				               <li><a href="#">Category 2</a></li>
				               <li><a href="#">Category 3</a></li>
				               <li><a href="#">Category 3</a></li>
				               <li><a href="#">Category 3</a></li>
				               <li><a href="#">Category 3</a></li>
				               <li><a href="#">Category 3</a></li>
				               <li><a href="#">Category 3</a></li>

				               <li class="divider"></li>
				               <li><a href="#">Category 4</a></li>
				               <li><a href="#">Category 4</a></li>
				               <li><a href="#">Category 4</a></li>
				               <li><a href="#">Category 4</a></li>

				               <li class="divider"></li>
				               <li><a href="#">Category 5</a></li>
				               <li><a href="#">Category 5</a></li>
				               <li><a href="#">Category 5</a></li>
				               <li><a href="#">Category 5</a></li>--%>
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

                       <div runat="server" id="menuRight">

                           
						    <ul id="menu_right" runat="server" class="nav navbar-nav navbar-right">
								<li id="wishListItem" runat="server"><a href="#"><span class="noticon"><small id="wishListCount" runat="server"></small></span> Wish List</a></li>
								<li id="cartItem" runat="server" class="cart" ><a href="#"><span class="noticon"><small id="cartCount" runat="server"></small></span>Cart</a></li>
                <li id="signup_menu" runat="server" class="show-is-fixed"><a href="#"><i class="fa fa-user-plus" ></i>Signup</a></li>
 			         <li id="login_menu" runat="server" class="show-is-fixed"><a href="#"><i class="fa fa-key" ></i> login</a></li>
							</ul>

                       </div>


					</div><!--****************** End of Menu *****************-->

					</nav> <!--****************** end of NavBar *****************-->
			   	</div> <!--****************** end of Container *****************-->
		   	</div> <!--****************** end of Page Header *****************-->



			<div id="da-slider" class="da-slider">
				<div class="da-slide">
					<div class="overlay">
					  <div class="overlay-body">
					    <h2>Join</br>the Lolyhub</h2>
					    <p>It’s free! Earn 100 points <br />just for joining!</p>
					    <a href="#" class="da-link">Join Now</a>
					  </div><!-- End .overlay-body -->
					</div><!-- End .overlay -->
					<div class="da-img"><img src="images/slider-1.jpg" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<div class="overlay">
					  <div class="overlay-body">
					    <h2>Easy management</h2>
					    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
					    <a href="#" class="da-link">Read more</a>
					  </div><!-- End .overlay-body -->
					</div><!-- End .overlay -->
					<div class="da-img"><img src="images/slider-1.jpg"  /></div>
				</div>
				<div class="da-slide">
				<div class="overlay">
				    <div class="overlay-body">
				      <h2>Revolution</h2>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                <a href="#" class="da-link">Read more</a>
				    </div><!-- End .overlay-body -->
				</div><!-- End .overlay -->
					<div class="da-img"><img src="images/slider-1.jpg"  /></div>
				</div>
				<div class="da-slide">
					<div class="overlay">
					  <div class="overlay-body">
					    <h2>Quality Control</h2>
					    <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
					    <a href="#" class="da-link">Read more</a>
					  </div><!-- End .overlay-body -->
					</div><!-- End .overlay -->
					<div class="da-img"><img src="images/slider-1.jpg"  /></div>
				</div>

			</div>

	</header>
  <div class="feature-title">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <h4 class="">Featured Products</h4>
        </div><!-- End .col-sm-12 -->
      </div><!-- End .row -->
    </div><!-- End .container -->
  </div><!-- End .featuretitle -->
	<div class="row">

		<div class="products">
			<div class="container">

				<ul class="products-list list-group">

            <li class="list-group-item col-xs-6 col-md-4 col-lg-3">
              <div class="product-container">
                <div class="icon"></div><!-- End .icon -->

                <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
                <div class="image-block">
                <img src="images/product1.jpg">
                <button type="button" class="btn btn-default details">More Details</button>
                </div>
                <p class="product-summary">
                is simply dummy text of the printing and typesetting industry.
                </p>
                <span class="price">Redeem For <b>10 LP</b></span>
                <div class="btn-group-vertical">
                <p><i class="fa fa-plus"></i> Earning <strong>2 LP</strong></p>
                </div>
                <hr>
                <div class="market-now">
                <a class="market" href="#" ><i class="fa fa-shopping-cart" ></i></a>
                <div class="m-price">Market Price <b>5 SAR</b></div><!-- End .m-price -->

                </div><!-- End .market-now -->
              </div>
            </li>

                    
            <li class="list-group-item col-xs-6 col-md-4 col-lg-3">
              <div class="product-container">
                <div class="icon"></div><!-- End .icon -->

                <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
                <div class="image-block">
                <img src="images/product1.jpg">
                <button type="button" class="btn btn-default details">More Details</button>
                </div>
                <p class="product-summary">
                is simply dummy text of the printing and typesetting industry.
                </p>
                <span class="price">Redeem For <b>10 LP</b></span>
                <div class="btn-group-vertical">
                <p><i class="fa fa-plus"></i> Earning <strong>2 LP</strong></p>
                </div>
                <hr>
                <div class="market-now">
                <a class="market" href="#" ><i class="fa fa-shopping-cart" ></i></a>
                <div class="m-price">Market Price <b>5 SAR</b></div><!-- End .m-price -->

                </div><!-- End .market-now -->
              </div>
            </li>
            <li class="list-group-item col-xs-6 col-md-4 col-lg-3">
              <div class="product-container">
                <div class="icon"></div><!-- End .icon -->

                <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
                <div class="image-block">
                <img src="images/product1.jpg">
                <button type="button" class="btn btn-default details">More Details</button>
                </div>
                <p class="product-summary">
                is simply dummy text of the printing and typesetting industry.
                </p>
                <span class="price">Redeem For <b>10 LP</b></span>
                <div class="btn-group-vertical">
                <p><i class="fa fa-plus"></i> Earning <strong>2 LP</strong></p>
                </div>
                <hr>
                <div class="market-now">
                <a class="market" href="#" ><i class="fa fa-shopping-cart" ></i></a>
                <div class="m-price">Market Price <b>5 SAR</b></div><!-- End .m-price -->

                </div><!-- End .market-now -->
              </div>
            </li>
            <li class="list-group-item col-xs-6 col-md-4 col-lg-3">
              <div class="product-container">
                <div class="icon"></div><!-- End .icon -->

                <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
                <div class="image-block">
                <img src="images/product1.jpg">
                <button type="button" class="btn btn-default details">More Details</button>
                </div>
                <p class="product-summary">
                is simply dummy text of the printing and typesetting industry.
                </p>
                <span class="price">Redeem For <b>10 LP</b></span>
                <div class="btn-group-vertical">
                <p><i class="fa fa-plus"></i> Earning <strong>2 LP</strong></p>
                </div>
                <hr>
                <div class="market-now">
                <a class="market" href="#" ><i class="fa fa-shopping-cart" ></i></a>
                <div class="m-price">Market Price <b>5 SAR</b></div><!-- End .m-price -->

                </div><!-- End .market-now -->
              </div>
            </li>
            <div class="clearfix"></div>
            <hr>
                    <li class="big-item list-group-item col-xs-6 col-md-6">
                        <div class="product-container">
                            <div class="icon"></div><!-- End .icon -->
                            <div class="image-block">
                                <img src="images/product1.jpg">
                                <button type="button" class="btn btn-default details">More Details</button>
                            </div>
                            <div class="right-text">
                                <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
                                <p class="product-summary">
                                    is simply dummy text of the printing and typesetting industry.
                                </p>
                                <span class="price">Redeem For <b>10 LP</b></span>
                                <div class="btn-group-vertical">
                                    <p><i class="fa fa-plus"></i> Earning <strong>2 LP</strong></p>
                                </div>
                                <hr>
                                <div class="market-now">
                                    <a class="market" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <div class="m-price">Market Price <b>5 SAR</b></div><!-- End .m-price -->

                                </div><!-- End .market-now -->
                            </div><!-- End .right-text -->
                        </div>
                    </li>
            <li class="big-item list-group-item col-xs-6 col-md-6">
              <div class="product-container">
              <div class="icon"></div><!-- End .icon -->
              <div class="image-block">
              <img src="images/product1.jpg">
              <button type="button" class="btn btn-default details">More Details</button>
              </div>
              <div class="right-text">
              <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
              <p class="product-summary">
              is simply dummy text of the printing and typesetting industry.
              </p>
              <span class="price">Redeem For <b>10 LP</b></span>
              <div class="btn-group-vertical">
              <p><i class="fa fa-plus"></i> Earning <strong>2 LP</strong></p>
              </div>
              <hr>
              <div class="market-now">
              <a class="market" href="#" ><i class="fa fa-shopping-cart" ></i></a>
              <div class="m-price">Market Price <b>5 SAR</b></div><!-- End .m-price -->

              </div><!-- End .market-now -->
              </div><!-- End .right-text -->
              </div>
            </li>
            <div class="clearfix"></div>
            <hr>
            <li class="big-item list-group-item col-xs-6 col-md-6">
              <div class="product-container">
              <div class="icon"></div><!-- End .icon -->
              <div class="image-block">
              <img src="images/product1.jpg">
              <button type="button" class="btn btn-default details">More Details</button>
              </div>
              <div class="right-text">
              <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
              <p class="product-summary">
              is simply dummy text of the printing and typesetting industry.
              </p>
              <span class="price">Redeem For <b>10 LP</b></span>
              <div class="btn-group-vertical">
              <p><i class="fa fa-plus"></i> Earning <strong>2 LP</strong></p>
              </div>
              <hr>
              <div class="market-now">
              <a class="market" href="#" ><i class="fa fa-shopping-cart" ></i></a>
              <div class="m-price">Market Price <b>5 SAR</b></div><!-- End .m-price -->

              </div><!-- End .market-now -->
              </div><!-- End .right-text -->
              </div>
            </li>
            <li class="big-item list-group-item col-xs-6 col-md-6">
              <div class="product-container">
              <div class="icon"></div><!-- End .icon -->
              <div class="image-block">
              <img src="images/product1.jpg">
              <button type="button" class="btn btn-default details">More Details</button>
              </div>
              <div class="right-text">
              <a href=""><h4 class="title">HP Laptop Transformer</h4></a>
              <p class="product-summary">
              is simply dummy text of the printing and typesetting industry.
              </p>
              <span class="price">Redeem For <b>10 LP</b></span>
              <div class="btn-group-vertical">
              <p><i class="fa fa-plus"></i> Earning <strong>2 LP</strong></p>
              </div>
              <hr>
              <div class="market-now">
              <a class="market" href="#" ><i class="fa fa-shopping-cart" ></i></a>
              <div class="m-price">Market Price <b>5 SAR</b></div><!-- End .m-price -->

              </div><!-- End .market-now -->
              </div><!-- End .right-text -->
              </div>
            </li>

				</ul>
			</div>
		</div>
<!--************************************** END OF PRODUCT SECTION ********************************-->
    <div class="deals-section">
      <div class="container">
        <div class="row">
          <div class="col-md-7 col-lg-6">
            <div class="text">
              <h4>microsoft</h4>
              <h3>surface laptop</h3>
              <p> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an tronic typesetting, remaining essentially unchanged.</p>
              <a href="#" class="btn btn-default details" >More Details</a>
            </div><!-- End .text -->
          </div><!-- End .col-md-7 col-lg-6 -->
          <div class="col-md-5 col-lg-6">
            <div class="tumb"><img src="images/deals-thumb.png" alt=""></div><!-- End .tumb -->
          </div><!-- End .col-md-5 col-lg-6 -->
        </div><!-- End .row -->
      </div><!-- End .container -->
    </div><!-- End .deals-section -->
    <div class="small-product-slider">
      <div class="item">
        <div class="thumb">
          <img src="images/best-product-2.png" alt="">
          <div class="overlay"><a href="#" class="btn btn-default details" >More Details</a></div><!-- End .overlay -->
        </div><!-- End .thumb -->
      </div><!-- End .item -->
      <div class="item">
        <div class="thumb">
          <img src="images/deals-thumb.png" alt="">
          <div class="overlay"><a href="#" class="btn btn-default details" >More Details</a></div><!-- End .overlay -->
        </div><!-- End .thumb -->
      </div><!-- End .item -->
      <div class="item">
        <div class="thumb">
          <img src="images/watch-2.png" alt="">
          <div class="overlay"><a href="#" class="btn btn-default details" >More Details</a></div><!-- End .overlay -->
        </div><!-- End .thumb -->
      </div><!-- End .item -->
      <div class="item">
        <div class="thumb">
          <img src="images/best-product-2.png" alt="">
          <div class="overlay"><a href="#" class="btn btn-default details" >More Details</a></div><!-- End .overlay -->
        </div><!-- End .thumb -->
      </div><!-- End .item -->
      <div class="item">
        <div class="thumb">
          <img src="images/watch-2.png" alt="">
          <div class="overlay"><a href="#" class="btn btn-default details" >More Details</a></div><!-- End .overlay -->
        </div><!-- End .thumb -->
      </div><!-- End .item -->
      <div class="item">
        <div class="thumb">
          <img src="images/best-product-2.png" alt="">
          <div class="overlay"><a href="#" class="btn btn-default details" >More Details</a></div><!-- End .overlay -->
        </div><!-- End .thumb -->
      </div><!-- End .item -->
      <div class="item">
        <div class="thumb">
          <img src="images/footer-block.png" alt="">
          <div class="overlay"><a href="#" class="btn btn-default details" >More Details</a></div><!-- End .overlay -->
        </div><!-- End .thumb -->
      </div><!-- End .item -->
      <div class="item">
        <div class="thumb">
          <img src="images/best-product-2.png" alt="">
          <div class="overlay"><a href="#" class="btn btn-default details" >More Details</a></div><!-- End .overlay -->
        </div><!-- End .thumb -->
      </div><!-- End .item -->
      <div class="item">
        <div class="thumb">
          <img src="images/footer-block.png" alt="">
          <div class="overlay"><a href="#" class="btn btn-default details" >More Details</a></div><!-- End .overlay -->
        </div><!-- End .thumb -->
      </div><!-- End .item -->
      <div class="item">
        <div class="thumb">
          <img src="images/sm-pro-2.jpg" alt="">
          <div class="overlay"><a href="#" class="btn btn-default details" >More Details</a></div><!-- End .overlay -->
        </div><!-- End .thumb -->
      </div><!-- End .item -->
    </div><!-- End .small-product-slider -->
    <div class="clearfix"></div>
    <div class="best-products">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="item">
              <img src="images/best-product.png" alt="">
              <div class="text">
                <h3>Simply <b>dummy text</b></h3>
                <h4>Today <span>60% Discount</span></h4>
                <a href="#" class="btn">More Details</a>
              </div><!-- End .text -->
            </div><!-- End .item -->
          </div><!-- End .col-md-6 -->
          <div class="col-md-6">
            <div class="item">
              <img src="images/best-product.png" alt="">
              <div class="text">
                <h3>Simply <b>dummy text</b></h3>
                <h4>Today <span>60% Discount</span></h4>
                <a href="#" class="btn">More Details</a>
              </div><!-- End .text -->
            </div><!-- End .item -->
          </div><!-- End .col-md-6 -->
          <div class="clearfix"></div>
            <div class="col-sm-12">
              <div class="big-item  ">
                <div class="col-md-6">
                  <div class="item">
                    <img src="images/best-product-2.png" alt="">
                    <div class="text">
                      <h3>New <b>Laptops</b></h3>
                      <h4>Start from<span>300 LP</span></h4>
                      <a href="#" class="btn">More Details</a>
                    </div><!-- End .text -->
                  </div><!-- End .item -->
                </div><!-- End .col-md-6 -->
                  <div class="col-md-6">
                    <div class="item">
                      <img src="images/best-product-2.png" alt="">
                      <div class="text">
                        <h3>New <b>Laptops</b></h3>
                        <h4>Start from<span>300 LP</span></h4>
                        <a href="#" class="btn">More Details</a>
                      </div><!-- End .text -->
                    </div><!-- End .item -->
                  </div><!-- End .col-md-6 -->
              </div><!-- End .big-item -->
            </div><!-- End .col-sm-12 -->
        </div><!-- End .row -->
      </div><!-- End .container -->
    </div><!-- End .best-products -->
    <div class="footer-product">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-lg-4">
            <div class="foot-block ">
              <h3><b>Lorem</b> Ipsum</h3>
              <p>is simply dummy text of the printing and typesetting industry.</p>
              <div class="thumb"><img src="images/footer-block.png" alt=""></div><!-- End .thumb -->
              <a href="#" class="btn">More Details</a>
            </div><!-- End .foot-block -->
          </div><!-- End .col-md-6 col-lg-4 -->
          <div class="col-md-6 col-lg-4">
            <div class="foot-block color-2">
              <h3><b>Lorem</b> Ipsum</h3>
              <p>is simply dummy text of the printing and typesetting industry.</p>
              <div class="thumb"><img src="images/footer-block-2.png" alt=""></div><!-- End .thumb -->
              <a href="#" class="btn">More Details</a>
            </div><!-- End .foot-block -->
          </div><!-- End .col-md-6 col-lg-4 -->
          <div class="col-md-6 col-lg-4">
            <div class="foot-block color-3">
              <img src="images/footer-block-3.png" alt="">
              <a href="#" class="btn">More Details</a>
            </div><!-- End .foot-block -->
          </div><!-- End .col-md-6 col-lg-4 -->
        </div><!-- End .row -->
      </div><!-- End .container -->
    </div><!-- End .footer-product -->
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
		   	    <div class="col-xs-12 col-sm-6">© 2016 <a href="#">LOLYHUB</a>. ALL RIGHTS RESERVED.</div>
		      	<div class="col-xs-12 col-sm-6 text-right"><img src="images/creditcards.png"></div>
		    </div>
		   </div>
	</footer>
<!--************************************** END OF FOOTER SECTION ********************************-->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/slick.min.js"></script>
      <script src="js/sticky-kit.min.js"></script>
      <script src="js/bootstrap-datetimepicker.min.js"></script>
      <script src="js/script.js"></script>


  </body>
</html>
