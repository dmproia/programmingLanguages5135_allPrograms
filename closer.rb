hello_string = "Hello, world!\n"
say_hello = Proc.new do
    puts hello_string
end
say_hello.call # Hello, world!