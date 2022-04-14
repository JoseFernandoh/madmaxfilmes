package br.com.madmaxfilmes.servlets;

import java.io.IOException;

import br.com.madmaxfilmes.dao.DAOFilmeRepository;
import br.com.madmaxfilmes.dao.DAOMediaRepository;
import br.com.madmaxfilmes.dao.DAOSerieRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ServletHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DAOFilmeRepository daofilme = new DAOFilmeRepository();
	private DAOSerieRepository daoserie = new DAOSerieRepository();
	private DAOMediaRepository daomidia = new DAOMediaRepository();

	public ServletHome() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			request.setAttribute("slide1", daomidia.recentesFilmes());

			request.setAttribute("todoslide2", daomidia.subListas(1));
			request.setAttribute("todoslide3", daomidia.subListas(2));
			
			request.setAttribute("filmeslide2", daofilme.subListas(1));
			request.setAttribute("filmeslide3", daofilme.subListas(2));
			
			
			request.setAttribute("serieslide2", daoserie.subListas(1));
			request.setAttribute("serieslide3", daoserie.subListas(2));
			request.getRequestDispatcher("home.jsp").forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
