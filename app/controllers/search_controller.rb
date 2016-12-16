class SearchController < ApplicationController

  def index
  end

  def create
    @new_search = Search.create(words: params[:search], user_id: current_user.id)

    @find_search = params[:search][:words]
    @find_search.delete('#').downcase
    redirect_to featured_index_path(pg_name: @find_search)
  end
end
