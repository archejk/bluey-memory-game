class HomeController < ApplicationController
  def index
    @instructions = "Click on a card to earn points, but be careful—once you click a card, you can't click it again! Can you remember where your favorite characters are hidden?"
  end
end
