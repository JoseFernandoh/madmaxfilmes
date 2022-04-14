package br.com.madmaxfilmes.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.madmaxfilmes.dao.DAOFilmeRepository;
import br.com.madmaxfilmes.model.ModelCategorias;
import br.com.madmaxfilmes.model.ModelFilme;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet("/ServletFilmeController")
public class ServletFilmeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DAOFilmeRepository daofilme = new DAOFilmeRepository();
	private String caminho = "/home/deku/git/repository/madmaxfilmes/src/main/webapp/";

    public ServletFilmeController() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		request.setAttribute("categorias", ModelCategorias.values());
		
		if(acao != null && !acao.isEmpty() && acao.equals("cadfilme")) {
			request.getRequestDispatcher("/administradortela/principal/cadfilmes.jsp").forward(request, response);

		}else if(acao != null && !acao.isEmpty() && acao.equals("atufilme")) {
			request.getRequestDispatcher("/administradortela/principal/atufilme.jsp").forward(request, response);

		}else {
			request.getRequestDispatcher("/administradortela/principal/paineladmin.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String acao = request.getParameter("acao");
			
			if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("cadastrarfilme")) {
				
				if(ServletFileUpload.isMultipartContent(request)) {
					
					String nome = request.getParameter("nome");
					String time = request.getParameter("tempo");
					String audio = request.getParameter("audio");
					String urlVideo = request.getParameter("urlvideo");
					String sinopse = request.getParameter("sinopse");
					String[] genero = request.getParameterValues("multselect");
					int ano = Integer.valueOf(request.getParameter("ano"));
					float imdb = Float.valueOf(request.getParameter("imdb"));
					Part part = request.getPart("filefoto");
					
					String path = "images/capas/" + nome.replaceAll(" ", "") + time + ano + ".jpg";
					FileOutputStream out = new FileOutputStream(new File(caminho+path));
					out.write(IOUtils.toByteArray(part.getInputStream()));
					
					List<ModelCategorias> categorias = new ArrayList<>();
					for (String aux : genero) {
						categorias.add(ModelCategorias.valueOf(aux));
					}
					
					ModelFilme filme = new ModelFilme(nome,imdb,ano,time,path,sinopse,audio,urlVideo,categorias);
					
					daofilme.gravarFilme(filme);
					
				}
				
				request.setAttribute("categorias", ModelCategorias.values());
				request.setAttribute("msg", " Filme Cadastrado com Sucesso");
				request.getRequestDispatcher("/administradortela/principal/cadfilmes.jsp").forward(request, response);
				
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("atualizarfilme")) {
				
				Long id = Long.valueOf(request.getParameter("id"));
				String nome = request.getParameter("nome");
				String time = request.getParameter("tempo");
				String audio = request.getParameter("audio");
				String urlVideo = request.getParameter("urlvideo");
				String sinopse = request.getParameter("sinopse");
				String[] genero = request.getParameterValues("multselect");
				int ano = Integer.valueOf(request.getParameter("ano"));
				float imdb = Float.valueOf(request.getParameter("imdb"));
				Part part = request.getPart("filefoto");
				
				List<ModelCategorias> categorias = new ArrayList<>();
				for (String aux : genero) {
					categorias.add(ModelCategorias.valueOf(aux));
				}
				
				ModelFilme filme = new ModelFilme(id,nome,imdb,ano,time,sinopse,audio,urlVideo,categorias);
				
				daofilme.atualizarFilme(filme);
				
				if(part.getSize() > 0) {
					
					String path = "images/capas/" + nome.replaceAll(" ", "") + time + ano + ".jpg";
					FileOutputStream out = new FileOutputStream(new File(caminho+path));
					out.write(IOUtils.toByteArray(part.getInputStream()));
					
					daofilme.atualizarCapaFilme(id, path);
					
				}
				
				request.setAttribute("categorias", ModelCategorias.values());
				request.getRequestDispatcher("/administradortela/principal/atufilme.jsp").forward(request, response);
				
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarfilmeid")) {
				ModelFilme filme = daofilme.buscarFilmeId(Long.valueOf(request.getParameter("id")));
				
				ObjectMapper mapper = new ObjectMapper();
				String json = mapper.writeValueAsString(filme);
				
				response.getWriter().write(json);
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarfilmeid")) {
				
				String foto = daofilme.deletarFilme(Long.valueOf(request.getParameter("id")));
				
				File file = new File(caminho+foto);
				file.delete();
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);			
		}		
	}

}
