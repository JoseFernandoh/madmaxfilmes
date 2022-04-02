<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE html>
    <html lang="en" class="no-js">

    <head>
        <!-- Basic need -->
        <title>Open Pediatrics</title>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <link rel="profile" href="#">
        <!--Google Font-->
        <link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
        <!-- Mobile specific meta -->
        <meta name=viewport content="width=device-width, initial-scale=1">
        <meta name="format-detection" content="telephone-no"><!-- CSS files -->
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/plugins.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    </head>

    <body>
        <!--preloading-->
        <div id="preloader"><img class="logo" src="	images/logo1.png" alt="" width="119" height="58">
            <div id="status"><span></span><span></span></div>
        </div>
        <!--end of preloading-->
        <!-- BEGIN | Header -->
        <header class="ht-header full-width-hd">
            <div class="row">
                <nav id="mainNav" class="navbar navbar-default navbar-custom">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header logo">
                        <div class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <div id="nav-icon1"><span></span><span></span><span></span></div>
                        </div><a href="index.html"><img class="logo" src="images/logo1.png" alt="" width="119"
                                height="58"></a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse flex-parent" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav flex-child-menu menu-left">
                        </ul>
                        <ul class="nav navbar-nav flex-child-menu menu-right">
                            <li class="btn signupLink"><a href="#">Pesquisar</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </nav><!-- search form -->
            </div>
        </header><!-- END | Header -->
        <div class="slider sliderv2">
            <div class="container">
                <div class="row">
                    <div class="slider-single-item">
                    	<c:forEach items="${slide1}" var="sl1">
	                        <div class="movie-item">
	                            <div class="row">
	                                <div class="col-md-8 col-sm-12 col-xs-12">
	                                    <div class="title-in">
	                                        <div class="cate"><span class="blue"><a href="#">Sci-fi</a></span><span
	                                                class="yell"><a href="#">Action</a></span><span class="orange"><a
	                                                    href="#">advanture</a></span></div>
	                                        <h1 style="padding-bottom: 20px;"><a href="#">${sl1.nome}
	                                                <span>${sl1.ano}</span></a></h1>
	                                        <div class="mv-details">
	                                            <p><i class="ion-android-star"></i><span>${sl1.imdb}</span>/10</p>
	                                            <ul class="mv-infor">
	                                                <li> ${sl1.time}</li>
	                                            </ul>
	                                        </div>
	                                        <div class="btn-transform transform-vertical">
	                                            <div><a href="#" class="item item-1 redbtn">more detail</a></div>
	                                            <div><a href="#" class="item item-2 redbtn hvrbtn">more detail</a></div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-md-4 col-sm-12 col-xs-12">
	                                    <div class="mv-img-2"><a href="#"><img  width="261" height="401"  src="<%= request.getContextPath() %>/${sl1.foto}" alt=""></a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="movie-items  full-width">
            <div class="row">
                <div class="col-md-12">
                    <div class="title-hd">
                        <h2>in theater</h2><a href="#" class="viewall">View all <i class="ion-ios-arrow-right"></i></a>
                    </div>
                    <div class="tabs">
                        <ul class="tab-links">
                            <li class="active"><a href="#tab1-h2">#Popular</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab1-h2" class="tab active">
                                <div class="row">
                                    <div class="slick-multiItem2">
                                    	<c:forEach items="${slide2}" var="sl2">
	                                        <div class="slide-it">
	                                            <div class="movie-item">
	                                                <div class="mv-img"><img src="<%= request.getContextPath() %>/${sl2.foto}" alt=""></div>
	                                                <div class="hvr-inner"><a href="#">Read more <i
	                                                            class="ion-android-arrow-dropright"></i></a></div>
	                                                <div class="title-in">
	                                                    <h6><a href="#">${sl2.nome}</a></h6>
	                                                    <p><i class="ion-android-star"></i><span>${sl2.imdb}</span>/10</p>
	                                                </div>
	                                            </div>
	                                        </div>
                                     	</c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="title-hd">
                        <h2>on tv</h2><a href="#" class="viewall">View all <i class="ion-ios-arrow-right"></i></a>
                    </div>
                    <div class="tabs">
                        <ul class="tab-links">
                            <li class="active"><a href="#tab1-h2">#Popular</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab21-h2" class="tab active">
                                <div class="row">
                                    <div class="slick-multiItem2">
                                    	<c:forEach items="${slide3}" var="sl3">
	                                        <div class="slide-it">
	                                            <div class="movie-item">
	                                                <div class="mv-img"><img src="<%= request.getContextPath() %>/${sl3.foto}" alt=""></div>
	                                                <div class="hvr-inner"><a href="#">Read more <i
	                                                            class="ion-android-arrow-dropright"></i></a></div>
	                                                <div class="title-in">
	                                                    <h6><a href="#">${sl3.nome}</a></h6>
	                                                    <p><i class="ion-android-star"></i><span>${sl3.imdb}</span>/10</p>
	                                                </div>
	                                            </div>
	                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer v2 section-->
        <footer class="ht-footer full-width-ft">
            <div class="row">
                <div class="flex-parent-ft">
                    <div class="flex-child-ft item1"><a href="index.html"><img class="logo" src="images/logo1.png"
                                alt=""></a>
                        <p>5th Avenue st, manhattan<br> New York, NY 10001</p>
                        <p>Call us: <a href="#">(+01) 202 342 6789</a></p>
                    </div>
                    <div class="flex-child-ft item2">
                        <h4>Resources</h4>
                        <ul>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Blockbuster</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Forums</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Help Center</a></li>
                        </ul>
                    </div>
                    <div class="flex-child-ft item3">
                        <h4>Legal</h4>
                        <ul>
                            <li><a href="#">Terms of Use</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Security</a></li>
                        </ul>
                    </div>
                    <div class="flex-child-ft item4">
                        <h4>Account</h4>
                        <ul>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Watchlist</a></li>
                            <li><a href="#">Collections</a></li>
                            <li><a href="#">User Guide</a></li>
                        </ul>
                    </div>
                    <div class="flex-child-ft item5">
                        <h4>Newsletter</h4>
                        <p>Subscribe to our newsletter system now <br>to get latest news from us.</p>
                        <form action="#"><input type="text" placeholder="Enter your email"></form><a href="#"
                            class="btn">Subscribe now <i class="ion-ios-arrow-forward"></i></a>
                    </div>
                </div>
                <div class="ft-copyright">
                    <div class="ft-left">
                        <p>© 2017 Blockbuster. All Rights <a href="http://www.bootstrapmb.com/"
                                title="bootstrapmb">Reserved</a>. Designed by leehari.</p>
                    </div>
                    <div class="backtotop">
                        <p><a href="#" id="back-to-top">Back to top <i class="ion-ios-arrow-thin-up"></i></a></p>
                    </div>
                </div>
            </div>
        </footer>	<!-- end of footer v2 section-->
        <script src="<%= request.getContextPath() %>/js/jquery.js"></script>
        <script src="<%= request.getContextPath() %>/js/plugins.js"></script>
        <script src="<%= request.getContextPath() %>/js/plugins2.js"></script>
        <script src="<%= request.getContextPath() %>/js/custom.js"></script>
    </body>
    </html>