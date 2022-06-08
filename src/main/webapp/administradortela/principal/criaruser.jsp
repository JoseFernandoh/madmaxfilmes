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
                                <h4>Criar Administrador</h4>
                                <input type="hidden" name="acao" id="acao" value="cadastrarAdmin">
                                <div class="row">
                                    <div class="col-md-6 form-it">
                                    	<label>Usuário: </label>
                                    	<input name="login" id="login" type="text" required>
                                   </div>
                                   <div class="col-md-6 form-it">
                                    	<label>Senha: </label>
                                    	<input name="senha" id="senha" type="text" required>
                                   </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"><input class="submit" type="submit" value="Salvar"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-style-1 user-pro">
                        	<h4>Apagar Adminstrador</h4>
                        	<div class="row">
                               	<div class="col-xs-12 .col-md-8">
	                           		<div class="top-search">
										<input onkeyup="presionar(0)" id="nomeBusca" type="text"
										placeholder="Pesquisar Por Nome" aria-label="Recipient's username"
										aria-describedby="basic-addon2">
									</div>
								</div>
							</div>
							<div id="tratarLoginAjax">
								<div id="divisorLogin">
   					    		</div>
							</div>
                       	</div>
                	</div>
                </div>
            </div>
        </div>
        
        <jsp:include page="js.jsp"></jsp:include>
        
        <script>
        
        	var tempo;
   			var url = '<%= request.getContextPath() %>';

        	$("#multselect").select2();
        	$("#criaradmin").addClass('active') 
   			
   			function buscarUsuario(offset) {
  			  
   				var urlAction = url+"/ServletUserController";
   		 		var nomeBusca = document.getElementById('nomeBusca').value;
   		 		
   		 		if(nomeBusca != null & nomeBusca != '' & nomeBusca.trim() != ''){
   		 			$.ajax({
   		 				method: "post",
   		 				url: urlAction,
   		 				data: "nomeBusca=" + nomeBusca + "&offset="+ offset +"&acao=buscarlogin",
   		 				success: function(response, textStatus, xhr) {
   		 					
   		 					var json = JSON.parse(response);
   		 					
   		 					$('#divisorLogin').remove();
   		 					$('#topdarfilter').remove();
   		 					$("#tratarLoginAjax").append('<div id="divisorLogin"></div>');
   		 					
   		 					for(var p = 0; p < json.length; p++){
   		 						
   		   						$('#divisorLogin').append('<div style="margin-top: 8%" class="row">'+
										'<div class="col-xs-6">'+
										'<div class="movie-item-style-1">'+
					                        '<div style="padding-top: 8%;" class="mv-item-infor">'+
					                            '<h6><a style="color :white">'+json[p].login+'</a></h6>'+
					                        '</div>'+
						                 '</div>'+
									'</div>'+
									'<div class="col-xs-6">'+
										'<div class="movie-item-style-2">'+
		   					                 '<input style="padding: 5px, 5px, 5px, 5px" onclick="deletaruser('+json[p].id+')" type="button" class="submit" value="Apagar">'+
						                 '</div>'+
									'</div>'+
								'</div>');
   		   					}
   		 					
   		 					var totalLogin = xhr.getResponseHeader("totaluser");
   		 					
   		 					if(totalLogin > 0){
	   		 					$('#tratarLoginAjax').append('<div id="topdarfilter" class="topbar-filter">'+
				                    	'<label id="totalLogins"></label>'+
					                    '<div class="pagination2">'+
	                        				'<span>Pagina 1 de 1:</span>'+
	                        				'<a class="active" href="#">1</a>'+
	                        				'<a onclick="#">'+
	                        					'<i class="ion-arrow-right-b"></i>'+
	                        				'</a>'+
	                        			'</div>'+
				                    '</div>');
	   		 					
	
	   		 					document.getElementById("totalLogins").textContent = "Quanti. " + totalLogin;
   		 						
   		 					}
   		 					
   						}
   		 				
   		 			}).fail(function(xhr, status, errorThrown) {
   						alert("Erro ao Buscar Filme por Nome"+ xhr.responseText);
   					});
   		 		}
   			}
        	
        	function deletaruser(id) {
        		var urlAction = url+"/ServletUserController";
        		
        		if(confirm("deseja realmente deletar o User?")){
			 		$.ajax({
			 			method: "post",
			 			url: urlAction,
			 			data: "id=" + id +"&acao=deletaruserid",
			 			success: function(response) {
			 					
			 				buscarUsuario(0);
			 	       		
						}
			 				
			 		}).fail(function(xhr, status, errorThrown) {
							alert("Erro ao Deletar o filme"+ xhr.responseText);
					});
        		}
		 		
			}
   			
   			function presionar(offset){
		  		
		  		clearInterval(tempo); 
		  		
		        tempo = window.setTimeout(function(){
		        	buscarUsuario(offset);     	
		        }, 500);  
			}
   		
        	
        </script>
    </body>

    </html>