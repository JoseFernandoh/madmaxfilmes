package br.com.madmaxfilmes.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.madmaxfilmes.dao.DAOSerieRepository;
import br.com.madmaxfilmes.model.ModelCategorias;
import br.com.madmaxfilmes.model.ModelSerie;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet("/ServletSerieController")
public class ServletSerieController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAOSerieRepository dao = new DAOSerieRepository();
	
    public ServletSerieController() {
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		request.setAttribute("categorias", ModelCategorias.values());
		
		if(acao != null && !acao.isEmpty() && acao.equals("cadserie")) {
			request.getRequestDispatcher("/administradortela/principal/cadserie.jsp").forward(request, response);

		}else if(acao != null && !acao.isEmpty() && acao.equals("atuserie")) {
			request.getRequestDispatcher("/administradortela/principal/atuserie.jsp").forward(request, response);

		}else {
			request.getRequestDispatcher("/administradortela/principal/paineladmin.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String acao = request.getParameter("acao");
			
			if(acao != null && !acao.isEmpty() && acao.equals("cadastrarserie")) {
					
				String nome = request.getParameter("nome");
				String time = request.getParameter("tempo");
				String audio = request.getParameter("audio");
				String sinopse = request.getParameter("sinopse");
				String[] genero = request.getParameterValues("multselect");
				int ano = Integer.parseInt(request.getParameter("ano"));
				float imdb = Float.parseFloat(request.getParameter("imdb"));
				Part part = request.getPart("filefoto");

				String nomeFoto = nome.replaceAll("( )|(:)", "") + time + ano + ".jpg";
				String path = "images/capas/"  +nomeFoto;
				part.write(request.getServletContext().getRealPath("images/capas/")+nomeFoto);
					
				List<ModelCategorias> categorias = new ArrayList<>();
				for (String aux : genero) {
					categorias.add(ModelCategorias.valueOf(aux));
				}

				ModelSerie serie = new ModelSerie(nome,imdb,ano,time,path,sinopse,audio,categorias);

				dao.gravarSerie(serie);
					

				
				request.setAttribute("categorias", ModelCategorias.values());
				request.getRequestDispatcher("/administradortela/principal/cadserie.jsp").forward(request, response);
			
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("atualizarserie")) {
				
				Long id = Long.valueOf(request.getParameter("id"));
				String nome = request.getParameter("nome");
				String time = request.getParameter("tempo");
				String audio = request.getParameter("audio");
				String sinopse = request.getParameter("sinopse");
				String[] genero = request.getParameterValues("multselect");
				int ano = Integer.parseInt(request.getParameter("ano"));
				float imdb = Float.parseFloat(request.getParameter("imdb"));
				Part part = request.getPart("filefoto");
				
				List<ModelCategorias> categorias = new ArrayList<>();
				for (String aux : genero) {
					categorias.add(ModelCategorias.valueOf(aux));
				}
				
				ModelSerie serie = new ModelSerie(id,nome,imdb,ano,time,sinopse,audio,categorias);
				
				dao.atualizarSerie(serie);
				
				if(part.getSize() > 0) {

					String nomeFoto = nome.replaceAll("( )|(:)", "") + time + ano + ".jpg";
					String path = "images/capas/"  +nomeFoto;
					part.write(request.getServletContext().getRealPath("images/capas/")+nomeFoto);
					
					dao.atualizarCapaSerie(id, path);
					
				}
				
				request.setAttribute("categorias", ModelCategorias.values());
				request.getRequestDispatcher("/administradortela/principal/atuserie.jsp").forward(request, response);
				
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarSerieid")) {
				
				ObjectMapper mapper = new ObjectMapper();
				String json = mapper.writeValueAsString(dao.buscarSerieId(Long.valueOf(request.getParameter("id"))));
				
				response.getWriter().write(json);
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("criarTemporada")) {
				
				dao.criarTemporada(request.getParameter("nome"), Long.valueOf(request.getParameter("idSerie")));
				
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarTemporda")) {
				
				dao.deletarTemporada(Long.valueOf(request.getParameter("id")));
				
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("adicionarEpisodios")) {
				
				String nome = request.getParameter("nome");
				String urlVideo = request.getParameter("urlvideo");
				Long idTemporada = Long.valueOf(request.getParameter("idTemporada"));
				
				dao.adicionarEpisodio(nome, urlVideo, idTemporada);
				
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarEpisodio")) {
				
				dao.deletarEpisodioid(Long.valueOf(request.getParameter("id")));
				
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("AtualizarEpisodio")) {
				
				dao.atualizarEpisodio(request.getParameter("urlvideo"), Long.valueOf(request.getParameter("id")));
				
			}
		
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);
		}
	}

}
