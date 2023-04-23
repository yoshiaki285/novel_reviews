class User::HomesController < ApplicationController
  def index
    @reviews = Review.all
  end
end
