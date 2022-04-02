<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <!--[if IE 7]><html class="ie ie7 no-js" lang="en-US"><![endif]-->
    <!--[if IE 8]><html class="ie ie8 no-js" lang="en-US"><![endif]-->
    <!--[if !(IE 7) | !(IE 8)  ]><!-->
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
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
    </head>

    <body>
        <!--preloading-->
        <div id="preloader"><img class="logo" src="<%= request.getContextPath() %>/images/logo1.png" alt="" width="119" height="58">
            <div id="status"><span></span><span></span></div>
        </div>
        <!--end of preloading-->
        <div class="hero user-herocustom">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div style="padding-top: 20px;" class="hero-ct">
                            <h1>Painel Administrativo</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="padding-top: 30px;" class="page-single">
            <div class="container">
                <div class="row ipad-width">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="user-information">
                            <div class="user-img"><a href="#"><img src="<%= request.getContextPath() %>/images/uploads/user-img.png"
                                        alt=""><br></a><a href="#" class="redbtn">Change avatar</a></div>
                            <div class="user-fav">
                                <p>Account Details</p>
                                <ul>
                                    <li class="active"><a href="userprofile.html">Profile</a></li>
                                    <li><a href="userfavoritelist.html">Favorite movies</a></li>
                                    <li><a href="userrate.html">Rated movies</a></li>
                                </ul>
                            </div>
                            <div class="user-fav">
                                <p>Others</p>
                                <ul>
                                    <li><a href="#">Change password</a></li>
                                    <li><a href="<%= request.getContextPath() %>/ServletLogin?acao=logout">Log out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-12 col-xs-12">
                        <div class="form-style-1 user-pro">
                            <form action="<%= request.getContextPath() %>/ServletFilmeController" enctype="multipart/form-data" class="user" id="formUser" method="post">
                                <h4>01. Profile details</h4>
                                <div class="row">
                                    <div class="col-md-6 form-it">
                                    	<label>Nome: </label>
                                    	<input name="nome" id="nome" type="text" required>
                                   </div>
                                   <div class="col-md-6 form-it">
                                    	<label>Ano: </label>
                                    	<input name="ano" id="ano" type="text" required>
                                   </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-it">
                                    	<label>IMDB: </label>
                                    	<input name="imdb" id="imdb" type="text" required>
                                   </div>
                                   <div class="col-md-6 form-it">
                                    	<label>Tempo: </label>
                                    	<input name="tempo" id="tempo" type="text" required>
                                   </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-it">
                                    	<label>Foto: </label>
         								<input name="filefoto" id="filefoto" type="file" accept="image/*" required>
                                   </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"><input class="submit" type="submit" value="save"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="<%= request.getContextPath() %>/js/jquery.js"></script>
        <script src="<%= request.getContextPath() %>/js/plugins.js"></script>
        <script src="<%= request.getContextPath() %>/js/plugins2.js"></script>
        <script src="<%= request.getContextPath() %>/js/custom.js"></script>
    </body>

    </html>