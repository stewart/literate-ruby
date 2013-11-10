require 'pygments'
require 'rdiscount'

class LiterateRuby
  class << self
    attr_reader :input, :ruby, :html, :basename

    INDENTED_CODE_REGEX = / # Match a MARKDOWN CODE section.
      (\r?\n)              # $1: CODE must be preceded by blank line
      (                    # $2: CODE contents
        (?:                # Group for multiple lines of code.
          (?:\r?\n)+       # Each line preceded by a newline,
          (?:[ ]{4}|\t).*  # and begins with four spaces or tab.
        )+                 # One or more CODE lines
        \r?\n              # CODE folowed by blank line.
      )                    # End $2: CODE contents
      (?=\r?\n)?           # CODE folowed by blank line.
      /x

    def print_help
      warn "  Usage:"
      warn "    ruby literate-ruby.rb [FILE]"
      exit 1
    end

    def check_args
      print_help if ARGV.length == 0
    end

    def get_input
      file = ARGV[0]

      if File.exists?(file)
        @input = File.read file
        @basename = File.basename file, '.litrb'
      else
        print_help
      end
    end

    def extract_ruby
      @ruby = @input.scan(INDENTED_CODE_REGEX).join('')
      @ruby.gsub!(/^[ ]{4}/ , '')
      @ruby.lstrip!.strip!
    end

    def syntax_highlight_ruby_blocks
      @input.gsub! INDENTED_CODE_REGEX do |code|
        code.gsub!(/^[ ]{4}/ , '')
        code.strip!.lstrip!

        highlighted_code = highlight_code code
        "\n\n#{highlighted_code}\n"
      end
    end

    def highlight_code(code)
      Pygments.highlight code, :lexer => 'ruby'
    end

    def convert_markdown
      syntax_highlight_ruby_blocks
      markdown = RDiscount.new @input
      @html = markdown.to_html
    end

    def export_html
      html_filename = File.expand_path("./#{@basename}.html")
      File.write html_filename, @html
    end

    def export_ruby
      ruby_filename = File.expand_path("./#{@basename}.rb")
      File.write ruby_filename, @ruby
    end

    def start!
      check_args
      get_input
      extract_ruby
      convert_markdown
      export_html
      export_ruby
    end
  end
end

LiterateRuby.start!
