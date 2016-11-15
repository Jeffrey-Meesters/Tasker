class CardsController < ApplicationController
before_action :set_board

  def index
    @card = Cards.new
    @cards = @board.cards
    #@cards = @boards.cards.build
  end

  def show
    @card = current_user.boards.cards.find(cards_params)
    @card = Cards.find(cards_params)
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

  private

    def set_board
      @board = Board.find(params[:board_id])
    end

    def card_params
      params.require(:card).permit(:title)
    end
end
