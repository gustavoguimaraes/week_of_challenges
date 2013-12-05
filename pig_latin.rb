require 'awesome_print'
require 'debugger'
# THE CHALLENGE

# Create a Command Line Pig Latin translator.

# Pig Latin is a game of alterations played on the English language game. To create the Pig Latin form of an English word the initial consonant sound is transposed to the end of the word and an ay is affixed. Read Wikipedia for more information on rules.

# Example output:

# > pig_latin("banana") #=> "anana-bay"
class Pig_latin

	attr_accessor :string

	def initialize(string)
		@string = string
	end

	 def pig_latinize
	 	b =[]

	 	a = string.split(//)
	 	
		 if a[0..2] != (/[aeiou]/) 
		 
		 		b << a[0..2]
		 		c = b.unshift("-").push("ay")
	 			c.unshift(a[3..-1])
	 			ap c.join("")
		 
		 elsif a[0..1] != (/[aeiou]/) 
		 		b << a[0..1]
		 		c = b.unshift("-").push("ay")
	 			c.unshift(a[2..-1])
	 			ap c.join("")
		 
		 elsif a[0] != (/[aeiou]/)
		 		b << a[0]
		 		c = b.unshift("-").push("ay")
	 			c.unshift(a[1..-1])
	 			ap c.join("")

		 elsif a[0]== (/[aeiou]/) && a[1] != (/[aeiou]/)
		 	b << a[1]
		 	c = b.unshift("-").push("ay")
	 			c.unshift(a[2..-1])
	 			ap c.join("")

		 elsif a[0..1] == (/[aeiouy]/)
		 		b << a[2]
		 		c = b.unshift("-").push("ay")
	 			c.unshift(a[3..-1])
	 			ap c.join("")
		 
		 elsif a[0]== (/[aeiou]/) && a[1] != (/[aeiou]/)
		 	b << a[1]
		 	c = b.unshift("-").push("ay")
	 			c.unshift(a[2..-1])
	 			ap c.join("")

		 else
		 	b<< a[0]
		 	c = b.unshift("-").push("ay")
	 			c.unshift(a[1..-1])
	 			ap c.join("")
		 
		 end


	 end


end	



pig = Pig_latin.new("theo") #=> ala-lay

pig.pig_latinize




 