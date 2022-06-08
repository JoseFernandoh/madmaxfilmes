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
                            <form action="<%= request.getContextPath() %>/ServletSerieController" enctype="multipart/form-data" class="user" id="formUser" method="post">
                                <h4>Atualizar Serie</h4>
                                <input type="hidden" name="acao" id="acao" value="atualizarserie">
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
                                    	<label>Tempo dos Episodios: </label>
                                    	<input name="tempo" id="tempo" type="text" required>
                                   </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-it">
                                    	<label>Audio: </label>
                                    	<input name="audio" id="audio" type="text" required>
                                   </div>
                                    <div class="col-md-6 form-it">
                                		<label>Genero: </label>
                                    	<select id="multselect" name="multselect" multiple>
	                                    	<c:forEach items="${categorias}" var="cat">
	                                    		<option value="${cat}">${cat.nome}</option>
	                                    	</c:forEach>
                                    	</select>
                                   </div>
                                </div>
                                <div class="row">
                                   <div class="col-md-6 form-it">
                                    	<label>Sinopse: </label>
                                    	<input name="sinopse" id="sinopse" type="text" required>
                                   </div>
                                    <div class="col-md-6 form-it">
                                    	<label>Foto: </label>
         								<input name="filefoto" id="filefoto" type="file" accept="image/*">
                                   </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"><input class="submit" type="submit" value="Salvar"></div>
	                                <div class="col-md-3">
	                                    <input type="button" class="submit" data-toggle="modal" data-target="#pesquisaSerie" value="Pesquisar Serie">
	                                </div>
                                </div>
                            </form>
                        </div>
                    </div>
					<div class="col-md-9 col-sm-12 col-xs-12">
						<div class="form-style-1 user-pro">
							<div class="row">
								<div class="col-xs-6 col-md-4 form-it">
                                  	<label id="quantTemporada" style="padding-top: 4%">Quantidade de Temporadas: 0</label>
                                </div>
                                <div class="col-xs-6 col-md-4 form-it">
                                  	<select onchange="pegarTemporda()" style="background-color: #0f2133; border: none; color: white;" id="selectTemporada">
                                    	<option value="0"> Selecionar Temporada </option>
                                    </select>
                                </div>
                                <div class="col-xs-6 col-md-4 form-it">
                                	<input type="button" class="submit" data-toggle="modal" data-target="#criarTemporada" value="Criar Temporada">
                                </div>
							</div>
							<div style="color: white;" class="row">
								<table id="tabelaEpisodio">
									<thead>
										<tr>
											<th>#</th>
											<th>Nome</th>
											<th style="text-align: center;">Editar</th>
											<th style="text-align: center; ">Apagar</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div id="buttaoDeleteTemporada" class="col-xs-6 col-md-4 form-it">
                                </div>
                                <div id="buttaoAdicionarEpisodio" class="col-xs-6 col-md-4 form-it">
                                </div>
							</div>
						</div>
					</div>
				</div>
            </div>
        </div>
        
        <div id="pesquisaSerie" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="form-style-1 user-pro">
					<div class="modal-header">
						<button id="close" type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">Pesquisa Serie</h4>
						<div class="top-search">
							<input onkeyup="presionar(0)" id="nomeBusca" type="text"
								placeholder="Nome" aria-label="Recipient's username"
								aria-describedby="basic-addon2">
						</div>
					</div>
					<div class="modal-body">
						<div id="tratarSerieAjax">
	                    	<div id="divdadosSerie">
								
					    	</div>
						</div>
					</div>
					<div class="topbar-filter">
						<label id="totalSerie">Quant. de Serie: 0</label>
						<div style="cursor:default" class="pagination2">
                        	<span id="quantPagina">Página 1 de 1:</span>
                        	<a class="active" href="#">1</a>
                        	<a onclick="proximoBut()">
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
		
		<div id="criarTemporada" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="form-style-1 user-pro">
					<div class="modal-header">
						<button id="close" type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">Criar Temporada</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
            				<label for="recipient-name" class="control-label">Nome:</label>
           					<input type="text" class="form-control" id="nomeTemporada">
          				</div>
					</div>
					<div class="modal-footer">
				        <button onclick="criarTemporada()" type="button" class="btn btn-default" data-dismiss="modal">Salve</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		
		<div id="adiconarEpisodio" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="form-style-1 user-pro">
					<div class="modal-header">
						<button id="close" type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">Adicionar Episodio</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
            				<label for="recipient-name" class="control-label">Nome:</label>
           					<input type="text" class="form-control" id="NomeEpisodio">
          				</div>
          				<div class="form-group">
            				<label for="recipient-name" class="control-label">UrlVideo:</label>
           					<input type="text" class="form-control" id="urlvideoEpisodios">
          				</div>
					</div>
					<div class="modal-footer">
				        <button onclick="adicionarEpisodio()" type="button" class="btn btn-default" data-dismiss="modal">Salvar</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		
		<div id="AtualizarEpisodio" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="form-style-1 user-pro">
					<div class="modal-header">
						<button id="close" type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">Adicionar Episodio</h4>
					</div>
					<div class="modal-body">
          				<div class="form-group">
            				<label for="recipient-name" class="control-label">Url Video:</label>
            				<input type="hidden" id="atuidEpisodio">
           					<input type="text" class="form-control" id="atualizarurlvideoEpisodios">
          				</div>
					</div>
					<div class="modal-footer">
				        <button onclick="atualizarEpisodio()" type="button" class="btn btn-default" data-dismiss="modal">Salvar</button>
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
   			var json;
   			var temporadas
        	
        	$("#multselect").select2(); 
			$("#atuserie").addClass('active')
        	
        	 function buscarSerie(offset) {
        		
    				var urlAction = url+"/ServletPesquisa";
    		 		var nomeBusca = document.getElementById('nomeBusca').value;
    		 		var tipo = "Serie";
    		 		var items = 5;
    		 		
    		 		if(nomeBusca != null & nomeBusca != '' & nomeBusca.trim() != ''){
    		 			$.ajax({
    		 				method: "post",
    		 				url: urlAction,
    		 				data: "nomeBusca=" + nomeBusca + "&tipo=" + tipo + "&items=" + items + "&offset="+ offset +"&acao=buscar",
    		 				success: function(response, textStatus, xhr) {
    		 					
    		 					var json = JSON.parse(response);
    		 					
    		 					var el = document.getElementById( 'divdadosSerie' ).remove();
    		 					$("#tratarSerieAjax").append('<div id="divdadosSerie"></div>');
    		 					
    		 					for(var p = 0; p < json.length; p++){
    		 						
    		   						$('#divdadosSerie').append('<div class="row">'+
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
    					                  	'<input onclick="editarSerie('+json[p].id+')" type="button" class="submit" value="Editar">'+
    					                 '</div>'+
    					    		'</div>');
    		   					}
    		 					
								let totalFilme = xhr.getResponseHeader("total");
								let paginas = xhr.getResponseHeader("paginas");
								if(paginas != quantidadePaginas){
									quantidadePaginas = paginas;
									document.getElementById("quantPagina").textContent = "Página 1 de " + quantidadePaginas + ":"
									paginar(0,0);	
								}
									document.getElementById('totalFilmes').textContent = "Quant. de Filmes: " + totalFilme;
								}
    		 			}).fail(function(xhr, status, errorThrown) {
    						alert("Erro ao Buscar Usuario por Nome"+ xhr.responseText);
    					});
    		 		}
    			}
    		  
    		  	function editarSerie(id) {
    		  		
    		  		document.querySelector("#close").click();
    		  		var urlAction = url+"/ServletSerieController";
    		 		
    		 		$.ajax({
    		 			method: "post",
    		 			url: urlAction,
						async: false,
    		 			data: "id=" + id +"&acao=buscarSerieid",
    		 			success: function(response) {
    		 					
    		 				json = JSON.parse(response);
    		 					
    		 				$('#id').val(json.id)
    		 				$('#nome').val(json.nome) 
    		 				$('#ano').val(json.ano)  
    		 				$('#imdb').val(json.imdb)  
    		 				$('#tempo').val(json.time)
    		 				$('#audio').val(json.audio)  
    		 				$('#sinopse').val(json.sinopse)	
    		 				
    		 				$('#selectTemporada').children('option:not(:first)').remove();
    		 				
    		 				for(p = 0; p < json.temporadas.length; p++){
    		 					$('#selectTemporada').append('<option value="'+(p+1)+'">'+json.temporadas[p].nome+'º Temporada</option>');
    		 				}
    		 				
    		 				document.getElementById('quantTemporada').textContent = "Quantidade de Temporadas: " + json.temporadas.length;
    		 				$('#nomeTemporada').val((json.temporadas.length+1));
    		 				
    		 				pegarTemporda();
    		 				
    		 				$("#multselect").select2("destroy")
    		 	       		$("#multselect").val(json.categorias).select2()
    		 	       		
    					}
    		 				
    		 		}).fail(function(xhr, status, errorThrown) {
    						alert("Erro"+ xhr.responseText);
    				});
    		 		
    		 	}
    		  		
				function pegarTemporda() {
					
					var valor = $("#selectTemporada").val();
					$('#tabelaEpisodio > tbody > tr').remove();
					$('#inputDeleteTemporada').remove();
					$('#inputAdicionarEpisodio').remove();
					
					if(valor != 0){
						temporadas = json.temporadas[valor-1];
						
						for(var p=0; p<temporadas.episodios.length; p++){
							
							$("#tabelaEpisodio > tbody")
							.append('<tr>'+
										'<td>'+(p+1)+'</td>'+
										'<td>'+temporadas.episodios[p].nome+'</td>'+
										'<td><input onclick="atualizarEpisodioConfig(' + p + ')" type="button" class="submit" data-toggle="modal" data-target="#AtualizarEpisodio" value="Editar"></td>'+
										'<td><input onclick="apagarEpisodio('+ temporadas.episodios[p].id +')" type="button" class="submit" value="Apagar"></td>'+
									'</tr>');
						}
						$('#NomeEpisodio').val(temporadas.episodios.length+1);
						$('#buttaoDeleteTemporada').append('<input id="inputDeleteTemporada" onclick="deletarTemporada('+temporadas.id+')" type="button" class="submit" value="Apagar Temporada">');
						$('#buttaoAdicionarEpisodio').append('<input id="inputAdicionarEpisodio" type="button" class="submit" data-toggle="modal" data-target="#adiconarEpisodio" value="Adicionar Episodio">');
						
					}
				}
				
				function criarTemporada() {
					
					var urlAction = url+"/ServletSerieController";
					var nome =  $('#nomeTemporada').val();
					var test = true;
					
					for(p = 0; p < json.temporadas.length; p++){
						if(nome === json.temporadas[p].nome){
							test = false;
						}
	 				}
					
					if(test){
						
						$.ajax({
	    		 			method: "post",
	    		 			url: urlAction,
	    		 			data: "nome=" + nome + "&idSerie=" + json.id + "&acao=criarTemporada",
	    		 			success: function(response) {
	    		 					
	    		 				editarSerie(json.id);
	    		 	       		
	    					}
	    		 				
	    		 		}).fail(function(xhr, status, errorThrown) {
	    						alert("Erro"+ xhr.responseText);
	    				});
						
					}
					
					
				}
				
				function deletarTemporada(id) {
					
					var urlAction = url+"/ServletSerieController";
					
					if(confirm("deseja realmente deletar a Temporada?")){
						
						$.ajax({
		   		 			method: "post",
		   		 			url: urlAction,
		   		 			data: "id=" + id + "&acao=deletarTemporda",
		   		 			success: function(response) {
		   		 					
		   		 				editarSerie(json.id);
		   		 	       		
		   					}
		   		 				
		   		 		}).fail(function(xhr, status, errorThrown) {
		   						alert("Erro"+ xhr.responseText);
		   				});
						
					}
					
				}
				
				function adicionarEpisodio() {
					
					let urlAction = url+"/ServletSerieController";
					let nome =  $('#NomeEpisodio').val();
					let urlVideo = $('#urlvideoEpisodios').val();
					let test = true;
					
					for(p = 0; p < temporadas.episodios.length; p++){
						if(nome == temporadas.episodios[p].nome){
							test = false;
						}
	 				}
					
					if(test){
						
						$.ajax({
	    		 			method: "post",
	    		 			url: urlAction,
	    		 			data: "nome=" + nome + "&urlvideo=" + urlVideo + "&idTemporada=" + temporadas.id + "&acao=adicionarEpisodios",
	    		 			success: function(response) {
	    		 				
	    		 				let valor = $('#selectTemporada').val();
	    		 				
	    		 				editarSerie(json.id);

	    		 				$("#selectTemporada").val(valor);

		    		 			pegarTemporda();
	    		 			        
	    					}
	    		 				
	    		 		}).fail(function(xhr, status, errorThrown) {
	    						alert("Erro"+ xhr.responseText);
	    				});
						
					}
					
				}
				
				function apagarEpisodio(id) {
					
					var urlAction = url+"/ServletSerieController";
					
					if(confirm("deseja realmente deletar a Temporada ?")){
						
						$.ajax({
		   		 			method: "post",
		   		 			url: urlAction,
		   		 			data: "id=" + id + "&acao=deletarEpisodio",
		   		 			success: function(response) {
		   		 					
		   		 			let valor = $("#selectTemporada").val();
		   		 				
		   		 			editarSerie(json.id);
    		 				
    		 				$("#selectTemporada").val(valor);  
    		 				
    		 				pegarTemporda();
		   		 	       		
		   					}
		   		 				
		   		 		}).fail(function(xhr, status, errorThrown) {
		   						alert("Erro"+ xhr.responseText);
		   				});
						
					}
					
				}
				
				function atualizarEpisodioConfig(n) {
					var episodio = temporadas.episodios[n];
					$('#atualizarurlvideoEpisodios').val(episodio.urlVideo);
					$('#atuidEpisodio').val(episodio.id)
					
				}
				
				function atualizarEpisodio() {
					
					let urlVideo = $('#atualizarurlvideoEpisodios').val();
					let id = $('#atuidEpisodio').val()
					let urlAction = url+"/ServletSerieController";
					
					$.ajax({
    		 			method: "post",
    		 			url: urlAction,
    		 			data: "id=" + id + "&urlvideo=" + urlVideo + "&acao=AtualizarEpisodio",
    		 			success: function(response) {
    		 				
    		 				let valor = $('#selectTemporada').val();
    		 				
    		 				editarSerie(json.id);
    		 				
							document.getElementById('selectTemporada').value = valor;

	    		 			pegarTemporda();
    		 			        
    					}
    		 				
    		 		}).fail(function(xhr, status, errorThrown) {
    						alert("Erro"+ xhr.responseText);
    				});
					
				}

				function paginar(offset,a) {
			   	let b = document.querySelector(".pagination2");
				let s = $(".pagination2 > span");
			   	s.siblings().remove();
				   let an;
				if(a === 0){
					an = 0;
				}else{
					an = parseInt(a.text, 10);
				}
				let textPagina;
				if(quantidadePaginas <= 6){
						for(let i = an; i < quantidadePaginas; i++){
							if(i == (0)){
								b.innerHTML += ("<a class=\"active\" onclick=\"paginar("+ (i*5) +",this)\">" + (i+1) + "</a>");
							}else{
								b.innerHTML += ("<a onclick=\"paginar("+ (i*5) +",this)\">" + (i+1) + "</a>");
							}
						}
				}else if(an > (quantidadePaginas-5)){
					for (let i = (quantidadePaginas-6); i < quantidadePaginas; i++) {
						if(i == (an-1)){
							b.innerHTML += ("<a class=\"active\" onclick=\"paginar("+ (i*5) +",this)\">" + (i+1) + "</a>");
						}else{
							b.innerHTML += ("<a onclick=\"paginar("+ (i*5) +",this)\">" + (i+1) + "</a>");
						}
					}
				}else{
					if(an > 1){
						for(let i = (an-2); i < (an+2); i++){
							if(i == (an-1)){
								b.innerHTML += ("<a class=\"active\" onclick=\"paginar("+ (i*5) +",this)\">" + (i+1) + "</a>");
							}else{
								b.innerHTML += ("<a onclick=\"paginar("+ (i*5) +",this)\">" + (i+1) + "</a>");
							}
						}
					}else{	
						b.innerHTML += ("<a class=\"active\" onclick=\"paginar("+ (0*5) +",this)\">" + (1) + "</a>");
						b.innerHTML += ("<a onclick=\"paginar("+ (1*5) +",this)\">" + (2) + "</a>");
						b.innerHTML += ("<a onclick=\"paginar("+ (2*5) +",this)\">" + (3) + "</a>");
						b.innerHTML += ("<a onclick=\"paginar("+ (3*5) +",this)\">" + (4) + "</a>");
					}
					b.innerHTML += ("<a>...<a/>");
					for(let i = (quantidadePaginas - 2); i < quantidadePaginas; i++){
						b.innerHTML += ("<a onclick=\"paginar("+ (i*5) +",this)\">" + (i+1) + "</a>");
					}
				}
				b.innerHTML += '<a onclick=\"proximoBut()\"> <i class=\"ion-arrow-right-b\"></i></a>';
				buscarUsuario(offset);
			}
    		  
    		  	function presionar(offset){
    		  		
    		  		clearInterval(tempo); 
    		  		
    		        tempo = window.setTimeout(function(){
    		        	buscarSerie(offset);     	
    		        }, 500);  
    			}
        </script>
    </body>

    </html>