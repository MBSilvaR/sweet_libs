  module Invaders
    class Bullet

    include Sprite
    SPEED = 400

    def initialize(x, y)
      self.initialize_sprite
      @image = $game.images[:bullet]
      @radius = 10
      @x = x
      @y = y
      @z = 1
    end

    def update
      @y -= SPEED * $game.delta

      $game.targets.each do |enemy|
        if self.colliding?(enemy)
          enemy.kill!
          self.kill!
        end
      end

      self.kill! if @y < -15
    end

  end
end
