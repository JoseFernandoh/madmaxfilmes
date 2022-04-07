package br.com.madmaxfilmes.servlets;

import java.io.IOException;

import br.com.madmaxfilmes.dao.DAOLoginRepository;
import br.com.madmaxfilmes.model.ModelLogin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAOLoginRepository dao = new DAOLoginRepository();

	public ServletLogin() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String acao = request.getParameter("acao");

		if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("logout")) {
			request.getSession().invalidate();
			request.getRequestDispatcher("/administradortela/admin.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/administradortela/admin.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String login = request.getParameter("login");
		String senha = request.getParameter("senha");

		try {
			if (login != null && !login.isEmpty() && senha != null && !senha.isEmpty()) {
				ModelLogin user = new ModelLogin(login, senha);
				if (dao.validarAutenticacao(user)) {
					
					request.getSession().setAttribute("usuario", user.getLogin());
					request.getSession().setAttribute("admin", dao.validarAdmin(user.getLogin()));
					request.getRequestDispatcher("/administradortela/principal/paineladmin.jsp").forward(request,
							response);
				} else {
					request.setAttribute("msg", "Informe o login e a senha conrretamente");
					request.getRequestDispatcher("/administradortela/admin.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("msg", "Informe o login e a senha conrretamente");
				request.getRequestDispatcher("/administradortela/admin.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);
		}
	}

}
