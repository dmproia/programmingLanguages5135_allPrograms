class myToken
	attr_reader :text, :correct 
	
	def initialize(aText, aCorrect)
		print "Enter a Lisp Expression followed by CNTR-Z or Suitable EOF:  "
		atext = get().'foobarbaz'.each_char.first
		puts aCorrect
	end
	

	
def main
	
		aCorrect = ""
		
		opts = GetoptLong.new(
			[0, "abcdefghijklmnopqrstuvwxyz", GetOptLong::NO_ARGUMENT],
			[1, "0123456789", GetOptLong::NO_ARGUMENT],
			[2, "(", GetOptLong::NO_ARGUMENT],
			[3, ")", GetOptLong::NO_ARGUMENT],
			[4, "abcdefghijklmnopqrstuvwxyz" + 0, GetOptLong::NO_ARGUMENT],
			[5, " ", GetOptLong::NO_ARGUMENT],
			)
		opts.each { |option, value|
		case option
			when 0
				puts "Number"
			when 1
				puts "String"
			when 2
				puts "Left parenthesis ("
			when 3
				puts "Right parenthesis )"
			when 4
				puts "EOF"
			when 5
				puts "ID"
			when 6
				puts "Whitespace"
		end
	

		
end

