class BoardsController < ApplicationController

  def index
    @boards = current_user.boards
    @board = Board.new
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.new(board_params)

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

end
