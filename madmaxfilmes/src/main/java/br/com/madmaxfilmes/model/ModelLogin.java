package br.com.madmaxfilmes.model;

import java.io.Serializable;

public class ModelLogin implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String login;
	private String senha;
	
	public ModelLogin(Long id, String login) {
		this.id = id;
		this.login = login;
	}


	public ModelLogin(String login, String senha) {
		this.login = login;
		this.senha = senha;
	}
	
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	

}
