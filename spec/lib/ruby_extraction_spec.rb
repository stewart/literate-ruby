require 'spec_helper'

describe LiterateRuby do
  include SpecHelpers
  describe "extracting ruby" do
    context "basic example" do
      let(:expected_result) do
        "def hello\n  puts \"Hello, World!\"\nend"
      end

      it "extracts an indented code block" do
        LiterateRuby.input = literate_ruby_example :basic
        LiterateRuby.extract_ruby
        expect(LiterateRuby.ruby).to eq expected_result
      end
    end
  end
end
