
require './movie_sub'

describe "Subtitle, #initialize" do 

	it "can initialize a subtitle" do  
		lambda {Subtitle.new("any variable")}.should_not raise_error
	end

	it "tests that subtitle has a file" do 
		sub = Subtitle.new("00:00:00,00")
		sub.input_file.should eq("00:00:00,00")
	end

end
