package br.com.madmaxfilmes.servlets;

import java.io.IOException;

import br.com.madmaxfilmes.dao.DAOFilmeRepository;
import br.com.madmaxfilmes.model.ModelFilme;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ServletPaginaFilme")
public class ServletPaginaFilme extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DAOFilmeRepository daofilme = new DAOFilmeRepository();
	
    public ServletPaginaFilme() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			ModelFilme filme = daofilme.buscarFilmeId(Long.valueOf(request.getParameter("id")));
			
			request.setAttribute("filme", filme);
			request.getRequestDispatcher("/principal/telafilme.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
