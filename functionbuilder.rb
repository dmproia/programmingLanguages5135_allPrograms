  def functionbuilder(n)
      return Proc.new {|m| m*n }
  end
 
  f1 = functionbuilder(3)      # 'factor' is replaced with 3
  f2 = functionbuilder(10)
 
  f1.call(4)               #=> 12
  f1.call(5)                #=>15
  f2.call(4)               #=> 40
  f2.call(5)                #=>50
