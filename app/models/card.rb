class Card < ApplicationRecord
  belongs_to :board

  def self.order_by_title
    order(:title)
  end

end
