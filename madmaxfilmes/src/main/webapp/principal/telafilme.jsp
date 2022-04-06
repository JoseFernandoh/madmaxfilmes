<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 7]><html class="ie ie7 no-js" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 no-js" lang="en-US"><![endif]-->
<!--[if !(IE 7) | !(IE 8)  ]><!-->
<html lang="en" class="no-js">

	<jsp:include page="head.jsp"></jsp:include>

    <jsp:include page="navbar.jsp"></jsp:include>

    <div style="padding-top: 160px; padding-bottom: 0px" class="page-single">
        <div class="container">
            <div class="row ipad-width2">
                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="movie-img sticky-sb">
                    	<img width="330px" height="505px" src="<%= request.getContextPath() %>/${filme.foto}" alt="">
                    </div>	
                </div>
                <div style="background-color: #0b1a2a; border: 3px solid #0f2133; padding-top: 15px;"  class="col-md-8 col-sm-12 col-xs-12">
	                <div style="padding-bottom: 30px;">
                        <div class="row">
	                		<div class="col-md-8 col-sm-12 col-xs-12">
	                    		<div class="movie-single-ct main-content">
	                        		<h1 class="bd-hd">${filme.nome}<span>${filme.ano}</span></h1>
	                    		</div>
	                		</div>
	                	</div>
	                </div>
                    <div style="padding-bottom: 20px;">
                        <div class="row">
                            <div class="col-md-2">
                                <h6 style="color: white">IMDB: </h6>
                            </div>
                            <div class="col-md-5">
	                        	<p>
	                        		<i style="color: #f5b50a; font-size: 22px;" class="ion-android-star">
	                        		</i>
	                        		<span style="font-weight: 400; font-size: 18px;">${filme.imdb}
	                        		</span>/10
	                        	</p>
                            </div>
                        </div>
                    </div>
                    <div style="padding-bottom: 20px;">
                        <div class="row">
                            <div class="col-md-2">
                                <h6 style="color: white">Genero: </h6>
                            </div>
                            <div class="col-md-5">
                                <div class="title-in">
                                    <div class="cate">
                                        <c:forEach items="${filme.categorias}" var="cat">
	                                        <span class="${cat.cor}">
	                                            <a>${cat.nome}</a>
	                                        </span>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <div class="row">
                                <div class="col-md-2">
                                    <h6 style="color: white">Audio: </h6>
                                </div>
                                <div class="col-md-5">
                                    <h6 style="color: white">${filme.audio}</h6>
                                </div>
                            </div>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <div class="row">
                                <div class="col-md-2	">
                                    <h6 style="color: white">Duração: </h6>
                                </div>
                                <div class="col-md-5">
                                    <h6 style="color: white">${filme.time}</h6>
                                </div>
                            </div>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <div class="row">
                                <div class="col-md-2">
                                    <h6 style="color: white">Sinopse: </h6>
                                </div>
                                <div class="col-md-8">
                                    <p style="color: white">
                                    	${filme.sinopse}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-single">
        <div class="container">
            <div style=" height: 640px;">
                <iframe width="100%" height="100%" src="${filme.urlVideo}"
                    title="YouTube video player" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen>
                </iframe>
            </div>
        </div>
    </div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	</body>

</html>