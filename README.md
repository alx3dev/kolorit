# Kolorit

Colorize terminal output. Linux-Mac only, Windows coming soon. I was working on [CTFC gem](https://www.github.com/alx3dev/ctfc), and noticed that `colorize gem`
is registered under *GPLv2 license*. I started on new one, [and credits go here](https://stackoverflow.com/questions/1489183/how-can-i-use-ruby-to-colorize-the-text-output-to-a-terminal/11482430#11482430) for time-saving.

TO-DO: documentation

Install:
```bash
gem install kolorit
```

Usage:
```ruby
# This will check for your OS,
# and include color methods in core String class

require 'kolorit'

# Now you can use:

'my_string'.green
'my_string'.cyan.bold
'my_string'.black.underline
```
If you don't want to override `String` class, you can **require and include** only Linux module:

```ruby
# This do not check for OS
# Require only file with methods for your OS

require 'kolorit/linux'

# Include module so you can use color methods

include Kolorit::Linux

# Now you can use:

'this is red string'.red
```
