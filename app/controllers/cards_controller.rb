class CardsController < ApplicationController
  def index
    @cards = current_user.boards.cards
  end

  def Show
    @card = current_user.boards.cards.find(cards_params)
  end

  def new
    @card = current_user.boards.cards.build
  end

  def create
    @card = current_user.boards.cards.build(card_params)

      if @board.save
        redirect_to @board, notice: "Card created"
      else
        render :new
      end
  end

  #NEED TO MAKE DESTROY OPTION

end
