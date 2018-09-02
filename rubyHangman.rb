
class Hangman
	def initialize(guessWord)
		#The word/phrase to be guessed
		@guessWord = guessWord
		#The number of letters in the word that have been guessed.
		@letterCount = 0
		#Used to show the letters in the phrase that have been guessed
		#/to be guessed. Used for visualization purposes.
		@targetWord = ""
		#Tracks progress of the current hangman.
		@iteration = 0
		#The total size of all the words in the phrase to be guessed.
		@wordSize = 0
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
			 
		#Build the targetWord from the guess word. Spaces are to be filtered out,
		#and blanks put in for each of the letters in the phrase.
		@guessWord.each_char{|c|
			if c == " "
				@targetWord << " "
			else
				@targetWord << "_"
				@wordSize += 1
			end
		}
	end
		#attr_accessor :alpha
		#attr_accessor :guessWord
		#attr_accessor :targetWord
		#attr_accessor :wordSize
		#attr_accessor :letterCount
		#attr_accessor :iteration
		#attr_accessor :quit
	
	def start()
		until @quit
			#display data
			puts $hangman[@iteration]
			puts @targetWord
			input = gets.chomp
			puts "Entered #{input}"
	
			#test input
			#if quitting then bail
			if input == "quit"
				@quit = true
			#else check a letter has been input from the hash
			elsif @alpha.has_key?(input)
				testLetter input
			else
			#Error message for incorrect input.
				puts "please enter a letter"
			end
		end
	end
	
	def testLetter(input)
		#If the letter has been tried already
		if @alpha[input]
			puts "letter #{input} already tried"
		#The letter has not been checked already, so mark it and test the string
		else
			@alpha[input] = true
			atIndex = @guessWord.index(input)
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
		@iteration += 1
		#quit if we have a hangman.
		if @iteration == $hangman.size - 1
			puts "Game Over, hangman complete"
			@quit = true
			puts $hangman[$hangman.size - 1]
			puts @guessWord
		end
	end
	
	def scanWord(input, atIndex)
		while atIndex != nil
			@letterCount += 1
			@targetWord[atIndex] = input
			#If we have the correct word size, then the game is over.
			if @letterCount == @wordSize
				puts "Game Over, correct phrase!"
				puts $hangman[@iteration]
				puts @guessWord
				@quit = true
			#Test the string for more instances.
			else 
				atIndex = @guessWord.index(input, atIndex + 1)
			end
		end
	end
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

if __FILE__ == $0
	#Create an array for the phrases and populate it with the phrases obtained
	#from phrases.txt
	phrases = Array.new
	IO.foreach("phrases.txt") {|block| phrases[phrases.size] = block.chomp}
	#Nothing in the array, something is wrong.
	if phrases.size == 0
		puts "Abort, cannot find file phrases.txt"
	else
		#Create a game, pass in the phrase, and start.
		guessWord = phrases[rand(phrases.size)]
		currentGame = Hangman.new guessWord
		currentGame.start
	end
	#alpha.each do |key, value|
	#	puts "key = #{key}, value = #{value}"
	#end
end