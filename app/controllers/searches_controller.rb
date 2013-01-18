class SearchesController < ApplicationController
  before_filter :authorize

  def new
    @search = Search.new
  end

  def create
    @search = current_user.searches.find_or_create_by_query(params[:search])
    @google_results = @search.google_search
    @twitter_results = @search.twitter_search
    @search_results = @google_results + @twitter_results
    # Interleave the two sets of results together
    #@google_results.each_with_index { |x,i| @search_results << x << @twitter_results[i]}
    #binding.pry
    render :results
  end

  alias :update :create

  def show
    @search = Search.find(params[:id])
    render :results
  end

end
