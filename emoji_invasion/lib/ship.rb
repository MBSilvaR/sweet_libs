module Invaders
  class Ship

  include Sprite
  SPEED = 350

  def initialize
    self.initialize_sprite
    @x = $game.width / 2
    @y = $game.height - 260
    @image = $game.images[:ship]
    @z = 10
    @radius = 30
  end

  def update
    @y -= SPEED * $game.delta if $game.button_down?(Gosu::KbUp)
    @y += SPEED * $game.delta if $game.button_down?(Gosu::KbDown)
    @x -= SPEED * $game.delta if $game.button_down?(Gosu::KbLeft)
    @x += SPEED * $game.delta if $game.button_down?(Gosu::KbRight)
  end

end
end
