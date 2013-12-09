require 'ap'
require 'debugger'

class Subtitle

attr_accessor :input_file, :seconds

	def initialize(input_file)
		@input_file = input_file
	end

	def define_seconds
		while true
			puts "By how many seconds? Example 2 is for two seconds and 2.5 is for two seconds and five hundred miliseconds "
			number = gets.chomp
				if number.length ==	1
					@seconds = (number+"000").to_i
					break
				elsif number[1] == "." || number[1] == ","
					@seconds = (number[0] + number[2] +"00").to_i
					break
				else
					puts "That is not a valid second format. Try again"
					puts '#'* 50
				end	
		end

	end

	def options
		
		while true
			question = puts "Would you like to add or subtract seconds?"
			question
			ans = gets.chomp.downcase

			define_seconds

			if ans == "add"
				puts "The result is ..."
					puts adding_sec
					break
			elsif ans == "subtract"
				puts "The result is ..."
					puts subtracting_sec 
					break
			else
				puts "Type only add or subtract" 
				puts '#'* 50
			end
		end
	end
	
	def regex
		input_file.scan(/(\d{2}):(\d{2}):(\d{2}),(\d{3})/)
	end

	def original_keeper
		input_file.scan(/(^\d+)|([a-zA-Z].*)/).flatten.compact
	end
		

	def access_time
		joined_arr = regex.flatten.join("")
		joined_arr.insert(9, " ").split(" ")
	end

	def adding_sec
		#debugger
		add_arr = []
		access_time.each do |num|
			 temp = num.insert(0, '1')
			 adding = (temp.to_i + seconds).to_s
				add_arr << adding[1..-1]
		end
		#degex at this point
		union = degex(add_arr)
		grand_finale(union)
		
	end

	def subtracting_sec
		sub_arr = []
		access_time.each do |num|
			temp = num.insert(0, '1')
			subracting = (temp.to_i - seconds).to_s
			sub_arr << subracting[1..-1]
		end
		#degex at this point
		union = degex(sub_arr)
		grand_finale(union)
	end


	def degex(array)
		array.collect do |elem|
		elem.sub /(\d{2})(\d{2})(\d{2})(\d{3})/,'\1:\2:\3,\4'
		end

	end

	def grand_finale(item)
		timing = item.join(" ").insert(12, ' -->')
		a = original_keeper.insert(1, timing)
		a.delete_at(2)
		a.join("\n")
	end

end

# sub = Subtitle.new("625
# 00:03:10,500 --> 00:00:13,000
# The government has a new policy...")

# sub.options


