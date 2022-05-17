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
                    <h2>Lançamentos</h2><a href="#" class="viewall">View all <i class="ion-ios-arrow-right"></i></a>
                </div>
                <div class="tabs">
                    <ul class="tab-links">
                        <li class="active"><a href="#tab2-h2">#Todos</a></li>
                        <li><a href="#tab3-h2"> #Filmes</a></li>
                        <li><a href="#tab4-h2">#Sere</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab2-h2"  class="tab active">
                            <div class="row">
                                <div class="slick-multiItem2">
                                    <c:forEach items="${todoslide2}" var="aux">
	                                    <div class="slide-it">
	                                        <div class="movie-item">
	                                            <div class="mv-img"><img src="<%= request.getContextPath() %>/${aux.foto}" alt=""></div>
	                                            <div class="hvr-inner"><a href="<%= request.getContextPath() %>${aux.linkPagina}">Read more <i
	                                                        class="ion-android-arrow-dropright"></i></a></div>
	                                            <div class="title-in">
	                                                <h6><a href="#">${aux.nome}</a></h6>
	                                                <p><i class="ion-android-star"></i><span>${aux.imdb}</span>/10</p>
	                                            </div>
	                                        </div>
	                                    </div>
                                	</c:forEach>
                                </div>
                            </div>
                        </div>
                        <div id="tab3-h2" class="tab">
                            <div class="row">
                                <div class="slick-multiItem2">
                                    <c:forEach items="${filmeslide2}" var="aux">
	                                    <div class="slide-it">
	                                        <div class="movie-item">
	                                            <div class="mv-img"><img src="<%= request.getContextPath() %>/${aux.foto}" alt=""></div>
	                                            <div class="hvr-inner"><a href="<%= request.getContextPath() %>${aux.linkPagina}">Read more <i
	                                                        class="ion-android-arrow-dropright"></i></a></div>
	                                            <div class="title-in">
	                                                <h6><a href="#">${aux.nome}</a></h6>
	                                                <p><i class="ion-android-star"></i><span>${aux.imdb}</span>/10</p>
	                                            </div>
	                                        </div>
	                                    </div>
                                	</c:forEach>
                                </div>
                            </div>
                        </div>
                        <div id="tab4-h2" class="tab">
                            <div class="row">
                                <div class="slick-multiItem2">
                                    <c:forEach items="${serieslide2}" var="aux">
	                                    <div class="slide-it">
	                                        <div class="movie-item">
	                                            <div class="mv-img"><img src="<%= request.getContextPath() %>/${aux.foto}" alt=""></div>
	                                            <div class="hvr-inner"><a href="<%= request.getContextPath() %>${aux.linkPagina}">Read more <i
	                                                        class="ion-android-arrow-dropright"></i></a></div>
	                                            <div class="title-in">
	                                                <h6><a href="#">${aux.nome}</a></h6>
	                                                <p><i class="ion-android-star"></i><span>${aux.imdb}</span>/10</p>
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
                    <h2>Melhores Notas</h2><a href="#" class="viewall">View all <i class="ion-ios-arrow-right"></i></a>
                </div>
                <div class="tabs">
                    <ul class="tab-links-2">
                        <li class="active"><a href="#tab21-h2">#Todos</a></li>
                        <li><a href="#tab22-h2">#Filmes</a></li>
                        <li><a href="#tab23-h2"> #Series</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab21-h2" class="tab active">
                            <div class="row">
                                <div class="slick-multiItem2">
                                    <c:forEach items="${todoslide3}" var="aux">
	                                    <div class="slide-it">
	                                        <div class="movie-item">
	                                            <div class="mv-img"><img src="<%= request.getContextPath() %>/${aux.foto}" alt=""></div>
	                                            <div class="hvr-inner"><a href="<%= request.getContextPath() %>${aux.linkPagina}">Read more <i
	                                                        class="ion-android-arrow-dropright"></i></a></div>
	                                            <div class="title-in">
	                                                <h6><a href="#">${aux.nome}</a></h6>
	                                                <p><i class="ion-android-star"></i><span>${aux.imdb}</span>/10</p>
	                                            </div>
	                                        </div>
	                                    </div>
                                	</c:forEach>
                                </div>
                            </div>
                        </div>
                        <div id="tab22-h2" class="tab">
                            <div class="row">
                                <div class="slick-multiItem2">
                                	<c:forEach items="${filmeslide3}" var="aux">
	                                    <div class="slide-it">
	                                        <div class="movie-item">
	                                            <div class="mv-img"><img src="<%= request.getContextPath() %>/${aux.foto}" alt=""></div>
	                                            <div class="hvr-inner"><a href="<%= request.getContextPath() %>${aux.linkPagina}">Read more <i
	                                                        class="ion-android-arrow-dropright"></i></a></div>
	                                            <div class="title-in">
	                                                <h6><a href="#">${aux.nome}</a></h6>
	                                                <p><i class="ion-android-star"></i><span>${aux.imdb}</span>/10</p>
	                                            </div>
	                                        </div>
	                                    </div>
                                	</c:forEach>
                                </div>
                            </div>
                        </div>
                        <div id="tab23-h2" class="tab">
                            <div class="row">
                                <div class="slick-multiItem2">
                                	<c:forEach items="${serieslide3}" var="aux">
	                                    <div class="slide-it">
	                                        <div class="movie-item">
	                                            <div class="mv-img"><img src="<%= request.getContextPath() %>/${aux.foto}" alt=""></div>
	                                            <div class="hvr-inner"><a href="<%= request.getContextPath() %>${aux.linkPagina}">Read more <i
	                                                        class="ion-android-arrow-dropright"></i></a></div>
	                                            <div class="title-in">
	                                                <h6><a href="#">${aux.nome}</a></h6>
	                                                <p><i class="ion-android-star"></i><span>${aux.imdb}</span>/10</p>
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