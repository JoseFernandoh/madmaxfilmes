<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

    <!DOCTYPE html>
    <!--[if IE 7]><html class="ie ie7 no-js" lang="en-US"><![endif]-->
    <!--[if IE 8]><html class="ie ie8 no-js" lang="en-US"><![endif]-->
    <!--[if !(IE 7) | !(IE 8)  ]><!-->
    <html lang="en" class="no-js">


	<jsp:include page="painel.jsp"></jsp:include>
	
	
    <div class="col-md-9 col-sm-12 col-xs-12">
                        <div class="form-style-1 user-pro">
                            <form action="<%= request.getContextPath() %>/ServletUserController" class="user" id="formUser" method="post">
                                <h4>Aletrar Senha Usuario: ${usuario}</h4>
                                <p>${msg}</p>
                                <input type="hidden" name="acao" id="acao" value="atualizarSenhaUser">
                                <input type="hidden" name="user" id="user" value="${usuario}">
                                <div class="row">
                                    <div class="col-md-6 form-it">
                                    	<label>Senha Atual: </label>
                                    	<input name="SenhaAtual" id="SenhaAtual" type="text" required>
                                   </div>
                                   <div class="col-md-6 form-it">
                                    	<label>Nova Senha: </label>
                                    	<input name="novaSenha" id="novaSenha" type="text" required>
                                   </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"><input class="submit" type="submit" value="Alterar"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="js.jsp"></jsp:include>
        
        <script>
        	$("#altUser").addClass('active') 
        	
        </script>
    </body>

    </html>