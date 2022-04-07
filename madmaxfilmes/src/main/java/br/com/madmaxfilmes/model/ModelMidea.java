package br.com.madmaxfilmes.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ModelMidea implements Serializable {

	private static final long serialVersionUID = 1L;

	protected Long id;
	protected String nome;
	protected Float imdb;
	protected int ano;
	protected String time;
	protected String foto;
	protected String sinopse;
	protected String audio;
	protected List<ModelCategorias> categorias = new ArrayList<>();

	public ModelMidea() {

	}

	public ModelMidea(Long id, String nome, Float imdb, int ano, String time, String foto, String sinopse, String audio,
			List<ModelCategorias> categorias) {
		this.id = id;
		this.nome = nome;
		this.imdb = imdb;
		this.ano = ano;
		this.time = time;
		this.foto = foto;
		this.sinopse = sinopse;
		this.audio = audio;
		this.categorias = categorias;
	}

	public ModelMidea(Long id, String nome, Float imdb, int ano, String time, String sinopse, String audio,
			List<ModelCategorias> categorias) {
		this.id = id;
		this.nome = nome;
		this.imdb = imdb;
		this.ano = ano;
		this.time = time;
		this.sinopse = sinopse;
		this.audio = audio;
		this.categorias = categorias;
	}

	public ModelMidea(String nome, Float imdb, int ano, String time, String foto, String sinopse, String audio,
			List<ModelCategorias> categorias) {
		this.nome = nome;
		this.imdb = imdb;
		this.ano = ano;
		this.time = time;
		this.foto = foto;
		this.sinopse = sinopse;
		this.audio = audio;
		this.categorias = categorias;
	}

	public ModelMidea(Long id, String nome, Float imdb, int ano, String foto, List<ModelCategorias> categorias) {
		this.id = id;
		this.nome = nome;
		this.imdb = imdb;
		this.ano = ano;
		this.foto = foto;
		this.categorias = categorias;
	}

	public ModelMidea(Long id, String nome, Float imdb, String foto) {
		this.id = id;
		this.nome = nome;
		this.imdb = imdb;
		this.foto = foto;
	}

	public ModelMidea(Long id, String nome, Float imdb, int ano, String foto, String sinopse) {
		this.id = id;
		this.nome = nome;
		this.imdb = imdb;
		this.ano = ano;
		this.foto = foto;
		this.sinopse = sinopse;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public List<ModelCategorias> getCategorias() {
		return categorias;
	}

	public void setCategorias(List<ModelCategorias> categorias) {
		this.categorias = categorias;
	}

	public String getCategiraDB() {
		String aux = "";
		for (ModelCategorias modelCategorias : categorias) {
			aux += modelCategorias + " ";
		}
		return aux.strip();
	}

}
