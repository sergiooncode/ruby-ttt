#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'game'
game = Game.new
game.start
game.run
game.finish
