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
		String sql = "select * from filmes order by id desc limit 3";
		
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
		String sql = opcao == 1 ? "select * from filmes order by ano desc limit 15" 
								: "select * from filmes order by imdb desc limit 15";
		
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
	
}
