package br.com.madmaxfilmes.model;

import java.io.Serializable;
import java.util.List;

public class ModelFilme extends ModelMidea implements Serializable {

	private static final long serialVersionUID = 1L;

	
	private String urlVideo;
	private String linkPagina;
	
	
	
	public ModelFilme(Long id, String nome, Float imdb, int ano, String time, String foto, String sinopse, String audio,
			String urlVideo, List<ModelCategorias> categorias) {
		super(id, nome, imdb, ano, time, foto, sinopse, audio, categorias);
		this.urlVideo = urlVideo;
		
	}
	
	public ModelFilme(Long id, String nome, Float imdb, int ano, String time, String sinopse, String audio,
			String urlVideo, List<ModelCategorias> categorias) {
		super(id, nome, imdb, ano, time, sinopse, audio, categorias);
		
		this.urlVideo = urlVideo;
	}

	public ModelFilme(String nome, Float imdb, int ano, String time, String foto, String sinopse, String audio,
			String urlVideo, List<ModelCategorias> categorias) {
		super(nome, imdb, ano, time, foto, sinopse, audio, categorias);
	}

	public ModelFilme(Long id,String nome, Float imdb, int ano, String foto, List<ModelCategorias> categorias) {
		super(id,nome,imdb,ano,foto,categorias);
		this.linkPagina = "/ServletPaginaFilme?id="+id;
	}
	
	

	public ModelFilme(Long id,String nome, Float imdb, String foto) {
		super(id,nome,imdb,foto);
		this.linkPagina = "/ServletPaginaFilme?id="+id;
	}
	
	public ModelFilme(Long id, String nome, Float imdb, int ano, String foto, String sinopse) {
		super(id,nome,imdb,ano,foto,sinopse);
		this.linkPagina = "/ServletPaginaFilme?id="+id;
	}

	public String getUrlVideo() {
		return urlVideo;
	}

	public void setUrlVideo(String urlVideo) {
		this.urlVideo = urlVideo;
	}
	
	public String getLinkPagina() {
		return linkPagina;
	}
}
