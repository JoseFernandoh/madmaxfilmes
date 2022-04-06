package br.com.madmaxfilmes.servlets;

import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.madmaxfilmes.dao.DAOFilmeRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ServletPesquisa")
public class ServletPesquisa extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DAOFilmeRepository daofilme = new DAOFilmeRepository();

    public ServletPesquisa() {
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			int[] dados = daofilme.quantidaadePaginas(5);
			
			request.setAttribute("totalFilme", dados[0]);
			request.setAttribute("paginas", dados[1]);
			request.setAttribute("listaFilme", daofilme.pesquisaIncial());
			request.getRequestDispatcher("/principal/pesquisa.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher(request.getContextPath()+"/erro.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String acao = request.getParameter("acao");
						
			if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarFilme")){
				
				String nome = request.getParameter("nomeBusca");
				String tipo = request.getParameter("tipo");
				Integer items = Integer.valueOf(request.getParameter("items"));
				Integer offset = Integer.valueOf(request.getParameter("offset"));
								
				if(tipo != null && !tipo.isEmpty() && tipo.equalsIgnoreCase("Filme")) {
					
					int[] dados = daofilme.quantidaadePaginas(items, nome);
					
					ObjectMapper mapper = new ObjectMapper();
					String json = mapper.writeValueAsString(daofilme.buscarListaNome(nome, items, offset));
					
					
					response.addHeader("totalFilme", ""+dados[0]);
					response.addHeader("paginas", ""+dados[1]);
					response.getWriter().write(json);
				}
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher(request.getContextPath()+"/erro.jsp").forward(request, response);
		}
		
		
	
	}

}
