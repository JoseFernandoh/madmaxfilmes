package br.com.madmaxfilmes.model;

public enum ModelCategorias {
	
	ACAO("Açao" , "yell"),
	AVENTURA("Aventura", "orange"),
	COMEDIA("Comédia", "red"),
	DOCUMENTARIO("Documentário", "red"),
	DRAMA("Drama", "red"),
	FANTASIA("Fantasia", "red"),
	MISTERIO("Mistério", "red"),
	FICCAO_CIENTIFICA("Sci-fi", "blue"),
	ROMACE("Romance", "red"),
	TERRO("Terror", "red"),
	MUSICAL("Musical", "red"),
	CLASSICO("Clássico", "red"),
	GUERRA("Guerra", "red"),
	NACIONAL("Nacional", "red"),
	ANIMACAO("Animação", "red"),
	ANIME("Anime", "red"),
	FAROESTE("Faroeste", "red"),
	CRIME("Crime", "red"),
	FAMILIA("Familia", "red"),
	SUSENSE("Suspense", "red");
	
	
	
	String nome;
	String cor;
	ModelCategorias(String nome, String cor) {
		this.nome = nome;
		this.cor = cor;
	}
	
	public String getNome() {
		return nome;
	}
	
	public String getCor() {
		return cor;
	}
	
}
