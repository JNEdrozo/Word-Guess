#This is the word-guess project

require 'terminal-table'

class WordGame

  attr_reader :word, :word_showing, :letters_guessed, :words_guessed, :level_choice

  def initialize
    @word_bank = %W[APPLE SANDWICH PICNIC BASKET ANTS BLANKET IDYLLIC MOUNTAINS LAKE SUMMMER FRIENDS FAMILY]
    @level_choice = get_level
    @word = @word_bank.sample #generates the word
    @guess = nil #guess is the variable to store user input
    @word_showing = build_blank_word_array
    @word_array = @word.split("") #Check at end if this is used more than in the guess method... if not... delete!
    @letters_guessed = []
    @words_guessed = []
  end

  def get_level
    puts "You have access to three levels: Easy, Medium, and Hard. \n\nNOTE: \n* Easy gives you 5 missed guesses \n* Medium gives you 4 guesses\n* Hard gives you only 3 guesses. \n\nReady to play?"
    puts "\nPlease enter your level choice below:"

    level_choice = gets.chomp.downcase
    until level_choice == "easy" || level_choice == "medium" || level_choice == "hard"
      level_choice = self.get_level
    end
    return level_choice
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
  def check_guess_easy
    @guesses_remaining = 5

    if @guess.length.to_i > 1
      @words_guessed << @guess
      if @guess.upcase == @word
        print "YAY! CONGRATS! #{@word.upcase} IS CORRECT!"
      else
        print "Sorry, that was incorrect!"
        @guesses_remaining -= 1
      end
    elsif @guess.length == 1 #IF USER GUESSES A LETTER
      @letters_guessed << @guess

      if @word.include?(@guess) #if guessed letter exists in generated word array, iterate over word array to check if letter matches
        puts "YES! It DOES include #{@guess}!"

        i = 0
        @word_array.each do |element|
          if @guess == element #letter
            @word_showing[i] = "#{element} " #resetting "__" to element which is the guessed letter
          end
          i += 1

        end#of word_array loop
      else #if guessed letter does not exist,
      end
    end
  end #of class Card
end

# class AsciiArt
#
#     def initialize
#     end
#
#     def level_easy_initial
#       puts ""
#     end
#
# end #of class AsciiArt


#START OF GAME____________

introduction = <<YES

Welcome to Word Guess! You will be shown a series of blanks.  Each blank represents a letter in the word that you will be guessing! You will be allowed to guess a single letter, or the whole word at once on each of your turns. Just type in your guess and go! Good luck!

YES

puts introduction

game1 = WordGame.new #get user input for level


case game1.level_choice
when "easy"
  guesses_remaining = 5
  puts "\e[H\e[2J"
  puts "\n\n"
  puts game1.word
  puts game1.word_showing.join
  puts "guessed letters: #{game1.letters_guessed}"
  puts "guessed words: #{game1.words_guessed}"
  puts "remaining guesses: #{guesses_remaining}"
  game1.get_guess
  game1.check_guess_easy
  puts "guessed letters: #{game1.letters_guessed}"
  puts "guessed words: #{game1.words_guessed}"
  puts "remaining guesses: #{guesses_remaining}"

when "medium"
  guesses_remaining = 4
when "hard"
  guesses_remaining = 3
else
  puts "I'm sorry. I didn't understand. "
  get_level
end

# while true
#   puts "\e[H\e[2J"
#   puts game1.word #test: view word
#   puts game1.word_showing.join
#   game1.get_guess
#   game1.check_guess
#   puts game1.missed_count
#   puts game1.word_showing.join
#   puts "Would you like to make another guess?"
#   response = gets.chomp.upcase
#   if response == "NO"
#     exit
#   end
# end


# level_choice = game1.get_level #card may need to know level type
# This card1.word will read the card's word
