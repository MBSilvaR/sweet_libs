class Player
  def initialize
    @image = Gosu::Image.new("img/chopsticks.png")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  def accelerate_down
    @vel_x += Gosu::offset_x(@angle, -0.5)
    @vel_y += Gosu::offset_y(@angle, -0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= WIDTH
    @y %= HEIGHT

    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def score
      @score
    end

  def draw
    @image.draw_rot(@x, @y, ZOrder::Player, @angle)
  end

  def collect_sushi(sushi)
    sushi.reject! do |sushis|
      if Gosu::distance(@x, @y, sushis.x, sushis.y) < 35 then
        @score += 10
        true
      else
        false
      end
end
end

end
