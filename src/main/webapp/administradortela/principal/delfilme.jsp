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
                               <p id="msg">${msg}</p>
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
							<div class="topbar-filter">
							<label id="totalFilmes">Quant. de Filmes: 0</label>
							<div style="cursor:default" class="pagination2">
								<span id="quantPagina">Page 1 of 2:</span>
								<a class="active" href="#">1</a>
								<a onclick="proximoBut()">
									<i class="ion-arrow-right-b"></i>
								</a>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="js.jsp"></jsp:include>
        
        <script>
    	    
        	let tempo;
			let quantidadePaginas;
	   		let url = '<%= request.getContextPath() %>';
        
        	$("#multselect").select2();
        	$("#delfilme").addClass('active')
        	
        	function buscarUsuario(offset) {
    			  
   				let urlAction = url+"/ServletPesquisa";
   		 		let nomeBusca = document.getElementById('nomeBusca').value;
   		 		let tipo = "Filme";
   		 		let items = 5;
   		 		
   		 		if(nomeBusca != null & nomeBusca != '' & nomeBusca.trim() != ''){
   		 			$.ajax({
   		 				method: "post",
   		 				url: urlAction,
   		 				data: "nomeBusca=" + nomeBusca + "&tipo=" + tipo + "&items=" + items + "&offset="+ offset +"&acao=buscar",
   		 				success: function(response, textStatus, xhr) {
   		 					
   		 					let json = JSON.parse(response);
   		 					
   		 					$('#divdadosFilme').remove();
   		 					$('#topdarfilter').remove();
   		 					$("#tratarFilmeAjax").append('<div id="divdadosFilme"></div>');
   		 					
   		 					for(let p = 0; p < json.length; p++){
   		 						
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
   		 					
   		 					let totalFilme = xhr.getResponseHeader("total");
							let paginas = xhr.getResponseHeader("paginas");
							if(paginas != quantidadePaginas){
								quantidadePaginas = paginas;
								document.getElementById("quantPagina").textContent = "Page 1 de " + quantidadePaginas + ":";
								paginar(0,0);	
							}
    		 					document.getElementById('totalFilmes').textContent = "Quant. de Filmes: " + totalFilme;
   		 					}
   		 			}).fail(function(xhr, status, errorThrown) {
   						alert("Erro ao Buscar Filme por Nome"+ xhr.responseText);
   					});
   		 		}
   			}
        	
        	function deletarFilme(id) {
        		let urlAction = url+"/ServletFilmeController";
        		
        		if(confirm("deseja realmente deletar o Filme?")){
			 		$.ajax({
			 			method: "post",
			 			url: urlAction,
			 			data: "id=" + id +"&acao=deletarfilmeid",
			 			success: function(response) {
			 					
			 				document.getElementById("msg").textContent = "Filme Apagado com sucesso"
			 				buscarUsuario(0);
			 	       		
						}
			 				
			 		}).fail(function(xhr, status, errorThrown) {
							alert("Erro ao Deletar o filme"+ xhr.responseText);
					});
        		}
		 		
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
    		        	buscarUsuario(offset);     	
    		        }, 500);  
    			}
        	
        </script>
    </body>

    </html>