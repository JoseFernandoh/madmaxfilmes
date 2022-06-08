package br.com.madmaxfilmes.servlets;

import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.madmaxfilmes.dao.DAOFilmeRepository;
import br.com.madmaxfilmes.dao.DAOMediaRepository;
import br.com.madmaxfilmes.dao.DAOSerieRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ServletPesquisa")
public class ServletPesquisa extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final DAOFilmeRepository daofilme = new DAOFilmeRepository();
	private final DAOSerieRepository daoserie = new DAOSerieRepository();
	private final DAOMediaRepository daopesquisa = new DAOMediaRepository();

    public ServletPesquisa() {
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			int[] dados = daopesquisa.quantidaadePaginasAll(5);

			request.setAttribute("total", dados[0]);
			request.setAttribute("paginas", dados[1]);
			request.setAttribute("lista", daopesquisa.buscaInicial());
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
						
			if(acao != null && acao.equalsIgnoreCase("buscar")){
				
				String nome = request.getParameter("nomeBusca");
				String tipo = request.getParameter("tipo");
				int items = Integer.parseInt(request.getParameter("items"));
				Integer offset = Integer.valueOf(request.getParameter("offset"));
				ObjectMapper mapper = new ObjectMapper();
								
				if(tipo != null && tipo.equalsIgnoreCase("Filme")) {

					int[] dados = daofilme.quantidaadePaginas(items, nome);

					String json = mapper.writeValueAsString(daofilme.buscarListaNome(nome, items, offset));


					response.addHeader("total", ""+dados[0]);
					response.addHeader("paginas", ""+dados[1]);
					response.getWriter().write(json);

				}else if (tipo != null && tipo.equalsIgnoreCase("Serie")) {
					int[] dados = daoserie.quantidaadePaginas(items, nome);
					
					String json = mapper.writeValueAsString(daoserie.buscarListaNome(nome, items, offset));
					response.addHeader("total", ""+dados[0]);
					response.addHeader("paginas", ""+dados[1]);
					response.getWriter().write(json);

				}else if (tipo != null && tipo.equalsIgnoreCase("Todos")) {
					
					int[] dados = daopesquisa.quantidaadePaginasAll(items, nome);
					
					String json = mapper.writeValueAsString(daopesquisa.buscarListaNome(nome, items, offset));
					
					response.addHeader("total", ""+dados[0]);
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
