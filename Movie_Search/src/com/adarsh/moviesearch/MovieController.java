package com.adarsh.moviesearch;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class MovieController {

	@RequestMapping("/")
	public String ShowHome(Model model) {
		model.addAttribute("movie", new Movie());

		return "Home";
		
	}
	
	@RequestMapping("/search")
	public String searchMovie(@ModelAttribute("movie")@Valid Movie movie,BindingResult result, Model model){
		
		
		if(result.hasErrors()){
			model.addAttribute("status", "FAILED");
			return "Home";
		}
		else{
			System.out.println("This is movie name"+movie.getMovieName());
			String url = "http://www.omdbapi.com/?apikey=dcb72d29&&s="+movie.getMovieName();
			RestTemplate rt = new RestTemplate();
			String json = rt.getForObject(url, String.class);
			//System.out.println(json);
			Gson gson = new GsonBuilder().create();
			Search search = gson.fromJson(json, Search.class);
			List<Search_> movieList = search.getSearch();
			
			//System.out.println("List of movies found"+movieList);
			
			if(movieList!=null && movieList.size()>0){
				model.addAttribute("movielist",movieList);
				model.addAttribute("message","results found");
				
				return "MovieList";
			}
			
			else{
				model.addAttribute("message","No results found! Please try other Name");
				return "Home";
				
			}
			
			
		}
		
			
	
		
	}

}
