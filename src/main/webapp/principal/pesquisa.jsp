<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<!--[if IE 7]><html class="ie ie7 no-js" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 no-js" lang="en-US"><![endif]-->
<!--[if !(IE 7) | !(IE 8)  ]><!-->
<html lang="en" class="no-js">

	<jsp:include page="head.jsp"></jsp:include>

	<jsp:include page="navbarpesquisa.jsp"></jsp:include>

    <div style="padding-top: 200px;" class="page-single movie_list">

        <div class="container">
            <div class="row ipad-width2">
                <div class="col-md-10 col-sm-12 col-xs-12">
                    <div class="topbar-filter">
                        <p>Foram encontrados <span id="total">${total} </span> no total</p>
                    </div>
                    <div id="tratarFilmeAjax">
	                    <div id="divdadosFilme">
		                    <c:forEach items="${lista}" var="lf">
			                    <div id="divisor1" class="movie-item-style-2">
			                    	<img style=" width: 170px;height: 261px;" src="<%= request.getContextPath() %>/${lf.foto}" alt="">
			                        <div id="divisor2" class="mv-item-infor">
			                            <h6><a href="<%= request.getContextPath() %>${lf.linkPagina}">${lf.nome} <span>(${lf.ano})</span></a></h6>
			                            <p class="rate"><i class="ion-android-star"></i><span>${lf.imdb}</span>/10</p>
			                            <p class="describe">${lf.sinopse}</p>
			                        </div>
			                    </div>
		                    </c:forEach>
	                    </div>
                    </div>
                    <div class="topbar-filter">
                    	<label>Quant. por Página:</label>
                    	<select onclick="mudarQuantFilme()" id = "selectitem">
                    		<option value="5">5</option>
                    		<option value="10">10</option>
                    	</select>
                        <div style="cursor:default" class="pagination2">
                        	<span id="quantPagina">Página 1 de ${paginas}:</span>
                        	<a	 class="active" onclick="paginar(0,this)">1</a>
                        	<%
                        		int paginas = (int) request.getAttribute("paginas");
								if(paginas > 6){
									out.write("<a onclick=\"paginar("+ (1*5) +",this)\">" + (2) + "</a>");
									out.write("<a onclick=\"paginar("+ (2*5) +",this)\">" + (3) + "</a>");
									out.write("<a onclick=\"paginar("+ (3*5) +",this)\">" + (4) + "</a>");
									out.write("<a>...</a>");
									for(int i = (paginas - 2); i < paginas; i++){
										out.write("<a onclick=\"paginar("+ (i*5) +",this)\">" + (i+1) + "</a>");
									}
								}else{
									for(int i = 1; i < paginas; i++){
										out.write("<a onclick=\"paginar("+ (i*5) +",this)\">" + (i+1) + "</a>");
									}
								}
                        	%>
                        	<a onclick="proximoBut()">
                        		<i class="ion-arrow-right-b"></i>
                        	</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
  <jsp:include page="footer.jsp"></jsp:include>
  
        <script type="text/javascript">
		let quantidadePaginas = ${paginas}
       	let tempo;
       	let url = '<%= request.getContextPath() %>';
  
		  function buscarUsuario(offset) {
			  
				let urlAction = url+"/ServletPesquisa";
		 		let nomeBusca = document.getElementById('nomeBusca').value;
		 		let tipo = $('#selectTipo').val();
		 		let items = $('#selectitem').val();
		 		
	 			$.ajax({
	 				method: "post",
	 				url: urlAction,
	 				data: "nomeBusca=" + nomeBusca + "&tipo=" + tipo + "&items=" + items + "&offset="+ offset +"&acao=buscar",
	 				success: function(response, textStatus, xhr) {
	 					
	 					let json = JSON.parse(response);
	 					
	 					let el = document.getElementById( 'divdadosFilme' ).remove();
	 					$("#tratarFilmeAjax").append('<div id="divdadosFilme"></div>');
	 					
	 					for(let p = 0; p < json.length; p++){
	 						
	   						$('#divdadosFilme').append('<div id="divisor'+p+'" class="movie-item-style-2"></div>');
	   						$('#divisor'+p+'').append('<img style=" width: 170px;height: 261px;" src="'+url+'/'+json[p].foto+'">');
	   						$('#divisor'+p+'').append('<div id="subdivisor'+p+'" class="mv-item-infor"></div>');
	   						$('#subdivisor'+p+'').append('<h6><a href="'+url+json[p].linkPagina+'">'+json[p].nome+'<span>('+json[p].ano+')</span></a></h6>');
	   						$('#subdivisor'+p+'').append('<p class="rate"><i class="ion-android-star"></i><span>'+json[p].imdb+'</span>/10</p>');
	   						$('#subdivisor'+p+'').append('<p class="describe">'+json[p].sinopse+'</p>');
	   					}
	 					
	 					let total = xhr.getResponseHeader("total");
						let paginas = xhr.getResponseHeader("paginas");
						if(paginas != quantidadePaginas){
							quantidadePaginas = paginas;
							document.getElementById("quantPagina").textContent = "Página 1 de " + quantidadePaginas + ":"
							paginar(0,0);
						}

	 					document.getElementById("total").textContent = total + " movies";
					}
	 				
	 			}).fail(function(xhr, status, errorThrown) {
					alert("Erro ao Buscar Usuario por Nome"+ xhr.responseText);
				
	 			});
		 		
			}

			function proximoBut(){
				$("a.active").next().click();
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
				document.getElementById("quantPagina").textContent = "Página " + ((offset/5)+1) + " de " + quantidadePaginas + ":"
				b.innerHTML += '<a onclick=\"proximoBut()\"> <i class=\"ion-arrow-right-b\"></i></a>';
				buscarUsuario(offset);
			}

		  
		  	function presionar(offset){
		  		
		  		clearInterval(tempo); 
		  		
		        tempo = window.setTimeout(function(){       
		        	buscarUsuario(offset);     	
		        }, 500);  
			}

			function mudarQuantFilme(){
				buscarUsuario(0);
			}
			
	  </script>
  
	</body>
</html>