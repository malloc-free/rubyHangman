class Hangman
	@iteration = 0
	@letterCount = 0
	@target = ""
end

if __FILE__ == $0
	#For ASCII hangman.
	hangman =  ["\n"]
	hangman[0] <<  "\n"
	hangman[0] <<  "\n"
	hangman[0] <<  "\n"
	hangman[0] <<  "\n"
	hangman[0] <<  "\n"
	
	hangman[1] =  "\n"
	hangman[1] <<  "\n"
	hangman[1] <<  "\n"
	hangman[1] <<  "\n"
	hangman[1] <<  "\n"
	hangman[1] <<  "\n"
	hangman[1] <<  "|_____________\n"	
	
	hangman[2] =  "\n"
	hangman[2] <<  "|\n"
	hangman[2] <<  "|\n"
	hangman[2] <<  "|\n"
	hangman[2] <<  "|\n"
	hangman[2] <<  "|\n"
	hangman[2] <<  "|_____________\n"
	
	hangman[3] =  "______________\n"
	hangman[3] <<  "|\n"
	hangman[3] <<  "|\n"
	hangman[3] <<  "|\n"
	hangman[3] <<  "|\n"
	hangman[3] <<  "|\n"
	hangman[3] <<  "|_____________\n"
	
	hangman[4] =  "______________\n"
	hangman[4] <<  "|            |\n"
	hangman[4] <<  "|            0\n"
	hangman[4] <<  "|\n"
	hangman[4] <<  "|\n"
	hangman[4] <<  "|\n"
	hangman[4] <<  "|_____________\n"
	
	hangman[5] =  "______________\n"
	hangman[5] <<  "|            |\n"
	hangman[5] <<  "|            0\n"
	hangman[5] <<  "|            |\n"
	hangman[5] <<  "|\n"
	hangman[5] <<  "|\n"
	hangman[5] <<  "|_____________\n"
	
	hangman[6] =  "______________\n"
	hangman[6] <<  "|            |\n"
	hangman[6] <<  "|            0\n"
	hangman[6] <<  "|            |\\\n"
	hangman[6] <<  "|\n"
	hangman[6] <<  "|\n"
	hangman[6] <<  "|_____________\n"
	
	hangman[7] =  "______________\n"
	hangman[7] <<  "|            |\n"
	hangman[7] <<  "|            0\n"
	hangman[7] <<  "|           /|\\\n"
	hangman[7] <<  "|\n"
	hangman[7] <<  "|\n"
	hangman[7] <<  "|_____________\n"
	
	hangman[8] =  "______________\n"
	hangman[8] <<  "|            |\n"
	hangman[8] <<  "|            0\n"
	hangman[8] <<  "|           /|\\\n"
	hangman[8] <<  "|             \\\n"
	hangman[8] <<  "|\n"
	hangman[8] <<  "|_____________\n"
	
	hangman[9] =  "______________\n"
	hangman[9] <<  "|            |\n"
	hangman[9] <<  "|            0\n"
	hangman[9] <<  "|           /|\\\n"
	hangman[9] <<  "|           / \\\n"
	hangman[9] <<  "|\n"
	hangman[9] <<  "|_____________\n"
	
	#So we can keep track of selected letters.
	alpha = {"a" => false, "b" => false, "c" => false, "d" => false, "e" => false,
			 "f" => false, "g" => false, "h" => false, "i" => false, "j" => false,
			 "k" => false, "l" => false, "m" => false, "n" => false, "o" => false, 
			 "p" => false, "q" => false, "r" => false, "s" => false, "t" => false, 
			 "u" => false, "v" => false, "w" => false, "x" => false, "y" => false, 
			 "z" => false}
	
	#Quit when this true
	quit = false
	#This is used to display current word guesses.
	noose = String.new("")
	#The test word until we have some other mechanisim
	myStr = String.new("test")
	#Add blanks for letters.
	noose << "_" while noose.length < myStr.length
	iteration = 0
	letterCount = 0
	
	#loop intil we want to quit
	until quit
		#display data
		puts hangman[iteration]
		puts noose
		puts "iteration = #{iteration}"
		input = gets.chomp
		puts "Entered #{input}"
	
		#test input
		#if quitting then bail
		if input == "quit"
			quit = true
		#else check a letter has been input from the hash
		elsif alpha.has_key?(input)
			#If the letter has been tried already
			if alpha[input]
				puts "letter #{input} already tried"
			#The letter has not been checked already, so mark it and test the string
			else
				alpha[input] = true
				oldval = myStr.index(input)
				#If we don't have a match, then mark it as such. 
				#Then test for game over.
				if oldval == nil
					iteration += 1
					#quit if we have a hangman.
					if iteration == hangman.size - 1
						puts "game over"
						quit = true
						puts hangman[hangman.size   1]
						puts myStr
					end
				#We have a match. Test string until we have all instances of letter.
				else
					while oldval != nil
						letterCount += 1
						puts "letterCount = #{letterCount}"
						puts "index = #{oldval}"
						noose[oldval] = input
						#If we have the correct word size, then the game is over.
						if letterCount == myStr.size
							puts "Game over, corrent!"
							quit = true
						#Test the string for more instances.
						else 
							oldval = myStr.index(input, oldval + 1)
						end
					end
				end
			end
		else
		#Error message for incorrect input.
			puts "please enter a letter"
		end
	end
		
	#alpha.each do |key, value|
	#	puts "key = #{key}, value = #{value}"
	#end
end