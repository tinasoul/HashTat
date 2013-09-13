class SearchController < ApplicationController

  def search
    @search = Sunspot.search(Tattoo) do
      keywords params[:q] do
        minimum_match 1
      end
      paginate :page => params[:page], :per_page => params[:per_page]
    end
  end
end


