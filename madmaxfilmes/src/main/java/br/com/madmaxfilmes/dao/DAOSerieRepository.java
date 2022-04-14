package br.com.madmaxfilmes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.madmaxfilmes.connection.SingleConnectionBanco;
import br.com.madmaxfilmes.model.ModelCategorias;
import br.com.madmaxfilmes.model.ModelFilme;
import br.com.madmaxfilmes.model.ModelSerie;
import br.com.madmaxfilmes.model.serie.Episodio;
import br.com.madmaxfilmes.model.serie.Temporada;

public class DAOSerieRepository {
	
	private Connection connection;

	public DAOSerieRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public void gravarSerie(ModelSerie serie)throws Exception {
		String sql = "INSERT INTO public.serie(nome, imdb, ano, tempo, foto, sinopse, audio, genero) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, serie.getNome());
		stm.setString(2, serie.getImdb()+"");
		stm.setString(3, serie.getAno()+"");
		stm.setString(4, serie.getTime());
		stm.setString(5, serie.getFoto());
		stm.setString(6, serie.getSinopse());
		stm.setString(7, serie.getAudio());
		stm.setString(8, serie.getCategiraDB());
		
		stm.execute();
		connection.commit();
	}
	
	public void atualizarSerie(ModelSerie serie) throws Exception {
		String sql = "update serie set nome=?, imdb=?, ano=?, tempo=?, sinopse=?, audio=?, genero=? where id = ?";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, serie.getNome());
		stm.setString(2, serie.getImdb()+"");
		stm.setString(3, serie.getAno()+"");
		stm.setString(4, serie.getTime());
		stm.setString(5, serie.getSinopse());
		stm.setString(6, serie.getAudio());
		stm.setString(7, serie.getCategiraDB());
		stm.setLong(8, serie.getId());
		
		stm.execute();
		connection.commit();
		
	}
	
	public void atualizarCapaSerie(Long id, String foto) throws Exception {
		String sql = "update serie set foto=? where id = ?";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, foto);
		stm.setLong(2, id);
		
		stm.execute();
		connection.commit();
		
	}
	
	public void criarTemporada(String nome, Long idSerie) throws Exception {
		String sql = "insert into temporada (nome,id_serie) values (?,?)";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, nome);
		stm.setLong(2, idSerie);
		
		stm.execute();
		connection.commit();
		
	}
	
	public void adicionarEpisodio(String nome, String urlVideo, Long idTemporada) throws Exception {
		
		String sql = "insert into episodio (nome,urlvideo,id_temporada) values (?,?,?)";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, nome);
		stm.setString(2, urlVideo);
		stm.setLong(3, idTemporada);
		
		stm.execute();
		connection.commit();
	}
	
	public void atualizarEpisodio(String urlvideo, Long id)throws Exception {
		
		String sql = "update episodio set urlvideo = ? where id = ?";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, urlvideo);
		stm.setLong(2, id);
		
		stm.execute();
		connection.commit();
	}
	
	public void deletarTemporada(Long id)throws Exception{
		
		String sql = "delete from temporada where id = ?";
		
		deletarEpisodio(id);
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setLong(1, id);
		
		stm.execute();
		connection.commit();
		
	}
	
	public void deletarEpisodio(Long id_Temporada) throws Exception{
		
		String sql = "delete from episodio where id_temporada = ?";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setLong(1, id_Temporada);
		
		stm.execute();
		connection.commit();
		
	}
	
	public void deletarEpisodioid(Long id) throws Exception {
		
		String sql = "delete from episodio where id = ?";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setLong(1, id);
		
		stm.execute();
		connection.commit();
	}
	
	
	public ModelSerie buscarSerieId(Long idbusca) throws Exception{
		ModelSerie serie = null;
		
		String sql = "select * from serie where id = ?";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setLong(1, idbusca);
		
		ResultSet result = stm.executeQuery();
		
		while(result.next()) {
			Long id = result.getLong("id");
			String nome = result.getString("nome");
			Float imdb = Float.valueOf(result.getString("imdb"));
			Integer ano = Integer.valueOf(result.getString("ano"));
			String tempo = result.getString("tempo");
			String foto = result.getString("foto");
			String sinopse = result.getString("sinopse");
			String audio = result.getString("audio");
			List<ModelCategorias> categorias = new ArrayList<>();
			for(String aux : result.getString("genero").split(" ")) {
				categorias.add(ModelCategorias.valueOf(aux));
			}
			
			serie = new ModelSerie(id,nome,imdb,ano,tempo,foto,sinopse,audio,categorias,buscarTemporada(id));
			
		}
		
		return serie;
	}
	
	public List<Temporada> buscarTemporada(Long idSerie) throws Exception{
		List<Temporada> temporadas = new ArrayList<>();
		
		String sql = "select * from temporada where id_serie = ? order by nome";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setLong(1, idSerie);
		
		ResultSet result = stm.executeQuery();
		
		while(result.next()) {
			Long id = result.getLong("id");
			String nome = result.getString("nome");
			
			temporadas.add(new Temporada(id,nome,buscarEpisodio(id)));
		}
		
		return temporadas;
	}
	
	public List<Episodio> buscarEpisodio(Long idtemporada)throws Exception{
		List<Episodio> episodios = new ArrayList<>();
		
		String sql = "select * from episodio where id_temporada = ? order by nome";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setLong(1, idtemporada);
		
		ResultSet result = stm.executeQuery();
		
		while(result.next()) {
			
			Long id = result.getLong("id");
			String nome = result.getString("nome");
			String urlVideo = result.getString("urlvideo");
			episodios.add(new Episodio(id,nome,urlVideo));
		}
		
		return episodios;
	}
		
	public List<ModelFilme> buscarListaNome(String nomeBusca, Integer limit, Integer offset) throws Exception{
		
		List<ModelFilme> retorno = new ArrayList<>();
		String sql = "select id,nome,foto,sinopse,ano,imdb from serie where upper(nome) like upper(?) order by ano desc offset ? limit ?";
		
		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, "%" + nomeBusca + "%");
		stm.setInt(2, offset);
		stm.setInt(3, limit);
		
		ResultSet result = stm.executeQuery();
		
		while(result.next()) {
			
			Long id = result.getLong("id");
			String nome = result.getString("nome");
			String foto = result.getString("foto");
			String sinopse = result.getString("sinopse");
			int ano = Integer.valueOf(result.getString("ano"));
			float imdb = Float.valueOf(result.getString("imdb"));
		
			retorno.add(new ModelFilme(id, nome, imdb, ano, foto, sinopse));
			
		}
		
		return retorno;
	}
	
	public List<ModelSerie> subListas(int opcao) throws Exception{
		
		List<ModelSerie> retorno = new ArrayList<>();
		String sql = opcao == 1 ? "select id,nome,foto,imdb from serie order by ano desc limit 15" 
								: "select id,nome,foto,imdb from serie order by imdb desc limit 15";
		
		ResultSet result = connection.createStatement().executeQuery(sql);
		
		while(result.next()) {
			
			Long id = result.getLong("id");
			String nome = result.getString("nome");
			String foto = result.getString("foto");
			float imdb = Float.valueOf(result.getString("imdb"));
			
			retorno.add(new ModelSerie(id, nome, imdb, foto));
			
		}
		
		return retorno;
	}
	
	public int[] quantidaadePaginas(int items, String nomeBusca) throws Exception {

		String sql = "select count(1) as total from serie where upper(nome) like upper(?)";

		PreparedStatement stm = connection.prepareStatement(sql);
		stm.setString(1, "%" + nomeBusca + "%");
		
		ResultSet resultado = stm.executeQuery();
		resultado.next();
		
		int totalFilme = Integer.valueOf(resultado.getString("total"));
		Double pagina = totalFilme / Double.valueOf(items);

		if (pagina % 2 > 0) {
			pagina++;
		}

		return new int[] {totalFilme, pagina.intValue()};
	}
	
}
