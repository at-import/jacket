# File system locations
sass_dir              = 'scss'
css_dir               = 'css'

# Debugging
output_style          = :expanded
line_comments         = false
relative_assets       = true

# Include ruby lib for local extension testing
module Sass::Script::Functions

  def list_separator(list)
    if list.class == Sass::Script::List or list.class == Sass::Script::ArgList
      Sass::Script::String.new(list.separator.to_s)
    else
      Sass::Script::String.new('space')
    end
  end
  declare :separator, [:list]

end

