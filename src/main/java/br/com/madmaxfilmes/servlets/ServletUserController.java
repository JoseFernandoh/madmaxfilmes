package br.com.madmaxfilmes.servlets;

import java.io.IOException;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.madmaxfilmes.dao.DAOLoginRepository;
import br.com.madmaxfilmes.model.ModelLogin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ServletUserController")
public class ServletUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final DAOLoginRepository dao = new DAOLoginRepository();

    public ServletUserController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String acao = request.getParameter("acao");
			
			if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("cadastrarAdmin")) {
				
				String login = request.getParameter("login");
				String senha = request.getParameter("senha");
				
				ModelLogin modelLogin = new ModelLogin(login,senha);
				if(dao.validarAdmincad(login)) {
					dao.cirarAdmin(modelLogin);
				}

				request.getRequestDispatcher("/administradortela/principal/criaruser.jsp").forward(request, response);
				
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarlogin")) {
				String nome = request.getParameter("nomeBusca");
				int offset = Integer.parseInt(request.getParameter("offset"));
				
				List<ModelLogin> logins = dao.buscaLoginsnome(offset, nome);
				int[] dados = dao.quantidaadePaginas(nome);
				
				ObjectMapper mapper = new ObjectMapper();
				String json = mapper.writeValueAsString(logins);
				
				response.addHeader("totaluser", dados[0]+"");
				response.addHeader("totalPagina", dados[1]+"");
				response.getWriter().write(json);
				
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletaruserid")) {
				
				dao.deleteUser(Long.valueOf(request.getParameter("id")));
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);
		}
	}

}
