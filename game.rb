require './player'
require './question'

class Game
  CORRECT_ANSWER_MSG = "YES! You are correct!"
  INCORRECT_ANSWER_MSG = "Seriously? No!"

  def play
    player_turn = true
    game_over = false
    player1 = Player.new("Player 1")
    player2 = Player.new("Player 2")

    while !game_over
      question = Question.new(rand(1..100), rand(1..100))

      if player_turn
        puts "#{player2.name}: #{question.question}"
        question.answer = gets.chomp.to_i
        if question.answered_correctly?
          puts "#{player2.name}: #{CORRECT_ANSWER_MSG}"
        else
          puts "#{player2.name}: #{INCORRECT_ANSWER_MSG}"
          player1.lives -= 1
        end

      else
        puts "#{player1.name}: #{question.question}"
        question.answer = gets.chomp.to_i
        if question.answered_correctly?
          puts "#{player1.name}: #{CORRECT_ANSWER_MSG}"
        else
          puts "#{player1.name}: #{INCORRECT_ANSWER_MSG}"
          player2.lives -= 1
        end
      end

      puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3"

      if player1.lives == 0
        puts "#{player2.name} wins with a score of #{player2.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
        game_over = true
        next
      elsif player2.lives == 0
        puts "#{player1.name} wins with a score of #{player1.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
        game_over = true
        next
      end

      player_turn = !player_turn
      puts "----- NEXT TURN -----"
    end
  end
end