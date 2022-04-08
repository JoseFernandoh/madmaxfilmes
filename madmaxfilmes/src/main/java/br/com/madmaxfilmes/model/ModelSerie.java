package br.com.madmaxfilmes.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import br.com.madmaxfilmes.model.serie.Temporada;

public class ModelSerie extends ModelMidea implements Serializable {

	private static final long serialVersionUID = 1L;

	private List<Temporada> temporadas = new ArrayList<>();
	private String linkPagina;
	
	
	public ModelSerie(String nome, float imdb, int ano, String time, String path, String sinopse, String audio,
			List<ModelCategorias> categorias) {
		super(nome,imdb,ano,time,path,sinopse,audio,categorias);
	}
	
	public ModelSerie(Long id, String nome, Float imdb, Integer ano, String tempo, String foto, String sinopse,
			String audio, List<ModelCategorias> categorias, List<Temporada> temporadas) {
		super(id,nome,imdb,ano,tempo,foto,sinopse,audio,categorias);
		this.temporadas = temporadas;
	}

	public ModelSerie(Long id, String nome, float imdb, int ano, String time, String sinopse, String audio,
			List<ModelCategorias> categorias) {
		super(id,nome,imdb,ano,time,sinopse,audio,categorias);
	}

	public List<Temporada> getTemporadas() {
		return temporadas;
	}
	public void setTemporadas(List<Temporada> temporadas) {
		this.temporadas = temporadas;
	}
	public String getLinkPagina() {
		return linkPagina;
	}
	public void setLinkPagina(String linkPagina) {
		this.linkPagina = linkPagina;
	}
	
	
	
}
