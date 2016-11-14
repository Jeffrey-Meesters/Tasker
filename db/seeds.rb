# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jeffrey = User.create(email: "test@test.com", password:"123456")

board1 = Board.create(title: "Board 1", favorite: false, user: jeffrey),
board2 = Board.create(title: "Board 2", favorite: false, user: jeffrey),
board3 = Board.create(title: "Board 3", favorite: false, user: jeffrey)

card1 = Card.create(title: "DO", board_id: board1)
card2 = Card.create(title: "Doing", board_id: board1)
card3 = Card.create(title: "done", board_id: board1)
