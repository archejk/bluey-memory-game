class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [ :show ]
  before_action :set_game, only: [ :show, :update ]

  def index
  end

  def create
    @game = current_user.games.new(score: 0, best_score: 0) # initialize def scores

    if @game.save
      redirect_to game_path(@game)
    else
      render json: { success: false, errors: @game.errors.full_messages }, status: :unprocessable_entity
    end
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
    game = current_user.games.find(params[:id])
    current_score = params[:score].to_i

    if game.update(score: current_score, best_score: [ game.best_score, current_score ].max)
      render json: { success: true }
    else
      render json: { success: false, errors: game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def game_params
    params.require(:game).permit(:score, :best_score)
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
