package br.com.madmaxfilmes.filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import br.com.madmaxfilmes.connection.SingleConnectionBanco;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;;

@WebFilter( urlPatterns = {"/ServletFilmeController","/administradortela/principal/*"})
public class FilterAutenticacao implements Filter {
	
	private static Connection connection;
	
    public FilterAutenticacao() {
    }

	public void destroy() {
	
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		try {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();

		String usuarioLogado = (String) session.getAttribute("usuario");

		String urlParaAutenticar = req.getServletPath();
		
		if (usuarioLogado == null && !urlParaAutenticar.contains("/administradortela/principal/ServletLogin")) {

			RequestDispatcher redireciona = request.getRequestDispatcher("/administradortela/admin.jsp");
			request.setAttribute("msg", "Por favor Realise o login");
			redireciona.forward(request, response);
			return;

		} else {
			chain.doFilter(request, response);
		
		}
		connection.commit();
		
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		
	
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
		connection = SingleConnectionBanco.getConnection();
		
	}

}
