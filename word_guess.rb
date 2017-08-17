#This is the word-guess project

class Game
  attr_reader :level

  def initialize
    @word_bank = %W[MERCURY VENUS MARS EARTH]
  end

  def get_level
    puts "Let's get started! You have access to three levels: Easy, Medium, and Hard. \n\nNOTE: Easy gives you 5 missed guesses; Medium gives you 4 guesses, and Hard gives you only 3 guesses. Ready to play?"

    puts "Please enter your level choice below:"

    level_choice = gets.chomp
  end

  def generate_word
    return @word_bank.sample
  end
end #of class Game


class Card

  attr_reader :word, :word_showing

  def initialize(word)
    @word = word.upcase
    @guess = nil #guess is the variable to store user input
    @guess_type = "invalid"
    @word_showing = build_initial_word_array.join
    @missed_count = 0
    @word_array = @word.split("") #Check at end if this is used more than in the guess method... if not... delete!
  end

  def build_initial_word_array
    array = []
    @word.length.times do
      array << " ____ "
    end
    return array
  end

  def get_guess
    puts "What would you like to guess?"
    @guess = gets.chomp
  end

  #guess types: actual word, a letter, or invalid(guessing too many letters, guessing a number)
  def check_guess
    if @guess.length.to_i == @word.length.to_i #IF USER GUESSES A WORD
      if @guess.upcase == @word
        print "YAY! CONGRATS! #{@word.upcase} IS CORRECT!"
      else
        print "Sorry, that was incorrect!"
        @missed_count += 1
      end


    elsif @guess.length == 1 #IF USER GUESSES A LETTER
      if @word.include?(@guess) #if guessed letter exists in generated word array, iterate over word array to check if letter matches
        @word_array.each do |element|
          if element == @guess.upcase#letter
            letter_index = @word_array.index(element)
            @word_showing[letter_index] = element #resetting "__" to element which is the guessed letter
          end
        end#of word_array loop
      else #if guessed letter does not exist, then increment guess count
        @missed_count += 1
      end
    end
  end #of class Card
end

  class AsciiArt

    def initialize
    end

    def level_easy_initial
      puts ""
    end

  end #of class AsciiArt


#START OF GAME____________

introduction = <<YES

Welcome to Word Guess! You will be shown a series of blanks.  Each blank represents a letter in the word that you will be guessing! You will be allowed to guess a single letter, or the whole word at once on each of your turns. Just type in your guess and go! Good luck!

YES

puts introduction

game1 = Game.new
# game1.get_level #card may need to know level type
card1 = Card.new(game1.generate_word)
puts card1.word
puts card1.word_showing
card1.get_guess
card1.check_guess
puts card1.word_showing



# This card1.word will read the card's word
