# frozen_string_literal: true

module Kolorit
  ##
  # Lookup for color-code by name
  #
  Kolors = { red: 31, green: 32, yellow: 33,
             blue: 34, pink: 35, cyan: 36,
             gray: 37, bold: 1, italic: 3,
             underline: 4, blink: 5, inverse: 7 }.freeze

  ##
  # Color codes for linux systems.
  # Allow use of color methods when included in class.
  # @see Kolorit
  # @see https://www.github.com/alx3dev/kolorit/README.md
  #
  # @todo Use `def red = kolor(int)` in ruby > 3.0
  #
  module Linux
    def red(str = nil);    kolor(31, str) end
    def green(str = nil);  kolor(32, str) end
    def yellow(str = nil); kolor(33, str) end
    def blue(str = nil);   kolor(34, str) end
    def pink(str = nil);   kolor(35, str) end
    def cyan(str = nil);   kolor(36, str) end
    def gray(str = nil);   kolor(37, str) end

    def bold(str = nil);           kolor(1, str) end
    def italic(str = nil);         kolor(3, str) end
    def underline(str = nil);      kolor(4, str) end
    def blink(str = nil);          kolor(5, str) end
    def reverse_color(str = nil);  kolor(7, str) end

    alias inverse reverse_color

    def colorize(color, string = nil, &blk)
      string = yield(blk) if block_given?
      kolor color, string
    end

    def kolorize(string, color = nil, &blk)
      color = block_given? ? yield(blk) : :cyan
      kolor color, string
    end

    private

    def kolor(color, string = nil)
      string = self if string.nil?
      color = Kolors[color.to_sym] unless color.is_a?(Integer)
      style =
        case color
        when 1 then 22 # bold
        when 3 then 23 # italic
        when 4 then 24 # underline
        when 5 then 25 # blink
        when 7 then 27 # reverse_kolor
        else 0
        end
      "\e[#{color}m#{string}\e[#{style}m"
    end
  end
end
