class HomeController < ApplicationController
  def index
    @users = User.all
    @tattoos = Tattoo.order('created_at DESC')
  end
end
