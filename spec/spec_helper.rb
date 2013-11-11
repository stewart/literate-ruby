require 'rspec'
require 'literate-ruby'

module SpecHelpers
  SUPPORT_DIR = File.join(File.dirname(__FILE__), 'support/')

  # Public: Loads an example of Literate Ruby to be used in a spec
  #
  # type - symbol type of example to load.
  #        Examples are :simple, :complex, :long
  #
  # Returns a String containing Literate Ruby
  def literate_ruby_example(type)
    File.read SUPPORT_DIR + type.to_s + ".litrb"
  end
end
