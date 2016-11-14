class CardsController < ApplicationController
  def index
    @cards = current_user.boards.cards
  end

  def Show
    @card = Cards.find(cards_params)
  end

  def new
    @card = current_user.boards.cards.build
  end

  def create
    @card = current_user.boards.cards.build(card_params)

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
    params.require(:card).permit(:title)
  end

end
