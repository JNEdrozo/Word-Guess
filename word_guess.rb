#This is the word-guess project

class Game
  attr_reader :level

  def initialize

  end

  def level
    "What level would you like to play at?"
  end

end #of class Game

#
class Card

  def initialize(word)
    @word = word
    @guess = nil #guess is the variable to store user input
    @guess_type = "invalid"
  end

  def get_guess
    puts "What would you like to guess?"
    @guess = gets.chomp
  end

   #guess types: actual word, a letter, or invalid(guessing too many letters, guessing a number)
  def get_guess_type
    if @guess.length.to_i == @word.length.to_i
      return @guess

    end
  end

end #of class Card

class AsciiArt

  def initialize
  end

end #of class AsciiArt


#START OF GAME____________

introduction = <<YES Welcome to Word Guess! You will be shown a series of blanks.  Each blank represents a letter in the word that you will be guessing! You will be allowed to guess a single letter, or the whole word at once on each of your turns. Just type in your guess and go! Good luck!


YES


puts introduction

game = Game.new
game.level
