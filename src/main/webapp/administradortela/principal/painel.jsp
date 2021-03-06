<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    
    <jsp:include page="../../principal/head.jsp"></jsp:include>

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
                                        alt=""><br></a><a class="redbtn">${usuario}</a></div>
                            <!--
                             <div class="user-fav">
                                <p>Inicio</p>
                                <ul>
                                    <li id="dadosgerais"><a href="<%= request.getContextPath() %>/administradortela/principal/paineladmin.jsp">Dados Gerais</a></li>
                                    <c:if test="${admin}">
                                    	<li id="criaradmin"><a href="<%= request.getContextPath() %>/administradortela/principal/criaruser.jsp">Criar Administrador</a></li>
                                    </c:if>
                                </ul>	
                            </div>
                            -->
                            <c:if test="${admin}">
                            <div class="user-fav">
                                <p>Config Usuario</p>
                                <ul>
                                    	<li id="criaradmin"><a href="<%= request.getContextPath() %>/administradortela/principal/criaruser.jsp">Criar Administrador</a></li>
                                </ul>	
                            </div>
                            </c:if>
                            <div class="user-fav">
                                <p>Config. Filmes</p>
                                <ul>
                                    <li id="cadfilme"><a href="<%= request.getContextPath() %>/ServletFilmeController?acao=cadfilme">Cadadastrar Filme</a></li>
                                    <li id="atufilme"><a href="<%= request.getContextPath() %>/ServletFilmeController?acao=atufilme">Atualizar Filme</a></li>
                                    <li id="delfilme"><a href="<%= request.getContextPath() %>/administradortela/principal/delfilme.jsp">Apagar Filme</a></li>
                                </ul>
                            </div>
                            <div class="user-fav">
                                <p>Config. Serie</p>
                                <ul>
                                    <li id="cadserie"><a href="<%= request.getContextPath() %>/ServletSerieController?acao=cadserie">Cadastrar Serie</a></li>
                                    <li id="atuserie"><a href="<%= request.getContextPath() %>/ServletSerieController?acao=atuserie">Atualizar Serie</a></li>
                                    <li id="delserie"><a href="<%= request.getContextPath() %>/administradortela/principal/delserie.jsp">Apagar Serie</a></li>
                                </ul>
                            </div>
                            <div class="user-fav">
                                <p>Config. Conta</p>
                                <ul>
                                    <li id="altUser"><a href="<%= request.getContextPath() %>/administradortela/principal/altSenhaAdmin.jsp">Mudar Senha</a></li>
                                    <li><a href="<%= request.getContextPath() %>/ServletLogin?acao=logout">Log out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>