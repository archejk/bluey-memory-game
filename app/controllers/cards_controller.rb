class CardsController < ApplicationController
  def index
    @cards = Card.all.shuffle
  end
end
