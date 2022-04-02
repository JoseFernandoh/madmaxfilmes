package br.com.madmaxfilmes.model;

import java.io.Serializable;

public class ModelFilme implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String nome;
	private Float imdb;
	private int ano;
	private String time;
	private String foto;
	
	public ModelFilme(Long id, String nome, Float imdb, int ano, String time, String foto) {
		this.id = id;
		this.nome = nome;
		this.imdb = imdb;
		this.ano = ano;
		this.time = time;
		this.foto = foto;
	}
	
	public ModelFilme(String nome, Float imdb, int ano, String time, String foto) {
		this.nome = nome;
		this.imdb = imdb;
		this.ano = ano;
		this.time = time;
		this.foto = foto;
	}
	
	public ModelFilme(String nome, Float imdb, String foto) {
		this.nome = nome;
		this.imdb = imdb;
		this.foto = foto;
	}
	
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Float getImdb() {
		return imdb;
	}
	public void setImdb(Float imdb) {
		this.imdb = imdb;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	
	
}
