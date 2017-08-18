#This is the word-guess project

class Game
  attr_reader :max_missed_guesses

  def initialize
    @word_bank = %W[MERCURY VENUS MARS EARTH]
    get_level_and_max_misses
  end

  def get_level_and_max_misses
    puts "You have access to three levels: Easy, Medium, and Hard. \n\nNOTE: \n* Easy gives you 5 missed guesses \n* Medium gives you 4 guesses\n* Hard gives you only 3 guesses. \n\nReady to play?"

    puts "\nPlease enter your level choice below:"

    level_choice = gets.chomp.downcase

    case level_choice
      when "easy"
        @max_missed_guesses = 5
      when "medium"
        @max_missed_guesses = 4
      when "hard"
        @max_missed_guesses = 3
      else
        puts "I'm sorry. I didn't understand. "
        get_level_and_max_misses
    end


  end

  def generate_word
    return @word_bank.sample
  end
end #of class Game


class Card

  attr_reader :word, :word_showing, :missed_count

  def initialize(word)
    @word = word.upcase
    @guess = nil #guess is the variable to store user input
    @guess_type = "invalid"
    @word_showing = build_blank_word_array
    @missed_count = 0
    @word_array = @word.split("") #Check at end if this is used more than in the guess method... if not... delete!
  end

  def build_blank_word_array
    array = []
    @word.length.times do
      array << " _ "
    end
    return array
  end

  def get_guess
    puts "What would you like to guess?"
    @guess = gets.chomp.upcase
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
      puts "YES! It DOES include #{@guess}!"
        i = 0
        @word_array.each do |element|
          if @guess == element #letter
            @word_showing[i] = "#{element} " #resetting "__" to element which is the guessed letter
          end
          i += 1
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

game1 = Game.new #get user input for level

card1 = Card.new(game1.generate_word)

while true
  puts card1.word #test: view word
  puts card1.word_showing.join
  card1.get_guess
  card1.check_guess
  puts card1.missed_count
  puts card1.word_showing.join
  puts "Would you like to make another guess?"
  response = gets.chomp.upcase
  if response == "NO"
    exit
  end
end


# level_choice = game1.get_level #card may need to know level type
# This card1.word will read the card's word
