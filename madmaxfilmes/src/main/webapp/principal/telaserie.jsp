<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 7]><html class="ie ie7 no-js" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 no-js" lang="en-US"><![endif]-->
<!--[if !(IE 7) | !(IE 8)  ]><!-->
<html lang="en" class="no-js">

	<jsp:include page="head.jsp"></jsp:include>

    <jsp:include page="navbar.jsp"></jsp:include>

    <div style="padding-top: 160px; padding-bottom: 0px" class="page-single">
        <div class="container">
            <div class="row ipad-width2">
                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="movie-img sticky-sb">
                    	<img width="330px" height="505px" src="<%= request.getContextPath() %>/${serie.foto}" alt="">
                    </div>	
                </div>
                <div style="background-color: #0b1a2a; border: 3px solid #0f2133; padding-top: 15px;"  class="col-md-8 col-sm-12 col-xs-12">
	                <div style="padding-bottom: 30px;">
                        <div class="row">
	                		<div class="col-md-8 col-sm-12 col-xs-12">
	                    		<div class="movie-single-ct main-content">
	                        		<h1 class="bd-hd">${serie.nome}<span>${serie.ano}</span></h1>
	                    		</div>
	                		</div>
	                	</div>
	                </div>
                    <div style="padding-bottom: 20px;">
                        <div class="row">
                            <div class="col-md-2">
                                <h6 style="color: white">IMDB: </h6>
                            </div>
                            <div class="col-md-5">
	                        	<p>
	                        		<i style="color: #f5b50a; font-size: 22px;" class="ion-android-star">
	                        		</i>
	                        		<span style="font-weight: 400; font-size: 18px;">${serie.imdb}
	                        		</span>/10
	                        	</p>
                            </div>
                        </div>
                    </div>
                    <div style="padding-bottom: 20px;">
                        <div class="row">
                            <div class="col-md-2">
                                <h6 style="color: white">Genero: </h6>
                            </div>
                            <div class="col-md-5">
                                <div class="title-in">
                                    <div class="cate">
	                                 	 <c:forEach items="${serie.categorias}" var="cat">
	                                        <span class="${cat.cor}">
	                                            <a>${cat.nome}</a>
	                                        </span>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <div class="row">
                                <div class="col-md-2">
                                    <h6 style="color: white">Audio: </h6>
                                </div>
                                <div class="col-md-5">
                                    <h6 style="color: white">${serie.audio}</h6>
                                </div>
                            </div>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <div class="row">
                                <div class="col-md-2	">
                                    <h6 style="color: white">Duração: </h6>
                                </div>
                                <div class="col-md-5">
                                    <h6 style="color: white">${serie.time}</h6>
                                </div>
                            </div>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <div class="row">
                                <div class="col-md-2">
                                    <h6 style="color: white">Sinopse: </h6>
                                </div>
                                <div class="col-md-8">
                                    <p style="color: white">${serie.sinopse}</p>
                                </div>
                            </div>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <div class="row">
                                <div class="col-md-2">
                                    <h6 style="color: white">Temporada: </h6>
                                </div>
                                <div class="col-md-5">
                                    <select onchange="selTemporada()" style="background-color: #0f2133; border: none; color: white;" id="selectTemporada">
                                    	<c:forEach var="i" begin="0" end="${serie.temporadas.size()-1}" step="1">
                                    		<option value="${i}"> ${serie.temporadas[i].nome}ª Temporada </option>
                                    	</c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-single">
        <div class="container">
            <div style=" height: 640px;">
                <iframe id="videoUrl" width="100%" height="100%" src="${serie.temporadas[0].episodios[0].urlVideo}"
                    title="YouTube video player" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen>
                </iframe>
            </div>
        </div>
        <div style="margin-top: 5%" class="container">
        	<div class="form-style-1 user-pro">
        		<div style="margin-bottom: 0px; border: none;" class="topbar-filter">
        			<div class="col-md-3">
                    	<input onclick="anteriosEpisodio()" type="button" class="submit" value="Anterior">
                    </div>
                    <div class="col-md-5">
	                   	<select onchange="selEpisodio()" style="background-color: #0f2133; border: none; color: white; width: 100%; text-align: center;" id="selectEpisodio">
                           	<c:forEach var="i" begin="0" end="${serie.temporadas[0].episodios.size() - 1}" step="1">
                                  <option value="${i}"> ${serie.temporadas[0].episodios[i].nome}ª Episodio </option>
                            </c:forEach>
                    	</select>
                    </div>
                    <div class="col-md-3">
                    	<input onclick="proximoEpisodio()" type="button" class="submit" value="Proximo">
                    </div>
        		</div>
        	</div>
     	</div>
    </div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		var posicao = $('#selectEpisodio').val();
		var posicaoTemporada = $('#selectTemporada').val();
		var temporada = ${temporada};
		
		function proximoEpisodio() {
			
			posicao++;
			
			if(posicao < temporada[posicaoTemporada].episodios.length){
				$('#selectEpisodio').val(posicao);
			}else{
				posicaoTemporada++;
				if(posicaoTemporada < temporada.length){
					$('#selectTemporada').val((posicaoTemporada));
					ajeitarEpisodio();
					posicao = $('#selectEpisodio').val();
				}else{
					posicao--;
					posicaoTemporada--;
				}
			}
				$("#videoUrl").attr("src", temporada[posicaoTemporada].episodios[posicao].urlVideo);
		}
		
		function anteriosEpisodio() {
			
			if(posicao != 0){
				posicao--;
				$('#selectEpisodio').val(posicao);
			}else{
				if(posicaoTemporada != 0){
					posicaoTemporada--;
					$('#selectTemporada').val((posicaoTemporada));
					ajeitarEpisodio()
					posicao = (temporada[posicaoTemporada].episodios.length - 1);
					$('#selectEpisodio').val(posicao);
				}
			}
			
			$("#videoUrl").attr("src", temporada[posicaoTemporada].episodios[posicao].urlVideo);
		}
		
		function selTemporada() {
			posicaoTemporada = $('#selectTemporada').val();
			ajeitarEpisodio();
			selEpisodio()
		}
		
		function selEpisodio() {
			posicao = $('#selectEpisodio').val();
			$("#videoUrl").attr("src", temporada[posicaoTemporada].episodios[posicao].urlVideo);
		}
		
		function ajeitarEpisodio() {
			$('#selectEpisodio > option').remove();
			for(var i = 0; i < temporada[posicaoTemporada].episodios.length; i++){
				$('#selectEpisodio').append('<option value="'+i+'"> '+temporada[posicaoTemporada].episodios[i].nome+'ª Episodio </option>');
			}
		}
		
	</script>
	
	</body>

</html>