# frozen_string_literal: true

module Kolorit
  module Linux
    def black = colorize(30)

    def red = colorize(31)

    def green = colorize(32)

    def yellow = colorize(33)

    def blue = colorize(34)

    def pink = colorize(35)

    def cyan = colorize(36)

    def gray = colorize(37)

    def bold = colorize(1)

    def italic = colorize(3)

    def underline = colorize(4)

    def blink = colorize(5)

    def reverse_color = colorize(7)

    private

    ##
    # colorize string based on color_code
    #
    def colorize(color_code)
      # check if we change color or type
      type = case color_code
             # for type-change
             when 1 then 22 # bold
             when 3 then 23 # italic
             when 4 then 24 # underline
             when 5 then 25 # blink
             when 7 then 27 # reverse_color
             # for color change
             else 0
             end
      # create colorized string
      "\e[#{color_code}m#{self}\e[#{type}m"
    end
  end
end
