#This is the word-guess project

class Game
  attr_reader :level

  def initialize

  end

  def level

end #of class Game

#
class Card

  def initialize(word)
    @word = word
    @guess = nil

  end

  def get_guess
    puts "What would you like to guess?"
    @guess = gets.chomp
  end

  def verify_guess
    if @guess.length.to_i == @word.length.to_i
    end
  end

end #of class Card

class AsciiArt

  def initialize
  end

end #of class AsciiArt
