package br.com.madmaxfilmes.model.serie;

import java.io.Serializable;

public class Episodio implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private String nome;
	private String urlVideo;
	
	public Episodio(Long id, String nome, String urlVideo) {
		this.id = id;
		this.nome = nome;
		this.urlVideo = urlVideo;
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
	public String getUrlVideo() {
		return urlVideo;
	}
	public void setUrlVideo(String urlVideo) {
		this.urlVideo = urlVideo;
	}
	
	
}
