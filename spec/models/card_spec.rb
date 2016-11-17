require 'rails_helper'

RSpec.describe Card, type: :model do
  describe "validations" do
    it "is invalid without a title" do
      card = Card.new(title: "")
      card.valid?
      expect(card.errors).to have_key(:title)
    end
  end
end
