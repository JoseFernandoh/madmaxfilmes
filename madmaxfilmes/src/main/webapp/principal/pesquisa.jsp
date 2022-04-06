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
                        <p>Found <span id="nomeFilme">${totalFilme} movies</span> in total</p>
                    </div>
                    <div id="tratarFilmeAjax">
	                    <div id="divdadosFilme">
		                    <c:forEach items="${listaFilme}" var="lf">
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
                    	<label>Movies per page:</label>
                    	<select id = "selectitem">
                    		<option value="5">5 Movies</option>
                    		<option value="10">10 Movies</option>
                    	</select>
                        <div class="pagination2">
                        	<span>Page 1 of ${paginas}:</span>
                        	<a class="active" href="#">1</a>
                        	<%
                        		int paginas = (int) request.getAttribute("paginas");
                        		
                        		for(int i = 1; i < paginas; i++){
                        			String url = request.getContextPath() + "#";
                        			out.write("<a href=\"#\">" + (i+1) + "</a>");
                        		}
                        	%>
                        	<a onclick="#">
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
       	
       	var tempo;
       	var url = '<%= request.getContextPath() %>';
  
		  function buscarUsuario(offset) {
			  
				var urlAction = url+"/ServletPesquisa";
		 		var nomeBusca = document.getElementById('nomeBusca').value;
		 		var tipo = $('#selectTipo').val();
		 		var items = $('#selectitem').val();
		 		
		 		if(nomeBusca != null & nomeBusca != '' & nomeBusca.trim() != ''){
		 			$.ajax({
		 				method: "post",
		 				url: urlAction,
		 				data: "nomeBusca=" + nomeBusca + "&tipo=" + tipo + "&items=" + items + "&offset="+ offset +"&acao=buscarFilme",
		 				success: function(response, textStatus, xhr) {
		 					
		 					var json = JSON.parse(response);
		 					
		 					var el = document.getElementById( 'divdadosFilme' ).remove();
		 					$("#tratarFilmeAjax").append('<div id="divdadosFilme"></div>');
		 					
		 					for(var p = 0; p < json.length; p++){
		 						
		   						$('#divdadosFilme').append('<div id="divisor'+p+'" class="movie-item-style-2"></div>');
		   						$('#divisor'+p+'').append('<img style=" width: 170px;height: 261px;" src="'+url+'/'+json[p].foto+'">');
		   						$('#divisor'+p+'').append('<div id="subdivisor'+p+'" class="mv-item-infor"></div>');
		   						$('#subdivisor'+p+'').append('<h6><a href="'+url+json[p].linkPagina+'">'+json[p].nome+'<span>('+json[p].ano+')</span></a></h6>');
		   						$('#subdivisor'+p+'').append('<p class="rate"><i class="ion-android-star"></i><span>'+json[p].imdb+'</span>/10</p>');
		   						$('#subdivisor'+p+'').append('<p class="describe">'+json[p].sinopse+'</p>');
		   					}
		 					
		 					var totalFilme = xhr.getResponseHeader("totalFilme");

		 					document.getElementById("nomeFilme").textContent = totalFilme + " movies";
						}
		 				
		 			}).fail(function(xhr, status, errorThrown) {
						alert("Erro ao Buscar Usuario por Nome"+ xhr.responseText);
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