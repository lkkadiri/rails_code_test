class SearchesController < ApplicationController
  before_filter :authorize

  def new
    @search = Search.new
  end

  def create
    @search = Search.find_or_create_by_query(params[:search])
    unless @search.users.include? current_user
      @search.users << current_user
    end
    render :results
  end

  alias :update :create

  def show
    @search = Search.find(params[:id])
    render :results
  end

end
