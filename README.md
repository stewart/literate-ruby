# Literate Ruby

A simple Ruby script that lets you enjoy literate programming in Ruby a little
bit more.

## How do I use it?

Given a `.litrb` file like the following (let's call it `example.litrb`):

    # Literate Programming Is Fun

    Literate programming is a great way to document your code, making it easily
    accessible and well-explained to the reader. For example, below we define
    a function that prints "Hello World", then run it.

        def hello
          puts "Hello, World!"
        end

If the `literate-ruby.rb` script is run on this file, it will generate two
files:

- `example.rb` will contain all the code from the `.litrb` file, waiting to be
  run by Ruby.

- `example.html` will contain the converted markdown from the file, with
  syntax-highlighted Ruby.

## TODO:

- rewrite `literate-ruby.rb` in Literate Ruby
- support for directly running `.litrb` files

## License

MIT. Plain and simple. See `LICENSE` for more details.
