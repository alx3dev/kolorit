# frozen_string_literal: true

module Kolorit
  ##
  # Color codes for linux systems.
  # Allow use of color methods when included in class.
  # @see Kolorit
  # @see https://www.github.com/alx3dev/kolorit/README.md
  #
  module Linux
    def red;    colorize(31) end
    def green;  colorize(32) end
    def yellow; colorize(33) end
    def blue;   colorize(34) end
    def pink;   colorize(35) end
    def cyan;   colorize(36) end
    def gray;   colorize(37) end

    def bold;           colorize(1) end
    def italic;         colorize(3) end
    def underline;      colorize(4) end
    def blink;          colorize(5) end
    def reverse_color;  colorize(7) end

    private

    def colorize(color_code)
      style = case color_code
              when 1 then 22 # bold
              when 3 then 23 # italic
              when 4 then 24 # underline
              when 5 then 25 # blink
              when 7 then 27 # reverse_color
              else 0
              end
      "\e[#{color_code}m#{self}\e[#{style}m"
    end
  end
end
