# frozen_string_literal: true

require_relative 'version' unless defined? Kolorit::VERSION

module Kolorit
  ##
  # Color codes for Linux systems.
  # Allow use of color methods in many different ways.
  #
  # Include methods outside of main module to use them directly
  # on string (or integer, array, hash). This is done when you call
  # `require 'kolorit'`. You can also just include it in class
  # where you want to use it:
  #
  # @example Include Kolorit::Linux in just one class
  #
  #   class MyClass
  #     require 'kolorit/linux'
  #     include Kolorit::Linux
  #     # rest_of_code
  #   end
  #
  # @example Use color named methods
  #
  #   red 'Hello Red Ruby!'
  #   # or
  #   green 'Hello Green Ruby!'
  #
  # @example Use colorize/kolorize methods
  #
  #   colorize :red, 'Hello Red Ruby!'
  #   # or
  #   kolorize 'Ruby goes green, again!', :green
  #
  # @example Colorize also accept block
  #
  #   # colorize accept color as first argument
  #
  #   colorize(:green) do
  #     case @var = SomeClass.call_some_method
  #     when 'some response'
  #       "do_something_with_response #{@var}"
  #     else
  #       # in this situation #red has precedence over #green
  #       red("Returned Error for #{@var}")
  #     end
  #   end
  #
  #   # kolorize accept string as first argument
  #
  #   kolorize(@result) { @result.is_a?(String) ? :green : :red }
  #
  # @see Kolorit
  # @see https://www.github.com/alx3dev/kolorit/README.md
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

    def kolor(color, param = nil)
      param = self if param.nil?
      return param unless Kolorit.enabled?

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

      string = "\e[#{color}m#{param}\e[#{style}m"
      case Kolorit.output?
        when :puts  then puts string
        when :print then print string
      end unless (1..7).include? color
      string
    end
  end
  ##
  # Lookup for color-code by name.
  #
  Kolors = { red: 31, green: 32, yellow: 33,
             blue: 34, pink: 35, cyan: 36,
             gray: 37, bold: 1, italic: 3,
             underline: 4, blink: 5, inverse: 7 }.freeze
end
