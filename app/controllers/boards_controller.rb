class BoardsController < ApplicationController

  def index
    @boards = current_user.boards
  end

  def Show
    @board = current_user.boards.find(board_params)
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)

      if @board.save
        redirect_to @board, notice: "Board created"
      else
        render :new
      end
  end

  #NEED TO MAKE DESTROY OPTION

end
