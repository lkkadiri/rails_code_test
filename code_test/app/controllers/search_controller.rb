class SearchController < ApplicationController
  caches_page :index
  def index
    # @results = Google::search("leela")
    cache = ActiveSupport::Cache::MemoryStore.new
    if params[:q].to_s.match(/^google:/)
      query = params[:q].split(":")
      @results_goog = RestClient.get getURL("google", query[1])
    elsif params[:q].to_s.match(/^ragnarok:/) 
      query = params[:q].split(":")
      @results_twit = RestClient.get getURL("twitter",query[1])
    else
      @results_goog = RestClient.get getURL("google", params[:q])
      @results_twit = RestClient.get getURL("twitter", params[:q])
    end
    
    @results_goog = ActiveSupport::JSON.decode(@results_goog)
    @results_twit = ActiveSupport::JSON.decode(@results_twit)

    respond_to do |format|
          format.html # index.html.erb
          
          format.json  { render :json => { :google => @results_goog, :twitter => @results_twit } }
    end
  end
  def getURL(type, query)
    if(type == "google")
      url = "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=#{query}"
    elsif type=="twitter"
      url = "http://search.twitter.com/search.json?q=#{query}"
    end
    return url
  end
end
