require 'rails_helper'

RSpec.describe Board, type: :model do
  describe "validations" do
    it "is invalid without a title" do
      board = Board.new(title: "")
      board.valid?
      expect(board.errors).to have_key(:title)
    end
  end

  describe "association with user" do
  let(:user) { create :user }

  it "belongs to a user" do
    board = user.boards.new(title: "board1")

    expect(board.user).to eq(user)
  end
end

end
