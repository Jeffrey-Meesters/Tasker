class AddCardToBoards < ActiveRecord::Migration[5.0]
  def change
    add_reference :boards, :card, foreign_key: true
  end
end
