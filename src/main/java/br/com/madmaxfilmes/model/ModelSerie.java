package br.com.madmaxfilmes.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import br.com.madmaxfilmes.model.serie.Temporada;

public class ModelSerie extends ModelMidea implements Serializable {

	private static final long serialVersionUID = 1L;

	private List<Temporada> temporadas = new ArrayList<>();
	
	
	
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

	public ModelSerie(Long id, String nome, Float imdb, int ano, String foto, String sinopse) {
		super(id,nome,imdb,ano,foto,sinopse);
		super.setLinkPagina("/ServletPaginaSerie?id="+id);
	}
	
	public ModelSerie(Long id,String nome, Float imdb, String foto) {
		super(id,nome,imdb,foto);
		super.setLinkPagina("/ServletPaginaSerie?id="+id);
	}
	
	public ModelSerie(Long id,String nome, Float imdb, int ano, String foto, List<ModelCategorias> categorias) {
		super(id,nome,imdb,ano,foto,categorias);
		super.setLinkPagina("/ServletPaginaSerie?id="+id);
	}


	public List<Temporada> getTemporadas() {
		return temporadas;
	}
	public void setTemporadas(List<Temporada> temporadas) {
		this.temporadas = temporadas;
	}

	
	
	
}
