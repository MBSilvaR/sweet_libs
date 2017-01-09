module Invaders
  class Target

    include Sprite

    def initialize(num)
      self.initialize_sprite
      @x = rand($game.width)
      @y = -80
      @z = 1
      @image = $game.images[:"enemy"]
      @radius = 20
      @delta = num

      @speed_x = [-1, 1].sample * rand(50)
      @speed_y = 100 + rand(200)
    end

    def update
      @x += @speed_x * $game.delta
      @y += @speed_y * $game.delta

      $game.ship.kill! if self.colliding?($game.ship)

      self.kill! if @y > $game.height + 25
    end

  end
end
