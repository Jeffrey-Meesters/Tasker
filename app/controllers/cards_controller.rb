class CardsController < ApplicationController

    def index
      @cards = current_user.boards.cards
      @card = Card.new
    end

    def show
      @card = Card.find(params[:id])
    end

    def new
      @card = current_user.boards.cards.build
    end

    def create
      @card = current_user.boards.cards.new

        if @card.save
          redirect_to board_path, notice: "Board created"
        else
          render :new
        end
    end


    def destroy
      @card = Card.find(params[:id])

      @card.destroy

      redirect_to board_path
    end

    private

    def card_params
      params.require(:title).permit(:title)
    end

end
