package br.com.madmaxfilmes.servlets;

import java.io.IOException;

import br.com.madmaxfilmes.testDadosController.ControllerFIlmes;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ServletHome extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletHome() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("slide1", ControllerFIlmes.listFilmeSlider1());
		request.setAttribute("slide2", ControllerFIlmes.listFilmeSlider2());
		request.setAttribute("slide3", ControllerFIlmes.listFilmeSlider3());
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
