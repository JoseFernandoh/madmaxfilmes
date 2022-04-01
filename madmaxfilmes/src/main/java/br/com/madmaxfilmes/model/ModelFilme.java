package br.com.madmaxfilmes.model;

public class ModelFilme {

	private String nome;
	private float imdb;
	private int ano;
	private String time;
	private String foto;
	
	public ModelFilme(String nome, float imdb, int ano, String time, String foto) {
		this.nome = nome;
		this.imdb = imdb;
		this.ano = ano;
		this.time = time;
		this.foto = foto;
	}
	
	public ModelFilme(String nome, float imdb, String foto) {
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
	public float getImdb() {
		return imdb;
	}
	public void setImdb(int imdb) {
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
	
	
	
}
