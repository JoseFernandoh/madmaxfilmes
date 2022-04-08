package br.com.madmaxfilmes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.madmaxfilmes.connection.SingleConnectionBanco;
import br.com.madmaxfilmes.model.ModelCategorias;
import br.com.madmaxfilmes.model.ModelFilme;

public class DAOFilmeRepository {

	private Connection connection ;

	public DAOFilmeRepository() {
		this.connection = SingleConnectionBanco.getConnection();
	}
	
	public void gravarFilme(ModelFilme filme) throws Exception {
		String sql = "INSERT INTO filmes(nome, imdb, ano, tempo, foto, sinopse, audio, urlvideo, genero) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, filme.getNome());
		stm.setString(2, filme.getImdb()+"");
		stm.setString(3, filme.getAno()+"");
		stm.setString(4, filme.getTime());
		stm.setString(5, filme.getFoto());
		stm.setString(6, filme.getSinopse());
		stm.setString(7, filme.getAudio());
		stm.setString(8, filme.getUrlVideo());
		stm.setString(9, filme.getCategiraDB());

		
		
		stm.execute();
		connection.commit();
	}
	
	public void atualizarFilme(ModelFilme filme) throws Exception {
		String sql = "update filmes set nome=?, imdb=?, ano=?, tempo=?, sinopse=?, audio=?, urlvideo=?, genero=? where id = ?";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, filme.getNome());
		stm.setString(2, filme.getImdb()+"");
		stm.setString(3, filme.getAno()+"");
		stm.setString(4, filme.getTime());
		stm.setString(5, filme.getSinopse());
		stm.setString(6, filme.getAudio());
		stm.setString(7, filme.getUrlVideo());
		stm.setString(8, filme.getCategiraDB());
		stm.setLong(9, filme.getId());
		
		stm.execute();
		connection.commit();
		
	}
	
	public void atualizarCapaFilme(Long id, String foto) throws Exception {
		String sql = "update filmes set foto=? where id = ?";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, foto);
		stm.setLong(2, id);
		
		stm.execute();
		connection.commit();
		
	}
	
	public String deletarFilme(Long id) throws Exception {
		String sql = "select foto from filmes where id = ?";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setLong(1, id);
		
		ResultSet result = stm.executeQuery();
		result.next();
		String path = result.getString("foto");
		
		sql = "delete from filmes where id = ?";
		
		stm = connection.prepareStatement(sql);
		stm.setLong(1, id);
		
		stm.execute();
		connection.commit();
		
		return path;
		
	}
		
	public ModelFilme buscarFilmeId(Long id) throws Exception {
		
		ModelFilme filme = null;
		String sql = "select * from filmes where id = ?";
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setLong(1, id);
		
		ResultSet result = stm.executeQuery();
		
		while(result.next()) {
			
			List<ModelCategorias> categorias = new ArrayList<>();
			for(String aux : result.getString("genero").split(" ")) {
				categorias.add(ModelCategorias.valueOf(aux));
			}
			
			filme = new ModelFilme(
					result.getLong("id"),
					result.getString("nome"),
					Float.valueOf(result.getString("imdb")),				
					Integer.valueOf(result.getString("ano")),
					result.getString("tempo"),
					result.getString("foto"),
					result.getString("sinopse"),
					result.getString("audio"),
					result.getString("urlvideo"),
					categorias);
		}
		
		
		return filme;
	}
	
	public List<ModelFilme> recentesFilmes() throws Exception{
		
		List<ModelFilme> retorno = new ArrayList<>();
		String sql = "select id,nome,foto,ano,imdb,genero from filmes order by id desc limit 3";
		
		ResultSet result = connection.createStatement().executeQuery(sql);
		
		while(result.next()){
			
			Long id = result.getLong("id");
			String nome = result.getString("nome");
			String foto = result.getString("foto");
			int ano = Integer.valueOf(result.getString("ano"));
			float imdb = Float.valueOf(result.getString("imdb"));
			
			List<ModelCategorias> categorias = new ArrayList<>();
			for(String aux : result.getString("genero").split(" ")) {
				categorias.add(ModelCategorias.valueOf(aux));
			}
			
			retorno.add(new ModelFilme(id,nome, imdb, ano, foto, categorias));
		}
		
		return retorno;
	}
	
	public List<ModelFilme> subListasFilme(int opcao) throws Exception{
		
		List<ModelFilme> retorno = new ArrayList<>();
		String sql = opcao == 1 ? "select id,nome,foto,imdb from filmes order by ano desc limit 15" 
								: "select id,nome,foto,imdb from filmes order by imdb desc limit 15";
		
		ResultSet result = connection.createStatement().executeQuery(sql);
		
		while(result.next()) {
			
			Long id = result.getLong("id");
			String nome = result.getString("nome");
			String foto = result.getString("foto");
			float imdb = Float.valueOf(result.getString("imdb"));
			
			retorno.add(new ModelFilme(id, nome, imdb, foto));
			
		}
		
		return retorno;
	}
	
	public List<ModelFilme> pesquisaIncial() throws Exception{
		
		List<ModelFilme> retorno = new ArrayList<>();
		String sql = "select id,nome,foto,sinopse,ano,imdb from filmes order by ano desc limit 5";
		
		ResultSet result = connection.createStatement().executeQuery(sql);
		
		while(result.next()) {
			
			Long id = result.getLong("id");
			String nome = result.getString("nome");
			String foto = result.getString("foto");
			String sinopse = result.getString("sinopse");
			int ano = Integer.valueOf(result.getString("ano"));
			float imdb = Float.valueOf(result.getString("imdb"));
		
			retorno.add(new ModelFilme(id, nome, imdb, ano, foto, sinopse));	
			
		}
		
		return retorno;
		
	}
	
	public List<ModelFilme> buscarListaNome(String nomeBusca, Integer limit, Integer offset) throws Exception{
		
		List<ModelFilme> retorno = new ArrayList<>();
		String sql = "select id,nome,foto,sinopse,ano,imdb from filmes where upper(nome) like upper(?) order by ano desc offset ? limit ?";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, "%" + nomeBusca + "%");
		stm.setInt(2, offset);
		stm.setInt(3, limit);
		
		ResultSet result = stm.executeQuery();
		
		while(result.next()) {
			
			Long id = result.getLong("id");
			String nome = result.getString("nome");
			String foto = result.getString("foto");
			String sinopse = result.getString("sinopse");
			int ano = Integer.valueOf(result.getString("ano"));
			float imdb = Float.valueOf(result.getString("imdb"));
		
			retorno.add(new ModelFilme(id, nome, imdb, ano, foto, sinopse));
			
		}
		
		return retorno;
	}
	
	public int[] quantidaadePaginas(int items, String nomeBusca) throws Exception {

		String sql = "select count(1) as total from filmes where upper(nome) like upper(?)";

		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, "%" + nomeBusca + "%");
		
		ResultSet resultado = stm.executeQuery();
		resultado.next();
		
		int totalFilme = Integer.valueOf(resultado.getString("total"));
		Double pagina = totalFilme / Double.valueOf(items);

		if (pagina % 2 > 0) {
			pagina++;
		}

		return new int[] {totalFilme, pagina.intValue()};
	}
	
	public int[] quantidaadePaginas(int items) throws Exception {

		String sql = "select count(1) as total from filmes";

		ResultSet resultado = connection.createStatement().executeQuery(sql);
		resultado.next();
		
		int totalFilme = Integer.valueOf(resultado.getString("total"));
		Double pagina = totalFilme / Double.valueOf(items);

		if (pagina % 2 > 0) {
			pagina++;
		}

		return new int[] {totalFilme, pagina.intValue()};
	}

	
}
