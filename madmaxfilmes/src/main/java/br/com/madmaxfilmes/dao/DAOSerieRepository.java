package br.com.madmaxfilmes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import br.com.madmaxfilmes.connection.SingleConnectionBanco;
import br.com.madmaxfilmes.model.ModelSerie;

public class DAOSerieRepository {
	
	private Connection connection;

	public DAOSerieRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public void gravarSerie(ModelSerie serie)throws Exception {
		String sql = "INSERT INTO public.serie(nome, imdb, ano, tempo, foto, sinopse, audio, genero) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, serie.getNome());
		stm.setString(2, serie.getImdb()+"");
		stm.setString(3, serie.getAno()+"");
		stm.setString(4, serie.getTime());
		stm.setString(5, serie.getFoto());
		stm.setString(6, serie.getSinopse());
		stm.setString(7, serie.getAudio());
		stm.setString(8, serie.getCategiraDB());
		
		stm.execute();
		connection.commit();
	}
	
}
