package br.com.madmaxfilmes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.madmaxfilmes.connection.SingleConnectionBanco;
import br.com.madmaxfilmes.model.ModelFilme;

public class DAOFilmeRepository {

	private Connection connection ;

	public DAOFilmeRepository() {
		this.connection = SingleConnectionBanco.getConnection();
	}
	
	public void gravarFilme(ModelFilme filme) throws Exception {
		String sql = "INSERT INTO filmes(nome, imdb, ano, tempo, foto) VALUES (?, ?, ?, ?, ?)";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, filme.getNome());
		stm.setString(2, filme.getImdb()+"");
		stm.setString(3, filme.getAno()+"");
		stm.setString(4, filme.getTime());
		stm.setString(5, filme.getFoto());
		
		stm.execute();
		connection.commit();
	}
	
	public List<ModelFilme> recentesFilmes() throws Exception{
		
		List<ModelFilme> retorno = new ArrayList<>();
		String sql = "select * from filmes order by id desc limit 3";
		
		ResultSet result = connection.createStatement().executeQuery(sql);
		
		while(result.next()){
			
			String nome = result.getString("nome");
			String time = result.getString("tempo");
			String foto = result.getString("foto");
			int ano = Integer.valueOf(result.getString("ano"));
			float imdb = Float.valueOf(result.getString("imdb"));
			
			retorno.add(new ModelFilme(nome, imdb, ano, time, foto));
		}
		
		return retorno;
	}
	
}
