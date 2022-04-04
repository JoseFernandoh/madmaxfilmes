package br.com.madmaxfilmes.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ModelFilme implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private String nome;
	private Float imdb;
	private int ano;
	private String time;
	private String foto;
	private String sinopse;
	private String audio;
	private String urlVideo;
	private List<ModelCategorias> categorias = new ArrayList<>();
	
	private String linkPagina;
	
	
	
	public ModelFilme(Long id, String nome, Float imdb, int ano, String time, String foto, String sinopse, String audio,
			String urlVideo, List<ModelCategorias> categorias) {
		this.id = id;
		this.nome = nome;
		this.imdb = imdb;
		this.ano = ano;
		this.time = time;
		this.foto = foto;
		this.sinopse = sinopse;
		this.audio = audio;
		this.urlVideo = urlVideo;
		this.categorias = categorias;
	}

	public ModelFilme(String nome, Float imdb, int ano, String time, String foto, String sinopse, String audio,
			String urlVideo, List<ModelCategorias> categorias) {
		this.nome = nome;
		this.imdb = imdb;
		this.ano = ano;
		this.time = time;
		this.foto = foto;
		this.sinopse = sinopse;
		this.audio = audio;
		this.urlVideo = urlVideo;
		this.categorias = categorias;
	}

	public ModelFilme(Long id,String nome, Float imdb, int ano, String foto, List<ModelCategorias> categorias) {
		this.id = id;
		this.nome = nome;
		this.imdb = imdb;
		this.ano = ano;
		this.foto = foto;
		this.categorias = categorias;
		this.linkPagina = "/ServletPaginaFilme?id="+id;
	}

	public ModelFilme(Long id,String nome, Float imdb, String foto) {
		this.id = id;
		this.nome = nome;
		this.imdb = imdb;
		this.foto = foto;
		this.linkPagina = "/ServletPaginaFilme?id="+id;
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

	public String getSinopse() {
		return sinopse;
	}

	public void setSinopse(String sinopse) {
		this.sinopse = sinopse;
	}

	public String getAudio() {
		return audio;
	}

	public void setAudio(String audio) {
		this.audio = audio;
	}

	public String getUrlVideo() {
		return urlVideo;
	}

	public void setUrlVideo(String urlVideo) {
		this.urlVideo = urlVideo;
	}

	public List<ModelCategorias> getCategorias() {
		return categorias;
	}

	public void setCategorias(List<ModelCategorias> categorias) {
		this.categorias = categorias;
	}
	
	public String getCategiraDB() {
		String aux = "";
		for (ModelCategorias modelCategorias : categorias) {
			aux += modelCategorias+" ";
		}
		return aux.strip();
	}
	
	public String getLinkPagina() {
		return linkPagina;
	}
}
