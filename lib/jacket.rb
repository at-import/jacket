# TODO: Remove lib/ when Sass 3.3 is released
require 'compass'
extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Compass::Frameworks.register('jacket', :path => extension_path)

module Jacket
  VERSION = "1.1.1"
  DATE = "2013-07-07"
end

module Sass::Script::Functions

  # Add the Sass list_separator() function until it lands in Sass 3.3
  # Code fixes from https://github.com/nex3/sass/pull/689#issuecomment-16711829
  # included.

  # Returns the separator of the given list.
  # If not a list, returns false.
  #
  # @example
  #   list-separator(1px 2px 3px) => 'space'
  #   list-separator(1px, 2px, 3px) => 'comma'
  #   list-separator('foo') => 'space'
  def list_separator(list)
    if list.class == Sass::Script::List or list.class == Sass::Script::ArgList
      Sass::Script::String.new(list.separator.to_s)
    else
      Sass::Script::String.new('space')
    end
  end
  declare :separator, [:list]

end
