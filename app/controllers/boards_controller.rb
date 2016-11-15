class BoardsController < ApplicationController

  def index
    @boards = current_user.boards.all
  end

  def show
    @board = Board.find(params[:id])
    @cards = @board.cards.build
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)

      if @board.save
        redirect_to boards_path, notice: "Board created"
      else
        render :new
      end
  end


  def destroy
    @board = Board.find(params[:id])

    @board.destroy

    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:title)
  end

  def card_params
    params.require(:card).permit(:title, :board_id )
  end

end
