# Tic Tac Toe

Tic-tac-toe is played on a three-by-three grid by two players, who alternately place the marks X and O in one of the nine spaces in the grid. The winner is the first to get three marks in a row, or draw when all nine spaces are filled.
It is convention that the 'X' plays first. 



## Table of Contents

  - [Run game](#run-game)
  - [Run tests](#run-game)
  - [Tech Stack](#tech-stack)
  - [Features](#features)
  - [Resources](#resources)

## Run game
The following steps will allow you to run the game in your terminal.
1. Clone repository `git clone git@github.com:fi-ya/tic-tac-toe-ruby.git`
2. Check to see if you have the correct version of Ruby (3.1.0) installed `ruby --version`
   - If not, you can use a software version manager like [chruby](https://github.com/postmodern/chruby), [rvm](https://rvm.io/), [rbenv](https://github.com/rbenv/rbenv). For more information on which one is best for you check [this blog](https://mac.install.guide/ruby/index.html) or follow [this guide](https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/#step-2-install-chruby-and-the-latest-ruby-with-ruby-install)
3. Install dependencies requirements with `bundle install`
4. Run application with `ruby ./lib/run_game.rb`
5. Have fun playing!
## Run tests
Run the following command in the terminal to run the Rspec test suite:

`rspec`

To view code coverage report run command
`open coverage/index.html`
## Tech Stack
- [Ruby](https://www.ruby-lang.org/en/) 3.1.0
- [Rspec](https://relishapp.com/rspec) 3.11
- [Bundler](https://bundler.io/) 2.3.7
- [Git](https://git-scm.com/) 2.35.1
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)
- [RuboCop](https://rubocop.org/)
## Features
 - Human vs Human game
 - Computer vs Human game
 - Players can create custom markers

## Resources 
- [GitHub CI Guide](https://docs.github.com/en/actions/automating-builds-and-tests/about-continuous-integration)
- [SimpleCov - Code coverage analysis tool for Ruby]https://github.com/simplecov-ruby/simplecov()
- [RuboCop - The Ruby Linter/Formatter that Serves and Protects](https://rubocop.org/)