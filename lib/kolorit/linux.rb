# frozen_string_literal: true

module Kolorit
  ##
  # Color codes for linux systems.
  # Allow use of color methods when included in **String** class.
  # @see Kolorit
  #
  module Linux
    def red     = colorize(31)
    def green   = colorize(32)
    def yellow  = colorize(33)
    def blue    = colorize(34)
    def pink    = colorize(35)
    def cyan    = colorize(36)
    def gray    = colorize(37)

    def bold          = colorize(1)
    def italic        = colorize(3)
    def underline     = colorize(4)
    def blink         = colorize(5)
    def reverse_color = colorize(7)

    private

    def colorize(color_code)
      type = case color_code
             when 1 then 22 # bold
             when 3 then 23 # italic
             when 4 then 24 # underline
             when 5 then 25 # blink
             when 7 then 27 # reverse_color
             else 0
             end
      "\e[#{color_code}m#{self}\e[#{type}m"
    end
  end
end
