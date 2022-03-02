# Tic Tac Toe

Tic-tac-toe is played on a three-by-three grid by two players, who alternately place the marks X and O in one of the nine spaces in the grid. The winner is the first to get three marks in a row, or draw when all nine spaces are filled.
It is convention that the 'X' plays first. 



## Table of Contents

  - [Functional Requirements](#functional-requirements)
  - [Run game](#run-game)
  - [Run tests](#run-game)
  - [Tech Stack](#tech-stack)
  - [Process](#process)
  - [Errors](#errors)
  - [Resources](#resources)

## Functional Requirements

*Step 1*
Create a walking skeleton for the game of tic-tac-toe, that includes the following:

- [ ] A new repository that is checked into version control and accessible to the mentoring team.
- [ ] Any relevant packages are managed by a package manager rather than copy/pasted into the repo.
- [ ] A single passing test (this might be a dummy test that asserts true equals true).
- [ ] A detailed README outlining how to run the app and tests.
- [ ] A continuous integration service that runs the test suite upon every commit. One suggestion is to use GitHub and GitHub Actions.
- [ ] A simple message that is displayed on the console when the app is run (e.g. "Welcome to Tic-Tac-Toe").

## Run game
The following steps will allow you to run the game in your terminal.
1. Clone repository `git clone git@github.com:fi-ya/tic-tac-toe-ruby.git`
2. Check to see if you have the correct version of Ruby (3.1.0) installed `ruby --version`
   - If not, you can use a software version manager like [chruby](https://github.com/postmodern/chruby), [rvm](https://rvm.io/), [rbenv](https://github.com/rbenv/rbenv). For more information on which one is best for you check [this blog](https://mac.install.guide/ruby/index.html) or follow [this guide](https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/#step-2-install-chruby-and-the-latest-ruby-with-ruby-install)
3. Install dependencies requirements with `bundle install`
4. Run application with `ruby lib/board.rb`
5. Have fun playing!
## Run tests
Run the following command in the terminal to run the Rspec test suite:

`rspec`
## Tech Stack
- Ruby 3.1.0
- Rspec 3.11
- Bundler 2.3.7
- Git 2.35.1
## Process
 
 *Step 1* - Create a walking skeleton 
 `A Walking Skeleton is a tiny implementation of the system that performs a small end-to-end function. It need not use the final architecture, but it should link together the main architectural components. The architecture and the functionality can then evolve in parallel. - Alistair Cockburn`

## Errors

## Resources 
- [GitHub CI Guide](https://docs.github.com/en/actions/automating-builds-and-tests/about-continuous-integration)
- []()
- []()