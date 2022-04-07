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
                               <h4>Deletar Filme</h4>
                               <div class="row">
                                	<div class="col-xs-12 .col-md-8">
	                               		<div class="top-search">
											<input onkeyup="presionar(0)" id="nomeBusca" type="text"
											placeholder="Pesquisar Por Nome" aria-label="Recipient's username"
											aria-describedby="basic-addon2">
										</div>
									</div>
								</div>
							<div style="padding-top: 5%;" id="tratarFilmeAjax">
								<div id="divdadosFilme">
									
								</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="<%= request.getContextPath() %>/js/jquery.js"></script>
        <script src="<%= request.getContextPath() %>/js/plugins.js"></script>
        <script src="<%= request.getContextPath() %>/js/plugins2.js"></script>
        <script src="<%= request.getContextPath() %>/js/custom.js"></script>
       	<script src="<%= request.getContextPath() %>/js/select2.min.js"></script>
        
        <script>
    	    
        	var tempo;
	   		var url = '<%= request.getContextPath() %>';
        
        	$("#multselect").select2();
        	$("#delfilme").addClass('active')
        	
        	function buscarUsuario(offset) {
    			  
   				var urlAction = url+"/ServletPesquisa";
   		 		var nomeBusca = document.getElementById('nomeBusca').value;
   		 		var tipo = "Filme";
   		 		var items = 5;
   		 		
   		 		if(nomeBusca != null & nomeBusca != '' & nomeBusca.trim() != ''){
   		 			$.ajax({
   		 				method: "post",
   		 				url: urlAction,
   		 				data: "nomeBusca=" + nomeBusca + "&tipo=" + tipo + "&items=" + items + "&offset="+ offset +"&acao=buscarFilme",
   		 				success: function(response, textStatus, xhr) {
   		 					
   		 					var json = JSON.parse(response);
   		 					
   		 					$('#divdadosFilme').remove();
   		 					$('#topdarfilter').remove();
   		 					$("#tratarFilmeAjax").append('<div id="divdadosFilme"></div>');
   		 					
   		 					for(var p = 0; p < json.length; p++){
   		 						
   		   						$('#divdadosFilme').append('<div class="row">'+
   										'<div class="col-xs-8 col-sm-6">'+
   										'<div class="movie-item-style-2">'+
   					                    	'<img style=" width: 80px;height: 120px;" src="'+url+'/'+json[p].foto+'" alt="">'+
   					                        '<div class="mv-item-infor">'+
   					                            '<h6><a>'+json[p].nome+'<span>('+json[p].ano+')</span></a></h6>'+
   					                            '<p class="rate"><i class="ion-android-star"></i><span>'+json[p].imdb+'</span>/10</p>'+
   					                        '</div>'+
   						                 '</div>'+
   									'</div>'+
   					                 '<div style="padding-top: 8%;" class="col-md-3 col-md-offset-2">'+
   					                  	'<input onclick="deletarFilme('+json[p].id+')" type="button" class="submit" value="Apagar">'+
   					                 '</div>'+
   					    		'</div>');
   		   					}
   		 					
   		 					var totalFilme = xhr.getResponseHeader("totalFilme");
   		 					
   		 					if(totalFilme > 0){
	   		 					$('#tratarFilmeAjax').append('<div id="topdarfilter" class="topbar-filter">'+
				                    	'<label id="totalFilmes"></label>'+
					                    '<div class="pagination2">'+
	                        				'<span>Page 1 of 2:</span>'+
	                        				'<a class="active" href="#">1</a>'+
	                        				'<a href="#">2</a>'+
	                        				'<a onclick="#">'+
	                        					'<i class="ion-arrow-right-b"></i>'+
	                        				'</a>'+
	                        			'</div>'+
				                    '</div>');
	   		 					
	
	   		 					document.getElementById("totalFilmes").textContent = "Quantidade de Filmes: " + totalFilme;
   		 					}
   		 					
   						}
   		 				
   		 			}).fail(function(xhr, status, errorThrown) {
   						alert("Erro ao Buscar Filme por Nome"+ xhr.responseText);
   					});
   		 		}
   			}
        	
        	function deletarFilme(id) {
        		var urlAction = url+"/ServletFilmeController";
        		
        		if(confirm("deseja realmente deletar o Filme?")){
			 		$.ajax({
			 			method: "post",
			 			url: urlAction,
			 			data: "id=" + id +"&acao=deletarfilmeid",
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