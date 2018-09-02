class Hangman
	@iteration = 0
	@letterCount = 0
end

if __FILE__ == $0
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
	
	alpha = {"a" => false, "b" => false, "c" => false, "d" => false, "e" => false,
			 "f" => false, "g" => false, "h" => false, "i" => false, "j" => false,
			 "k" => false, "l" => false, "m" => false, "n" => false, "o" => false, 
			 "p" => false, "q" => false, "r" => false, "s" => false, "t" => false, 
			 "u" => false, "v" => false, "w" => false, "x" => false, "y" => false, 
			 "z" => false}
	
	quit = false
	noose = String.new("")
	myStr = String.new("test")
	
	noose << "_" while noose.length < myStr.length
	iteration = 0
	letterCount = 0
	until quit
		puts hangman[iteration]
		puts noose
		puts "iteration = #{iteration}"
		input = gets.chomp
		puts "Entered #{input}"
	
		if input == "quit"
			quit = true
		elsif alpha.has_key?(input)
			if alpha[input]
				puts "letter #{input} already tried"
			else
				alpha[input] = true
				oldval = myStr.index(input)
				if oldval == nil
					iteration += 1
					if iteration == 9
						puts "game over"
						quit = true
						puts hangman[9]
						puts myStr
					end
				else
					while oldval != nil
						letterCount += 1
						puts "letterCount = #{letterCount}"
						puts "index = #{oldval}"
						noose[oldval] = input
						
						if letterCount == myStr.size
							puts "Game over, corrent!"
							quit = true
						else 
							oldval = myStr.index(input, oldval + 1)
						end
					end
				end
			end
		else
			puts "please enter a letter"
		end
	end
		
	#alpha.each do |key, value|
	#	puts "key = #{key}, value = #{value}"
	#end
end