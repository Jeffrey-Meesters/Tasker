class Board < ApplicationRecord
 belongs_to :user
 has_many :cards

 validates_presence_of :title


 def self.order_by_title
   order(:title)
 end

end
