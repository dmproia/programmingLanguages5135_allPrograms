class myToken
	attr_reader :text, :correct 
	
	def initialize(aText, aCorrect)
		print "Enter a Lisp Expression followed by CNTR-Z or Suitable EOF:  "
		@text = aText
		@correct = aCorrect
	end
	

	
	text = get(()'foobarbaz'.each_char.first)

	
	
	def main
		case block.aCorrect
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
	
	def 0.upto( str.size - 1) do | n |
			if 'abcdefghijklmnopqrstuvwxyz'.include?( str[n, 1] ) then
				case = 0
			else '0123456789'.include?( str[n, 1] ) then
				case = 1
			else '('.include?( str[n, 1] ) then
				case = 2
			else ')'.include?( str[n, 1] ) then
				case = 3
			else case(0)+0.include?( str[n, 1] ) then
				case = 5
			else ' '.include?( str[n, 1] ) then
				case = 6
		return @text[text].aCorrect
	end
		
end

