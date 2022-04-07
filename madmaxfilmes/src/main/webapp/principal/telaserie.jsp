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
                    	<img width="330px" height="505px" src="<%= request.getContextPath() %>/images/capas/Interstellar1h212020.jpg" alt="">
                    </div>	
                </div>
                <div style="background-color: #0b1a2a; border: 3px solid #0f2133; padding-top: 15px;"  class="col-md-8 col-sm-12 col-xs-12">
	                <div style="padding-bottom: 30px;">
                        <div class="row">
	                		<div class="col-md-8 col-sm-12 col-xs-12">
	                    		<div class="movie-single-ct main-content">
	                        		<h1 class="bd-hd">Interstellar<span>2020</span></h1>
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
	                        		<span style="font-weight: 400; font-size: 18px;">7.0
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
	                                        <span class="blue">
	                                            <a>Aventuda</a>
	                                        </span>
	                                        <span class="red">
	                                            <a>Ação</a>
	                                        </span>
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
                                    <h6 style="color: white">Portugues</h6>
                                </div>
                            </div>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <div class="row">
                                <div class="col-md-2	">
                                    <h6 style="color: white">Duração: </h6>
                                </div>
                                <div class="col-md-5">
                                    <h6 style="color: white">1h40</h6>
                                </div>
                            </div>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <div class="row">
                                <div class="col-md-2">
                                    <h6 style="color: white">Sinopse: </h6>
                                </div>
                                <div class="col-md-8">
                                    <p style="color: white">A expressão
									Lorem ipsum em design gráfico e editoração é um texto padrão em
									latim utilizado na produção gráfica para preencher os espaços
									de texto em publicações para testar e ajustar aspectos visuais
									antes de utilizar conteúdo rea</p>
                                </div>
                            </div>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <div class="row">
                                <div class="col-md-2">
                                    <h6 style="color: white">Temporada: </h6>
                                </div>
                                <div class="col-md-5">
                                    <select style="background-color: #0f2133; border: none; color: white;" id="selectTemporada">
                                    	<option value="1"> 1º Temporada </option>
                                    	<option value="2"> 2º Temporada </option>
                                    	<option value="3"> 3º Temporada </option>
                                    	<option value="4"> 4º Temporada </option>
                                    	<option value="5"> 5º Temporada </option>
                                    	<option value="6"> 6º Temporada </option>
                                    </select>
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
                <iframe width="100%" height="100%" src="https://www.youtube.com/embed/WbXy0-UlCAc"
                    title="YouTube video player" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen>
                </iframe>
            </div>
        </div>
        <div style="margin-top: 5%" class="container">
        	<div class="form-style-1 user-pro">
        		<div style="margin-bottom: 0px; border: none;" class="topbar-filter">
        			<div class="col-md-3">
                    	<input type="button" class="submit" data-toggle="modal" data-target="#pesquisafilme" value="Anterior">
                    </div>
                    <div class="col-md-5">
	                   	<select style="background-color: #0f2133; border: none; color: white; width: 100%; text-align: center;" id="selectTemporada">
                           	<option value="1"> 1º Episodio </option>
                           	<option value="2"> 2º Episodio </option>
                           	<option value="3"> 3º Episodio </option>
                           	<option value="4"> 4º Episodio </option>
                           	<option value="5"> 5º Episodio </option>
                           	<option value="6"> 6º Episodio </option>
                    	</select>
                    </div>
                    <div class="col-md-3">
                    	<input type="button" class="submit" data-toggle="modal" data-target="#pesquisafilme" value="Proximo">
                    </div>
        		</div>
        	</div>
     	</div>
    </div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	</body>

</html>