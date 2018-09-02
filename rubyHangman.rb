
class Hangman
	def initialize(guessPhrase)
		#The word/phrase to be guessed
		@guessPhrase = guessPhrase
		#The number of letters in the word that have been guessed.
		@letterCount = 0
		#Used to show the letters in the phrase that have been guessed
		#/to be guessed. Used for visualization purposes.
		@displayPhrase = ""
		#Tracks progress of the current hangman.
		@hangmanIteration = 0
		#The total size of all the words in the phrase to be guessed.
		@phraseCount = 0
		#Are we in a quit state in the game, this is when either 'quit' is typed
		#into the prompt, the user correctly guesses the entire phrase, or the
		#hangman is complete.
		@quit = false
		#Both to track what letters have been used and also filter out input.
		@alpha = {"a" => false, "b" => false, "c" => false, "d" => false, "e" => false,
			 "f" => false, "g" => false, "h" => false, "i" => false, "j" => false,
			 "k" => false, "l" => false, "m" => false, "n" => false, "o" => false, 
			 "p" => false, "q" => false, "r" => false, "s" => false, "t" => false, 
			 "u" => false, "v" => false, "w" => false, "x" => false, "y" => false, 
			 "z" => false}
			 
		#Build the displayPhrase from guessPhrase. Spaces are to be filtered out,
		#and blanks put in for each of the letters in the phrase.
		@guessPhrase.each_char{|c|
			if c == " "
				@displayPhrase << " "
			else
				@displayPhrase << "_"
				@phraseCount += 1
			end
		}
	end
		#attr_accessor :alpha
		#attr_accessor :guessPhrase
		#attr_accessor :displayPhrase
		#attr_accessor :phraseCount
		#attr_accessor :letterCount
		#attr_accessor :hangmanIteration
		#attr_accessor :quit
	
	def start()
		until @quit
			#display data.
			puts $hangman[@hangmanIteration]
			puts @displayPhrase
			
			#Get input from the user.
			input = gets.chomp
			puts "** Entered: #{input} **"
	
			#test input.
			#if quitting then bail.
			if input == "quit"
				@quit = true
			elsif input.size > 1
				if input == @guessPhrase
					@quit = true
					puts "** Game Over, phrase correctly guessed **"
					puts $hangman[@hangmanIteration]
					puts @guessPhrase
			    else
					puts "** Not the correct phrase **"
					@hangmanIteration += 1
				end
			#else check a letter has been input from the hash
			elsif @alpha.has_key?(input)
				testLetter input
			else
			#Error message for incorrect input.
				print "** please either enter a letter a-z, ", 
				"the entire phrase to guess, or quit to exit. **"
			end
		end
	end
	
	def testLetter(input)
		#If the letter has been tried already
		if @alpha[input]
			puts "**letter #{input} already tried **"
		#The letter has not been checked already, so mark it and test the string
		else
			@alpha[input] = true
			atIndex = @guessPhrase.index(input)
			#If we don't have a match, then mark it as such,
			#then test for game over.
			if atIndex == nil
				indexNil
			#We have a match. Test string until we have all instances of letter.
			else
				scanWord input, atIndex
			end
		end
	end
	
	def indexNil
		@hangmanIteration += 1
		#quit if we have a hangman.
		if @hangmanIteration == $hangman.size - 1
			puts "** Game Over, hangman complete **"
			@quit = true
			puts $hangman[$hangman.size - 1]
			puts @guessPhrase
		end
	end
	
	def scanWord(input, atIndex)
		while atIndex != nil
			@letterCount += 1
			@displayPhrase[atIndex] = input
			#If we have the correct word size, then the game is over.
			if @letterCount == @phraseCount
				puts "** Game Over, correct phrase! **"
				puts $hangman[@hangmanIteration]
				puts @guessPhrase
				@quit = true
			#Test the string for more instances.
			else 
				atIndex = @guessPhrase.index(input, atIndex + 1)
			end
		end
	end
end

if __FILE__ == $0
	#Create an array for the phrases and populate it with the phrases obtained
	#from phrases.txt
	phrases = Array.new
	begin
		IO.foreach("phrases.txt") {|block| phrases[phrases.size] = block.chomp}
		if phrases.size == 0
			puts "** Abort, phrases is an empty file. **"
		else
			#Create a game, pass in the phrase, and start.
			guessPhrase = phrases[rand(phrases.size)]
			currentGame = Hangman.new guessPhrase
			currentGame.start
		end
	rescue
		puts "** Cannot open file phrases.txt, aborting **"
	end
	
	#alpha.each do |key, value|
	#	puts "key = #{key}, value = #{value}"
	#end
end

#For ASCII hangman.
BEGIN {
	$hangman =  ["\n"]
	$hangman[0] <<  "\n"
	$hangman[0] <<  "\n"
	$hangman[0] <<  "\n"
	$hangman[0] <<  "\n"
	$hangman[0] <<  "\n"
	
	$hangman[1] =  "\n"
	$hangman[1] <<  "\n"
	$hangman[1] <<  "\n"
	$hangman[1] <<  "\n"
	$hangman[1] <<  "\n"
	$hangman[1] <<  "\n"
	$hangman[1] <<  "|_____________\n"	
	
	$hangman[2] =  "\n"
	$hangman[2] <<  "|\n"
	$hangman[2] <<  "|\n"
	$hangman[2] <<  "|\n"
	$hangman[2] <<  "|\n"
	$hangman[2] <<  "|\n"
	$hangman[2] <<  "|_____________\n"
	
	$hangman[3] =  "______________\n"
	$hangman[3] <<  "|\n"
	$hangman[3] <<  "|\n"
	$hangman[3] <<  "|\n"
	$hangman[3] <<  "|\n"
	$hangman[3] <<  "|\n"
	$hangman[3] <<  "|_____________\n"
	
	$hangman[4] =  "______________\n"
	$hangman[4] <<  "|            |\n"
	$hangman[4] <<  "|            0\n"
	$hangman[4] <<  "|\n"
	$hangman[4] <<  "|\n"
	$hangman[4] <<  "|\n"
	$hangman[4] <<  "|_____________\n"
	
	$hangman[5] =  "______________\n"
	$hangman[5] <<  "|            |\n"
	$hangman[5] <<  "|            0\n"
	$hangman[5] <<  "|            |\n"
	$hangman[5] <<  "|\n"
	$hangman[5] <<  "|\n"
	$hangman[5] <<  "|_____________\n"
	
	$hangman[6] =  "______________\n"
	$hangman[6] <<  "|            |\n"
	$hangman[6] <<  "|            0\n"
	$hangman[6] <<  "|            |\\\n"
	$hangman[6] <<  "|\n"
	$hangman[6] <<  "|\n"
	$hangman[6] <<  "|_____________\n"
	
	$hangman[7] =  "______________\n"
	$hangman[7] <<  "|            |\n"
	$hangman[7] <<  "|            0\n"
	$hangman[7] <<  "|           /|\\\n"
	$hangman[7] <<  "|\n"
	$hangman[7] <<  "|\n"
	$hangman[7] <<  "|_____________\n"
	
	$hangman[8] =  "______________\n"
	$hangman[8] <<  "|            |\n"
	$hangman[8] <<  "|            0\n"
	$hangman[8] <<  "|           /|\\\n"
	$hangman[8] <<  "|             \\\n"
	$hangman[8] <<  "|\n"
	$hangman[8] <<  "|_____________\n"
	
	$hangman[9] =  "______________\n"
	$hangman[9] <<  "|            |\n"
	$hangman[9] <<  "|            0\n"
	$hangman[9] <<  "|           /|\\\n"
	$hangman[9] <<  "|           / \\\n"
	$hangman[9] <<  "|\n"
	$hangman[9] <<  "|_____________\n"
}