class RemoveCardIdFromBoards < ActiveRecord::Migration[5.0]
  def change
    remove_column :boards, :card_id
  end
end
