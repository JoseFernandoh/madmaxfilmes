package br.com.madmaxfilmes.servlets;

import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.madmaxfilmes.dao.DAOSerieRepository;
import br.com.madmaxfilmes.model.ModelSerie;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ServletPaginaSerie")
public class ServletPaginaSerie extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DAOSerieRepository dao = new DAOSerieRepository();

    public ServletPaginaSerie() {
   
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			
			ModelSerie serie = dao.buscarSerieId(Long.valueOf(request.getParameter("id")));
			
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(serie.getTemporadas());
			
			request.setAttribute("temporada", json);
			request.setAttribute("serie", serie);
			request.getRequestDispatcher("/principal/telaserie.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
