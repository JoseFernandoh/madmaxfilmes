package br.com.madmaxfilmes.testDadosController;

import java.util.ArrayList;
import java.util.List;


import br.com.madmaxfilmes.model.ModelFilme;

public class ControllerFIlmes {

	public static List<ModelFilme> listFilmeSlider1(){
		List<ModelFilme> result = new ArrayList<>();
		
		result.add(new ModelFilme("interstellar", 7.4f, 2020, "Run Time: 1h21", "images/uploads/mv-it1.jpg"));
		result.add(new ModelFilme("the revenant", 7.4f, 2021, "Run Time: 1h30", "images/uploads/mv-it2.jpg"));
		result.add(new ModelFilme("the walk", 9.4f, 2020, "Run Time: 2h30", "images/uploads/mv-it4.jpg"));
		result.add(new ModelFilme("die hard", 9.4f, 2021, "Run Time: 1h30", "images/uploads/mv-it5.jpg"));
		
		return result;
	}
	
	public static List<ModelFilme> listFilmeSlider2(){
		List<ModelFilme> result = new ArrayList<>();
		
		result.add(new ModelFilme("interstellar", 8.3f, "images/uploads/mv-it1.jpg"));
		result.add(new ModelFilme("the revenant", 5.3f, "images/uploads/mv-it2.jpg"));
		result.add(new ModelFilme("the hard", 9.6f, "images/uploads/mv-it3.jpg"));
		result.add(new ModelFilme("die hard", 8.3f, "images/uploads/mv-it5.jpg"));
		result.add(new ModelFilme("the beginning", 5.3f, "images/uploads/mv-it6.jpg"));
		result.add(new ModelFilme("the end", 6.3f, "images/uploads/mv-it7.jpg"));
		result.add(new ModelFilme("after", 8.8f, "images/uploads/mv-it8.jpg"));
		result.add(new ModelFilme("demon", 8.1f, "images/uploads/mv-it4.jpg"));
		result.add(new ModelFilme("after the end", 7.0f, "images/uploads/mv-it9.jpg"));
		result.add(new ModelFilme("charlotte", 6.3f, "images/uploads/mv-it4.jpg"));
		result.add(new ModelFilme("slayer", 8.3f, "images/uploads/mv-it3.jpg"));
		result.add(new ModelFilme("after 2", 8.3f, "images/uploads/mv-it2.jpg"));
		
		return result;
	}
	
	public static List<ModelFilme> listFilmeSlider3(){
		List<ModelFilme> result = new ArrayList<>();
		
		result.add(new ModelFilme("interstellar", 8.3f, "images/uploads/mv-item1.jpg"));
		result.add(new ModelFilme("the revenant", 5.3f, "images/uploads/mv-item2.jpg"));
		result.add(new ModelFilme("the hard", 9.6f, "images/uploads/mv-item3.jpg"));
		result.add(new ModelFilme("die hard", 8.3f, "images/uploads/mv-item5.jpg"));
		result.add(new ModelFilme("the beginning", 5.3f, "images/uploads/mv-item6.jpg"));
		result.add(new ModelFilme("the end", 6.3f, "images/uploads/mv-item7.jpg"));
		result.add(new ModelFilme("after", 8.8f, "images/uploads/mv-item8.jpg"));
		result.add(new ModelFilme("demon", 8.1f, "images/uploads/mv-item4.jpg"));
		result.add(new ModelFilme("after the end", 7.0f, "images/uploads/mv-item9.jpg"));
		result.add(new ModelFilme("charlotte", 6.3f, "images/uploads/mv-item4.jpg"));
		result.add(new ModelFilme("slayer", 8.3f, "images/uploads/mv-item3.jpg"));
		result.add(new ModelFilme("the har 2", 7.5f, "images/uploads/mv-item2.jpg"));
		result.add(new ModelFilme("the beginning 2", 5.3f, "images/uploads/mv-item10.jpg"));
		result.add(new ModelFilme("last human 2", 7.3f, "images/uploads/mv-item11.jpg"));
		result.add(new ModelFilme("interstellar 2", 9.3f, "images/uploads/mv-item12.jpg"));

		
		return result;
	}
	
}
