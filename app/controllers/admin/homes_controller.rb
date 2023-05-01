class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @reviews = Review.all
  end
end
