# Kolorit

![GIF Preview](demo.gif)

Still in early development stage, meaning windows support should come in near future.
For now, windows 10 users should be able to use it with `win32console` gem, but it's not tested yet.

Gem work with `Ruby 2.6 >`. It's almost compatible with `colorize` gem, but some colors are not implemented yet
_(light blue, light green ...), and background colors.

You should call `String#red` not `String#colorize(:red)', it takes more resources.
#### TO-DO: documentation
[some badly written docs](https://rubydoc.info/gems/kolorit/0.1.5)

GitHub repo is always updated before rubygems
```bash
git clone https://www.github.com/alx3dev/kolorit.git
cd kolorit
bundle install
```

Install from rubygems:
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
