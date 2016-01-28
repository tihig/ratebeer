class RatingsController < ApplicationController
  before_action :set_rating, only: [:show]
  def index
	@ratings = Rating.all
  end

  def show
	@ratings = Rating.to_s
  end
end
