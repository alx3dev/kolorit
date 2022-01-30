# frozen_string_literal: true

module Kolorit
  ##
  # Color codes for linux systems.
  # Allow use of color methods when included in class.
  # @see Kolorit
  # @see https://www.github.com/alx3dev/kolorit/README.md
  #
  # @todo Use `def red = kolor(int)` in ruby > 3.0
  #
  module Linux
    def red
      kolor(31)
    end

    def green
      kolor(32)
    end

    def yellow
      kolor(33)
    end

    def blue
      kolor(34)
    end

    def pink
      kolor(35)
    end

    def cyan
      kolor(36)
    end

    def gray
      kolor(37)
    end

    def bold
      kolor(1)
    end

    def italic
      kolor(3)
    end

    def underline
      kolor(4)
    end

    def blink
      kolor(5)
    end

    def reverse_color
      kolor(7)
    end
    alias inverse reverse_color

    # @depreceated Use direct color methods instead => String#red, String#blue ...
    # this is part of code that make rubocop sad
    def colorize(clr)
      case clr.to_sym
      when :red then red
      when :green then green
      when :yellow then yellow
      when :blue then blue
      when :pink then pink
      when :cyan then cyan
      when :gray then gray
      when :bold then bold
      when :italic then italic
      when :underline then underline
      when :blink then blink
      when :reverse_color, :inverse then reverse_color
      else self
      end
    end

    private

    def kolor(color_code)
      style = case color_code
              when 1 then 22 # bold
              when 3 then 23 # italic
              when 4 then 24 # underline
              when 5 then 25 # blink
              when 7 then 27 # reverse_kolor
              else 0
              end
      "\e[#{color_code}m#{self}\e[#{style}m"
    end
  end
end
