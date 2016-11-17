class BoardsController < ApplicationController
before_action :set_board, only: [:show, :edit, :update]
before_action :set_card, only: [:show, :edit, :update]

  def index
    @boards = current_user.boards.all
    @board = Board.new
  end

  def show
    @boards = current_user.boards.all
    @board = Board.find(params[:id])

    @cards = @board.cards.all
    @card = @board.cards.new
  end

  def create
    board = current_user.boards.build(board_params)

    if board.save
      render status: 200, json: {
        message: "Board successfully created",
        board: board
      }.to_json
    else
      render status: 422, json: {
        error: board.errors.full_messages
      }.to_json
    end
  end

  def update
  if @board.update(board_params)
    redirect_to @boards, notice: "board successfully updated"
  else
    render :edit
  end
end


  private

  def set_board
    @board = Board.find(params[:id])
  end

  def set_card
    @board = Board.find(params[:id])
    @card = @board.cards(:card_id)
  end

  def card_params
    params.require(:card).permit(:title, :board_id)
  end

  def board_params
    params.require(:board).permit(:title)
  end

end
