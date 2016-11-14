class Board < ApplicationRecord
 belongs_to :user
 has_many :cards

 def self.order_by_title
   order(:title)
 end


end
