<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <!-- footer v2 section-->
        <footer class="ht-footer full-width-ft">
            <div class="row">
                <div class="flex-parent-ft">
                    <div class="flex-child-ft item1"><a href="index.html"><img class="logo" src="images/logo1.png"
                                alt=""></a>
                        <p>5th Avenue st, manhattan<br> New York, NY 10001</p>
                        <p>Call us: <a href="#">(+01) 202 342 6789</a></p>
                    </div>
                    <div class="flex-child-ft item2">
                        <h4>Resources</h4>
                        <ul>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Blockbuster</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Forums</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Help Center</a></li>
                        </ul>
                    </div>
                    <div class="flex-child-ft item3">
                        <h4>Legal</h4>
                        <ul>
                            <li><a href="#">Terms of Use</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Security</a></li>
                        </ul>
                    </div>
                    <div class="flex-child-ft item4">
                        <h4>Account</h4>
                        <ul>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Watchlist</a></li>
                            <li><a href="#">Collections</a></li>
                            <li><a href="#">User Guide</a></li>
                        </ul>
                    </div>
                    <div class="flex-child-ft item5">
                        <h4>Newsletter</h4>
                        <p>Subscribe to our newsletter system now <br>to get latest news from us.</p>
                        <form action="#"><input type="text" placeholder="Enter your email"></form><a href="#"
                            class="btn">Subscribe now <i class="ion-ios-arrow-forward"></i></a>
                    </div>
                </div>
                <div class="ft-copyright">
                    <div class="ft-left">
                        <p>© 2017 Blockbuster. All Rights <a href="http://www.bootstrapmb.com/"
                                title="bootstrapmb">Reserved</a>. Designed by leehari.</p>
                    </div>
                    <div class="backtotop">
                        <p><a href="#" id="back-to-top">Back to top <i class="ion-ios-arrow-thin-up"></i></a></p>
                    </div>
                </div>
            </div>
        </footer>	<!-- end of footer v2 section-->
        <script src="<%= request.getContextPath() %>/js/jquery.js"></script>
        <script src="<%= request.getContextPath() %>/js/plugins.js"></script>
        <script src="<%= request.getContextPath() %>/js/plugins2.js"></script>
        <script src="<%= request.getContextPath() %>/js/custom.js"></script>
        
       	<script type="text/javascript">
       	
       	var tempo;
       	var url = '<%= request.getContextPath() %>';
  
		  function buscarUsuario(offset) {
			  
				var urlAction = document.getElementById('formUser').action;
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