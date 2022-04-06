<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE html>
    <html lang="en" class="no-js">
	
	<jsp:include page="principal/head.jsp"></jsp:include>

    <jsp:include page="principal/navbar.jsp"></jsp:include>
    
        <div class="slider sliderv2">
            <div class="container">
                <div class="row">
                    <div class="slider-single-item">
                    	<c:forEach items="${slide1}" var="sl1">
	                        <div class="movie-item">
	                            <div class="row">
	                                <div class="col-md-8 col-sm-12 col-xs-12">
	                                    <div class="title-in">
	                                        <div class="cate">
	                                        	<c:forEach items="${sl1.categorias}" var="cat">
		                                        	<span class="${cat.cor}"><a>${cat.nome}</a></span>
	                                        	</c:forEach>
	                                        </div>
	                                        <h1 style="padding-bottom: 20px;"><a href="#">${sl1.nome}
	                                                <span>${sl1.ano}</span></a></h1>
	                                        <div class="mv-details">
	                                            <p><i class="ion-android-star"></i><span>${sl1.imdb}</span>/10</p>
	                                        </div>
	                                        <div class="btn-transform transform-vertical">
	                                            <div><a href="<%= request.getContextPath() %>${sl1.linkPagina}" class="item item-1 redbtn">more detail</a></div>
	                                            <div><a href="<%= request.getContextPath() %>${sl1.linkPagina}" class="item item-2 redbtn hvrbtn">more detail</a></div>
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
                        <h2>Lançamentos</h2>
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
	                                                <div class="hvr-inner"><a href="<%= request.getContextPath() %>${sl2.linkPagina}">Read more <i
	                                                            class="ion-android-arrow-dropright"></i></a></div>
	                                                <div class="title-in">
	                                                    <h6><a href="<%= request.getContextPath() %>${sl2.linkPagina}">${sl2.nome}</a></h6>
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
                        <h2>Melhore Notas</h2>
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
	                                                <div class="hvr-inner"><a href="<%= request.getContextPath() %>${sl3.linkPagina}">Read more <i
	                                                            class="ion-android-arrow-dropright"></i></a></div>
	                                                <div class="title-in">
	                                                    <h6><a href="<%= request.getContextPath() %>${sl3.linkPagina}">${sl3.nome}</a></h6>
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
        
        <jsp:include page="principal/footer.jsp"></jsp:include>
        
        </body>
        
    </html>