class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: [ :show, :update ]

  def index
  end

  def create
    # Create a new game instance
    new_game = Game.create(score: 0, best_score: 0) # Initialize with default values
    redirect_to game_path(new_game.id) # Redirect to the show action for the new game
  end

  def show
    @game = Game.find(params[:id])
    @cards = Card.all.shuffle
    # puts "Cards loaded for game: #{@cards.inspect}" # Debugging line
  end

  def update
    if @game.update(game_params)
      render json: { success: true, game: @game }
    else
      render json: { success: false, errors: @game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def save_score
    game = Game.find(params[:id])
    current_score = params[:score].to_i

    if game.update(score: current_score, best_score: [ game.best_score, current_score ].max)
      render json: { success: true }
    else
      render json: { success: false, errors: game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def set_game
    @game = Game.find(params[:id]) # Find the game by ID
  end

  def game_params
    params.require(:game).permit(:score, :best_score)
  end
end
