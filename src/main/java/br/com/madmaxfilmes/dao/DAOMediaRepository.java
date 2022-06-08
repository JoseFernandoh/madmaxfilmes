package br.com.madmaxfilmes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.madmaxfilmes.connection.SingleConnectionBanco;
import br.com.madmaxfilmes.model.ModelCategorias;
import br.com.madmaxfilmes.model.ModelFilme;
import br.com.madmaxfilmes.model.ModelMidea;
import br.com.madmaxfilmes.model.ModelSerie;

public class DAOMediaRepository {

	private final Connection connection ;

	public DAOMediaRepository() {
		this.connection = SingleConnectionBanco.getConnection();
	}
	
	public List<ModelMidea> buscaInicial() throws Exception{
		
		List<ModelMidea> retorno = new ArrayList<>();
		String sql = "	(select 'filme' as tipo, id,nome,foto,sinopse,ano,imdb from filmes) union\n"
					+ "	(select 'serie' as tipo, id,nome,foto,sinopse,ano,imdb from serie) order by nome, ano desc limit 5";
		
		ResultSet result = connection.createStatement().executeQuery(sql);
		
		while(result.next()) {
			
			Long id = result.getLong("id");
			String nome = result.getString("nome");
			String foto = result.getString("foto");
			String sinopse = result.getString("sinopse");
			int ano = Integer.parseInt(result.getString("ano"));
			float imdb = Float.parseFloat(result.getString("imdb"));
			String tipo = result.getString("tipo");
		
			if(tipo.equalsIgnoreCase("filme")) {
				retorno.add(new ModelFilme(id, nome, imdb, ano, foto, sinopse));	
			}else if(tipo.equalsIgnoreCase("serie")) {
				retorno.add(new ModelSerie(id, nome, imdb, ano, foto, sinopse));
			}
			
		}
		
		return retorno;
	}
	
	public int[] quantidaadePaginasAll(int items) throws Exception {

		String sql = "select count(1) as total from filmes union select count(1) as total from serie ";

		ResultSet resultado = connection.createStatement().executeQuery(sql);
		int total = 0;
		
		while(resultado.next()) {
			total += Integer.parseInt(resultado.getString("total"));
		}
		
		
		double pagina = total / (double) items;
		if ((pagina > 1 ? (pagina % 2) : 0) > 0 || total < 5 && total > 0) {
			pagina++;
		}
		return new int[] {total, (int) pagina};
	}
	
	public int[] quantidaadePaginasAll(int items, String nome) throws Exception {

		String sql = "(select count(1) as total from filmes where upper(nome) like upper(?))"
				+ "union"
				+ "(select count(1) as total from serie where upper(nome) like upper(?))";

		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, "%"+ nome +"%");
		stm.setString(2, "%"+ nome +"%");
		
		ResultSet resultado = stm.executeQuery();
		int total = 0;
		
		while(resultado.next()) {
			total += Integer.parseInt(resultado.getString("total"));
		}

		double pagina = total / (double) items;
		if ((pagina > 1 ? (pagina % 2) : 0) > 0 || total < 5 && total > 0) {
			pagina++;
		}
		return new int[] {total, (int) pagina};
	}

	public List<ModelMidea> subListas(int opcao) throws Exception{
		
		List<ModelMidea> retorno = new ArrayList<>();
		String sql = opcao == 1 ? "(select'filme' as tipo, id,nome,foto,imdb,ano from filmes )\n"
									+ "union \n"
									+ "(select 'serie' as tipo, id,nome,foto,imdb,ano from serie )\n"
									+ "order by ano desc limit 15"
								: "(select'filme' as tipo, id,nome,foto,imdb,ano from filmes )\n"
									+ "union \n"
									+ "(select 'serie' as tipo, id,nome,foto,imdb,ano from serie )\n"
									+ "order by imdb desc limit 15";
		
		ResultSet result = connection.createStatement().executeQuery(sql);
		
		while(result.next()) {
			
			Long id = result.getLong("id");
			String nome = result.getString("nome");
			String foto = result.getString("foto");
			float imdb = Float.parseFloat(result.getString("imdb"));
			String tipo = result.getString("tipo");
			
			if(tipo.equalsIgnoreCase("filme")) {
				retorno.add(new ModelFilme(id, nome, imdb, foto));
			}else if(tipo.equalsIgnoreCase("serie")) {
				retorno.add(new ModelSerie(id, nome, imdb, foto));
			}
			
		}
		
		return retorno;
	}
	
public List<ModelMidea> recentesFilmes() throws Exception{
		
		List<ModelMidea> retorno = new ArrayList<>();
		String sql = "(select distinct 'filme' as tipo, id,nome,foto,ano,imdb,genero from filmes order by id desc limit 3)\n"
					+ "union\n"
					+ "(select distinct 'serie' as tipo, id,nome,foto,ano,imdb,genero from serie order by id desc limit 2)\n"
					+ "order by nome ";
		
		ResultSet result = connection.createStatement().executeQuery(sql);
		
		while(result.next()){
			
			Long id = result.getLong("id");
			String nome = result.getString("nome");
			String foto = result.getString("foto");
			int ano = Integer.parseInt(result.getString("ano"));
			float imdb = Float.parseFloat(result.getString("imdb"));
			String tipo = result.getString("tipo");
			
			List<ModelCategorias> categorias = new ArrayList<>();
			for(String aux : result.getString("genero").split(" ")) {
				categorias.add(ModelCategorias.valueOf(aux));
			}
			
			if(tipo.equalsIgnoreCase("filme")) {
				retorno.add(new ModelFilme(id,nome, imdb, ano, foto, categorias));
			}else if (tipo.equalsIgnoreCase("serie")) {
				retorno.add(new ModelSerie(id,nome, imdb, ano, foto, categorias));
			}
			
		}
		
		return retorno;
	}

	public List<ModelMidea> buscarListaNome(String nomeBusca, Integer limit, Integer offset) throws Exception{
		
		List<ModelMidea> retorno = new ArrayList<>();
		String sql = "(select 'filme' as tipo,id,nome,foto,sinopse,ano,imdb from filmes where upper(nome) like upper(?))\n"
				+ "union \n"
				+ "(select 'serie' as tipo,id,nome,foto,sinopse,ano,imdb from serie where upper(nome) like upper(?))\n"
				+ "order by nome,ano desc offset ? limit ?";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, "%" + nomeBusca + "%");
		stm.setString(2, "%" + nomeBusca + "%");
		stm.setInt(3, offset);
		stm.setInt(4, limit);
		
		ResultSet result = stm.executeQuery();
		
		while(result.next()) {
			
			Long id = result.getLong("id");
			String nome = result.getString("nome");
			String foto = result.getString("foto");
			String sinopse = result.getString("sinopse");
			int ano = Integer.parseInt(result.getString("ano"));
			float imdb = Float.parseFloat(result.getString("imdb"));
			String tipo = result.getString("tipo");
			
			if(tipo.equalsIgnoreCase("filme")) {
				retorno.add(new ModelFilme(id, nome, imdb, ano, foto, sinopse));
			}else if (tipo.equalsIgnoreCase("serie")) {
				retorno.add(new ModelSerie(id,nome, imdb, ano, foto, sinopse));
			}
			
		}
		
		return retorno;
}

}
