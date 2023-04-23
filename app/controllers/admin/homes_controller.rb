class Admin::HomesController < ApplicationController
  def index
    @reviews = Review.all
  end
end
