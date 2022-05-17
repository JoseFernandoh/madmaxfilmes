package br.com.madmaxfilmes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.madmaxfilmes.connection.SingleConnectionBanco;
import br.com.madmaxfilmes.model.ModelLogin;

public class DAOLoginRepository {

	private final Connection connection;

	public DAOLoginRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public void cirarAdmin(ModelLogin modelLogin) throws Exception {
		String sql = "insert into model_login (login,senha) values (?,?)";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, modelLogin.getLogin());
		stm.setString(2, modelLogin.getSenha());
		
		stm.execute();
		connection.commit();
		
	}
	
	public void deleteUser(Long id)throws Exception {
		String sql = "delete from model_login where id = ?";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setLong(1,id);
		
		stm.execute();
		connection.commit();
		
				
	}
	
	public List<ModelLogin> buscaLogins(int offset) throws Exception{
		
		List<ModelLogin> list = new ArrayList<>();
		String sql = "select * from model_login admin = false offset ? limit 5";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setInt(1, offset);
		
		ResultSet result = stm.executeQuery();
		
		while(result.next()) {
			Long id = result.getLong("id");
			String login = result.getString("login");
			
			list.add(new ModelLogin(id,login));
		}
		
		return list;
	}
	
	public List<ModelLogin> buscaLoginsnome(int offset,String nome) throws Exception{
		
		List<ModelLogin> list = new ArrayList<>();
		String sql = "select * from model_login where login like ? and admin = false offset ? limit 5";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, "%" + nome + "%");
		stm.setInt(2, offset);
		
		ResultSet result =  stm.executeQuery();
		
		while(result.next()) {
			Long id = result.getLong("id");
			String login = result.getString("login");
			
			list.add(new ModelLogin(id,login));
		}
		
		return list;
	}
	
	public boolean validarAutenticacao(ModelLogin modelLogin) throws Exception {

		String sql = "select * from model_login where login = ? and senha = ?";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, modelLogin.getLogin());
		statement.setString(2, modelLogin.getSenha());
		
		
		ResultSet resultado = statement.executeQuery();

		return resultado.next();
	}
	
	public boolean validarAdmincad(String login) throws Exception {
		
		String sql = "select login from model_login where login like ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, login);
		
		ResultSet resultado = statement.executeQuery();

		return !resultado.next();
	}
	
	public boolean validarAdmin(String login) throws Exception {
		
		String sql = "select admin from model_login where login = ?";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, login);
		
		ResultSet resultado = statement.executeQuery();

		resultado.next();
		
		return resultado.getBoolean("admin");		
	}
	
	public int[] quantidaadePaginas(String login) throws Exception {

		String sql = "select count(1) as total from model_login where login like ? and admin = false";

		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, "%" + login + "%");
		
		ResultSet resultado = stm.executeQuery();
		resultado.next();
		
		int totalFilme = Integer.parseInt(resultado.getString("total"));
		double pagina = totalFilme / 5.0;

		if ((pagina > 1 ? (pagina % 2) : 0) > 0) {
			pagina++;
		}

		return new int[] {totalFilme, (int) pagina};
	}
	
}
