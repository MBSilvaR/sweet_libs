require "gosu"

require_relative "lib/sprite"
require_relative "lib/bullet"
require_relative "lib/ship"
require_relative "lib/target"
require_relative "lib/main"

module Invaders

      $game = Invaders::Game.new
      $game.begin!

end
