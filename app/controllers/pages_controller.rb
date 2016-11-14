class PagesController < ApplicationController
  def home
  end

  def new
    @board = current_user.boards.build
  end
end
