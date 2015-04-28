# Rypto

[![Gem Version](https://badge.fury.io/rb/rypto.svg)](http://badge.fury.io/rb/rypto)
[![Build Status](https://travis-ci.org/sortelli/rypto.svg?branch=develop)](https://travis-ci.org/sortelli/rypto)
[![Dependency Status](https://gemnasium.com/sortelli/rypto.svg)](https://gemnasium.com/sortelli/rypto)


A ruby gem library that provides an API for solving hands from the
Krypto card game.  Read more about
[Krypto](http://en.wikipedia.org/wiki/Krypto_%28game%29).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rypto'
```

And then execute:

```bash
% bundle install
```

Or install it yourself as:

```bash
% gem install rypto
```

## Examples

### Deal a hand of Krypto

This example shows creating a deck, dealing a hand of Krypto, and
inspecting the possible solutions to the hand.

```ruby
require 'rypto'

deck = Rypto::Deck.new

#Deal a random hand from the deck (removes dealt cards from deck)
hand = deck.deal_hand

#Print results in infix notation
puts hand.solve.infix
```

This will output:

```
(19 + 4 - 23) * 14 + 8 = 8
(19 + 4 - 23) / 14 + 8 = 8
(19 - 23 - 4) * 14 + 8 = 8
(19 - 23 - 4) / 14 + 8 = 8
(19 - 23 - 14 + 8) * 4 = 8
(19 - 23 - 14 - 8) * 4 = 8
(19 - 23 - 14 - 8) * 4 = 8
19 - 23 - 14 - 8 / 4 = 8
19 - 23 - 14 + 8 / 4 = 8
19 - 23 - 14 - 8 / 4 = 8
...results truncated...
```

### Solve a specific hand of Krypto

One can create a hand manually to solve a specific Krypto deal.

```ruby
hand = Rypto::Hand.new [1,2,3,4,5], 6

#Print results in postfix notation
puts hand.solve.postfix
```

This will output:

```
1 2 + 3 4 + 5 - * = 6
1 2 3 + 4 - 5 + * = 6
1 2 3 + 4 - * 5 + = 6
1 2 3 + 4 - 5 * + = 6
1 2 3 + 4 - / 5 + = 6
1 2 3 + * 4 - 5 + = 6
1 2 3 * 4 + + 5 - = 6
1 2 3 * + 4 + 5 - = 6
1 2 * 3 + 4 - 5 + = 6
1 2 3 * 4 + 5 - + = 6
...results truncated...
```

## License

Copyright (c) 2015 Joe Sortelli

MIT License
