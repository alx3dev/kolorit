# Kolorit

![GIF Preview](demo.gif)

Still in early development stage, meaning windows support should come in near future.
For now, windows 10 users should be able to use it with `win32console` gem, but it's not tested yet.

Gem work with `Ruby 2.6 >`. It's almost compatible with `colorize` gem, but some colors are not implemented yet
_(light blue, light green ...)_, and background colors.

You should call `String#red` not `String#colorize(:red)`, it takes more resources.
#### TO-DO: documentation
[some badly written docs](https://rubydoc.info/gems/kolorit/0.1.5)

GitHub repo is always updated before rubygems.
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

 - Include kolorit methods, allow use on string, integer, array, hash

```ruby
require 'kolorit'

'this is red string'.red

'this is bold cyan string'.bold.cyan

colorize :blue, 'params'
```

 - Inlcude kolorit module to be used where you need it

```ruby
require 'kolorit/linux' # or 'kolorit/windows'

include Kolorit::Linux # or ::Windows

blue 'some string'
red 'red bold string'
```

`#colorize` accept color as argument, and string as second  
`#kolorize` accept string as argument and color as second

Both of this methods also accept block - Colorize block should return `:color`,
while `#kolorize` block should return string to be colored.

```ruby
colorize(:red) do
  if some_variable > 10
    puts 'more then 10'
  else
    puts 'less then 10'.bold
  end
end

@var = true
colorize(:bold) { @var.is_a?(TrueClass) ? :green : :red }
```

```ruby
kolorize('some_variable') do
  if some_variable > 10
    :green
  else
    :red
  end
end

@var = 'SUCCESS!'
kolorize(@var) { @var.nil? ? :red : :green }
```
