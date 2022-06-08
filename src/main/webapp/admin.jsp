<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE html>
    <html lang="en" class="no-js">
	
	<jsp:include page="principal/head.jsp"></jsp:include>

	<style type="text/css">
	
		.tela{	
		 	background-color: white;
			width: 400px;
			padding: 70px 80px 70px 80px;
		}
		.msg{
			font-size: 15px;
			text-align: center;
			margin-top: 20px;
			padding-top: 10px;
			padding-bottom: 10px;
			color: #664d03;
    		background-color: #fff3cd;
    		border-color: #ffecb5;
    		border-radius: 5px;
		}
		
	</style>

        <div class="slider sliderv2">
            <div class="container">
                <div class="row">
                    <div class="slider-single-item">
                    </div>
                </div>
            </div>
        </div>
    	<div class="movie-items  full-width">
			<div class="row">
				<div class="col-md-9 col-sm-4 col-xs-6">
                        <div class="form-style-1 user-pro">
                            <form action="<%= request.getContextPath() %>/ServletUserController" class="user" id="formUser" method="post">
                                <h4>Entrar</h4>
                                <p>${msg}</p>
                                <input type="hidden" name="acao" id="acao" value="atualizarSenhaUser">
                                <div class="row">
                                    <div class="col-md-4 form-it">
                                    	<label>Usuario: </label>
                                    	<input name="SenhaAtual" id="SenhaAtual" type="text" required>
                                   </div>
								   <div class="col-md-4 form-it">
                                    	<label>Senha: </label>
                                    	<input name="novaSenha" id="novaSenha" type="text" required>
                                   </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"><input class="submit" type="submit" value="Entrar"></div>
                                </div>
                            </form>
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