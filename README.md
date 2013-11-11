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
  run by Ruby:

```ruby
# example.rb

def hello
  puts "Hello, World!"
end
```

- `example.html` will contain the converted markdown from the file, with
  syntax-highlighted Ruby:

```html
<!-- example.html -->
<h1>Literate Programming Is Fun</h1>

<p>Literate programming is a great way to document your code, making it easily
accessible and well-explained to the reader. For example, below we define
a function that prints "Hello World", then run it.</p>

<div class="highlight"><pre><span class="k">def</span> <span class="nf">hello</span>
  <span class="nb">puts</span> <span class="s2">&quot;Hello, World!&quot;</span>
<span class="k">end</span>
</pre></div>
```

## Dependencies:

Literate Ruby makes use of the following gems:

- [kramdown][]
- [pygments.rb][]

If you have a Pygments install (`which pygmentize`), Pygments.rb will use that.
If not, it will need to use an external web service to perform syntax
highlighting.

[kramdown]: http://kramdown.rubyforge.org
[pygments.rb]: https://github.com/tmm1/pygments.rb

## TODO:

- support for directly running `.litrb` files
- support for processing a dir of `.litrb` fils
- support for reading Literate Ruby from stdin and outputting html or ruby to
  stdout

## License

MIT. Plain and simple. See `LICENSE` for more details.
