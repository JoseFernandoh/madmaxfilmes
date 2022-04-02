package br.com.madmaxfilmes.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import br.com.madmaxfilmes.dao.DAOFilmeRepository;
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

    public ServletFilmeController() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			if(ServletFileUpload.isMultipartContent(request)) {
				
				String nome = request.getParameter("nome");
				String time = request.getParameter("tempo");
				int ano = Integer.valueOf(request.getParameter("ano"));
				float imdb = Float.valueOf(request.getParameter("imdb"));
				Part part = request.getPart("filefoto");
				
				String path = "images/capas/" + nome.replaceAll(" ", "") + time + ano + ".jpg";
				String caminho = "/home/deku/git/repository/madmaxfilmes/src/main/webapp/";
				FileOutputStream out = new FileOutputStream(new File(caminho+path));
				out.write(IOUtils.toByteArray(part.getInputStream()));
				
				ModelFilme filme = new ModelFilme(nome,imdb,ano,time,path);
				
				daofilme.gravarFilme(filme);
				
			}
				request.getRequestDispatcher("/administradortela/principal/paineladmin.jsp").forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);			
		}		
	}

}
