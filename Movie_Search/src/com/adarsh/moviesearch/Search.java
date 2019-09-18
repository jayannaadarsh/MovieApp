package com.adarsh.moviesearch;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Search {

@SerializedName("Search")
@Expose
private List<Search_> search = null;
@SerializedName("totalResults")
@Expose
private String totalResults;
@SerializedName("Response")
@Expose
private String response;

public List<Search_> getSearch() {
return search;
}

public void setSearch(List<Search_> search) {
this.search = search;
}

public String getTotalResults() {
return totalResults;
}

public void setTotalResults(String totalResults) {
this.totalResults = totalResults;
}

public String getResponse() {
return response;
}

public void setResponse(String response) {
this.response = response;
}

@Override
public String toString() {
	return "Search [search=" + search + ", totalResults=" + totalResults + ", response=" + response + "]";
}

}