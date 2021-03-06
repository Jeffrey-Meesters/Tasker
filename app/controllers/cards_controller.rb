class CardsController < ApplicationController
before_action :set_board

  def index
    @cards = @board.cards.all
    #@card = Cards.new
    #@cards = @boards.cards.build

    @tasks = @cards.tasks.all
    @task = @bcard.tasks.new
  end

  def show
    @boards = current_user.boards.all
    @board = Board.find(params[:id])

    @cards = @board.cards.all
    @card = @board.cards.new
  end

  def new
    @card = current_user.boards.cards.build
  end

  def create
    card = @board.cards.build(card_params)

    if card.save
      render status: 200, json: {
        message: "Card successfully created",
        card: card
      }.to_json
    else
      render status: 422, json: {
        error: card.errors.full_messages
      }.to_json
    end
  end

  def destroy
    @card = Card.find(params[:id])

    @card.destroy

    redirect_to board_path
  end


  private

    def set_board
      @board = Board.find(params[:board_id])
    end

    def card_params
      params.require(:card).permit(:title)
    end
end
