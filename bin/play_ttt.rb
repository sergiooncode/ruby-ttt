#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'game'
require 'cli'
# cli = Cli.new
game = Game.new(Cli.new)
game.start
game.run
game.finish
