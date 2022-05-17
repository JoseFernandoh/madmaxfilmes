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
                                <h4>Atualizar Filme</h4>
                                <input type="hidden" name="acao" id="acao" value="atualizarfilme">
                                <input type="hidden" name="id" id="id" value="" required>
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
         								<input name="filefoto" id="filefoto" type="file" accept="image/*">
                                   </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                    	<input class="submit" type="submit" value="save">
                                    </div>
                                    <div class="col-md-3">
                                    	<input type="button" class="submit" data-toggle="modal" data-target="#pesquisafilme" value="Pesquisar Filme">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

		<div id="pesquisafilme" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="form-style-1 user-pro">
					<div class="modal-header">
						<button id="close" type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">Pesquisa Filme</h4>
						<div class="top-search">
							<input onkeyup="presionar(0)" id="nomeBusca" type="text"
								placeholder="Nome" aria-label="Recipient's username"
								aria-describedby="basic-addon2">
						</div>
					</div>
					<div class="modal-body">
						<div id="tratarFilmeAjax">
	                    	<div id="divdadosFilme">
								
					    	</div>
						</div>
					</div>
					<div class="topbar-filter">
						<label id="totalFilmes">Quant. de Filmes: 0</label>
						<div class="pagination2">
                        	<span>Page 1 of 2:</span>
                        	<a class="active" href="#">1</a>
                        	<a href="">2</a>
                        	<a onclick="#">
                        		<i class="ion-arrow-right-b"></i>
                        	</a>
                        </div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<jsp:include page="js.jsp"></jsp:include>
        
        <script>
        
        	var tempo;
       		var url = '<%= request.getContextPath() %>';
        
       		$("#multselect").select2()
       		$("#atufilme").addClass('active')
        	
    		  function buscarUsuario(offset) {
    			  
    				var urlAction = url+"/ServletPesquisa";
    		 		var nomeBusca = document.getElementById('nomeBusca').value;
    		 		var tipo = "Filme";
    		 		var items = 5;
    		 		
    		 		if(nomeBusca != null & nomeBusca != '' & nomeBusca.trim() != ''){
    		 			$.ajax({
    		 				method: "post",
    		 				url: urlAction,
    		 				data: "nomeBusca=" + nomeBusca + "&tipo=" + tipo + "&items=" + items + "&offset="+ offset +"&acao=buscar",
    		 				success: function(response, textStatus, xhr) {
    		 					
    		 					var json = JSON.parse(response);
    		 					
    		 					var el = document.getElementById( 'divdadosFilme' ).remove();
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
    					                  	'<input onclick="editarfilme('+json[p].id+')" type="button" class="submit" value="Editar">'+
    					                 '</div>'+
    					    		'</div>');
    		   					}
    		 					
    		 					var totalFilme = xhr.getResponseHeader("totalFilme");

    		 					document.getElementById("totalFilmes").textContent = "Quant. de Filmes: " + totalFilme;
    						}
    		 				
    		 			}).fail(function(xhr, status, errorThrown) {
    						alert("Erro ao Buscar Usuario por Nome"+ xhr.responseText);
    					});
    		 		}
    			}
    		  
    		  	function editarfilme(id) {
    		  		
    		  		document.querySelector("#close").click();
    		  		
    		  		var urlAction = url+"/ServletFilmeController";
    		 		
    		 		$.ajax({
    		 			method: "post",
    		 			url: urlAction,
    		 			data: "id=" + id +"&acao=buscarfilmeid",
    		 			success: function(response) {
    		 					
    		 				var json = JSON.parse(response);
    		 					
    		 				$('#id').val(json.id)
    		 				$('#nome').val(json.nome) 
    		 				$('#ano').val(json.ano)  
    		 				$('#imdb').val(json.imdb)  
    		 				$('#tempo').val(json.time)
    		 				$('#audio').val(json.audio)  
    		 				$('#urlvideo').val(json.urlVideo)  
    		 				$('#sinopse').val(json.sinopse)
    		 				
    		 				$("#multselect").select2("destroy")
    		 	       		$("#multselect").val(json.categorias).select2()
    		 	       		
    					}
    		 				
    		 		}).fail(function(xhr, status, errorThrown) {
    						alert("Erro ao Buscar Usuario por Nome"+ xhr.responseText);
    				});
    		 		
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