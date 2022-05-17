package br.com.madmaxfilmes.model.serie;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Temporada implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String nome;
	private List<Episodio> episodios = new ArrayList<>();
	
	public Temporada(Long id, String nome, List<Episodio> episodios) {
		this.id = id;
		this.nome = nome;
		this.episodios = episodios;
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
	public List<Episodio> getEpisodios() {
		return episodios;
	}
	public void setEpisodios(List<Episodio> episodios) {
		this.episodios = episodios;
	}
	
	
	

}
