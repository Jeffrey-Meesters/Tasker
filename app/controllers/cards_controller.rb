class CardsController < ApplicationController
  def index
    @board = Boards.find(params[:boards_id])
    @cards = @board.cards
  end

  def Show
    @card = Cards.find(cards_params)
  end

  def new
    @board = @boards.find(params[:id])
    @card = board.cards.new(cards_params)
  end

  def create
    @card = current_user.boards.cards.new(card_params)

      if @card.save
        redirect_to board_cards_path, notice: "Card created"
      else
        render :new
      end
  end

  def destroy
    @card = Card.find(params[:id])

    @Card.destroy

    redirect_to boards_path
  end

  private

  def card_params
    params.require(:board).permit(:title, :board_id)
  end

end
