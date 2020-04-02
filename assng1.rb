class LispScanner
  # <summary>
  # Constructor for objects of class LispScanner.
  # </summary>
  def initialize 
    # initialise instance variables
    print "Enter a Lisp Expression followed by CNTR-Z or Suitable EOF:  "
	@inputFile = get()
    @ip = 0
    @parseString = ""

    def nextChar
      begin
        ch = @inputFile.read
        while ch != -1
          @parseString = @parseString + ch
          ch = @inputFile.read
        end
      rescue IOException => exc
        Console.WriteLine("Error reading file.")
      else
      ensure
        self.nextChar
      end
    end

    # <summary>
    # Retrieves a single character and stores it in two formats.
    # </summary>
    def nextChar
      if @ip < @parseString.Length then
        @lookAhead = @parseString[@ip]
        @lookAheadInt = @lookAhead
        @ip = @ip + 1
      else
        @lookAheadInt = -1
      end
    end

    # <summary>
    # Scans characters until it recognizes a token. </summary>
    # <returns> the next token in the InputStream </returns>
    def nextToken
      while System::Char.IsWhiteSpace(@lookAhead)
        self.nextChar
      end
      if @lookAheadInt == -1 then
        #inputFile.close;
        return Token.new("EOF", Token.EOF)
      end
      if @lookAhead == '(' then
        self.nextChar
        return Token.new("(", Token.LPAREN)
      end
      if @lookAhead == ')' then
        self.nextChar
        return Token.new(")", Token.RPAREN)
      end
      if @lookAhead == '\"' then
        return self.str
      end
      if System::Char.IsLetter(@lookAhead) then
        return self.id
      end
      if System::Char.IsDigit(@lookAhead) then
        return self.number
      end
      return nil
    end

    # <summary>
    # Scans for an identifier.
    # ID ::=   LETTER (LETTER | DIGIT)* </summary>
    # <returns> the next identifier Token in the InputStream </returns>
    def id
      temp = ""
      while System::Char.IsWhiteSpace(@lookAhead)
        self.nextChar
      end
      while System::Char.IsLetterOrDigit(@lookAhead)
        temp = temp + @lookAhead
        self.nextChar
      end
      return Token.new(temp, Token.ID)
    end

    # <summary>
    # Scans for a String.
    # STRING ::=  QUOTE (CHARACTER)* QUOTE </summary>
    # <returns> then next string Token in the InputStream </returns>
    def str
      temp = ""
      self.nextChar
      while @lookAhead != '\"'
        temp = temp + @lookAhead
        self.nextChar
      end
      self.nextChar
      return Token.new(temp, Token.STRING)
    end

    # <summary>
    # Scans for a Number.
    # NUMBER ::= DIGIT+ </summary>
    # <returns> the next number Token in the InputStream </returns>
    def number
      temp = ""
      while System::Char.IsDigit(@lookAhead)
        temp = temp + @lookAhead
        self.nextChar
      end
      return Token.new(temp, Token.NUMBER)
    end

    # <summary>
    # A convenience method for testing.  Reads a Lisp expression from the keyboard
    # </summary>
    def LispScanner.Main(args)
      scanner = LispScanner.new
      nt = scanner.nextToken
      while nt.Type != Token.EOF
        Console.WriteLine(nt)
        nt = scanner.nextToken
      end
      Console.WriteLine(nt)
    end
  end


  class Token
    # <summary>
    # Constructor for objects of class Token.
    # Tokens:  Left parenthesis   (
    # Right parenthesis  )
    # Number            Any consecutive sequence of digits
    # String            A ", followed by a any sequence of characters, followed by "
    # EOF               A -1 return value when read is invoked
    # ID                A Letter followed by zero or more letters and digits
    # Whitespace        Java whitespace - not returned by the scanner </summary>
    # <param name="a"> string representing the text value of the Token </param>
    # <param name="an"> integer representing the Token type </param>
    def initialize(text, type)
      @LPAREN = 1
      @RPAREN = 2
      @NUMBER = 3
      @STRING = 4
      @EOF = 5
      @ID = 6
      @text = text
      @type = type
    end

    

   
    def toString
      typeDescription = ""
      case @type
      when 1
        typeDescription = "Left Parenthesis"
      when 2
        typeDescription = "Right Parenthesis"
      when 3
        typeDescription = "Number"
      when 4
        typeDescription = "String"
      when 5
        typeDescription = "EOF"
      when 6
        typeDescription = "ID"
      end
      return "[text: " + @text + ", type: " + typeDescription + "]"
    end
  end
end