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
                            <form action="<%= request.getContextPath() %>/ServletFilmeController" enctype="multipart/form-data" class="user" id="formUser" method="post">
                                <h4>Cadastrar Novo Filme</h4>
                                <input type="hidden" name="acao" id="acao" value="cadastrarfilme">
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
                                    	<label>Audio: </label>
                                    	<input name="audio" id="audio" type="text" required>
                                   </div>
                                   <div class="col-md-6 form-it">
                                    	<label>Url Video: </label>
                                    	<input name="urlvideo" id="urlvideo" type="text" required>
                                   </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-it">
                                		<label>Genero: </label>
                                    	<select id="multselect" name="multselect" multiple>
	                                    	<c:forEach items="${categorias}" var="cat">
	                                    		<option value="${cat}">${cat.nome}</option>
	                                    	</c:forEach>
                                    	</select>
                                   </div>
                                   <div class="col-md-6 form-it">
                                    	<label>Sinopse: </label>
                                    	<input name="sinopse" id="sinopse" type="text" required>
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
        
        
        <jsp:include page="js.jsp"></jsp:include>
        
        <script>
        	$("#multselect").select2(); 
        	$("#cadfilme").addClass('active')
        </script>
    </body>

    </html>