require 'awesome_print'
require 'debugger'
# THE CHALLENGE

# Create a Command Line Pig Latin translator.

# Pig Latin is a game of alterations played on the English language game. To create the Pig Latin form of an English word the initial consonant sound is transposed to the end of the word and an ay is affixed. Read Wikipedia for more information on rules.

# Example output:

# > pig_latin("banana") #=> "anana-bay"
class Pig_latin

	attr_accessor :string

	def initialize
		@string = string
	end


	def options
		 while true
		 puts "Type a word or sentences you would like to translate into pig latin. Or type exit to end application"
		 ans = gets.chomp
			 if ans == "exit"
			 	break
			 else
				 ans.split(" ").each do |elem|
				  array_char = elem.split(//)
				 print pig_latinize(array_char) + " "
				end
				puts " "
			end
		end
	end
	
	def pig_latinize(word)
	 			
 		if  word[0] == "a"|| word[0] == "e"||word[0] == "i" || word[0] == "o" ||
 			word[0] == "u"

 			start_with_vowel(word)

 		else

		 	vowel_index = word.find_index do |element|
		 		 element == "a" || element == "e" || element == "i" || element == "o" || element == "u"
			 end

		last_consonant = []
		 
		last_consonant << word[0..vowel_index-1]

		ending = last_consonant.unshift("-").push("ay")

		whole_word = ending.unshift(word[vowel_index..-1])

		whole_word.join("")

		 end

	end
			 
	def start_with_vowel(word)
	 	vowel_index = word.find_index do |element|
	 		 element[0] == "a" || element[0] == "e" || element[0] == "i" || element[0] == "o" || element[0] == "u"
		 end
		
		way_array =[]

		way_array << word.push("way")

		way_array.join("")

	end

end	


pig = Pig_latin.new 

pig.options
		 
