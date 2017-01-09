require 'gosu'


require_relative 'lib/ZOrder.rb'
require_relative 'lib/player.rb'
require_relative 'lib/sushi.rb'
# require_relative 'lib/rice.rb'


WIDTH, HEIGHT = 1024, 555

class GameWindow < Gosu::Window
  def initialize
    super WIDTH, HEIGHT
    self.caption = "Sushi!!"

    @background_image = Gosu::Image.new('img/dataset-original.jpg',
                                        :tileable => true
                                        )
    @sushi_anim= Gosu::Image::load_tiles('img/sushi.png', 55, 55)
    # @rice_anim = Gosu::Image::load_tiles('img/rice.png', 150, 150)
    # @rice = Array.new
    @sushi = Array.new
    @player = Player.new
    @player.warp(200, 130)
    @font = Gosu::Font.new(20)

  end

  def update
    if Gosu::button_down? Gosu::KbLeft then
          @player.turn_left
        end
        if Gosu::button_down? Gosu::KbRight then
          @player.turn_right
        end
        if Gosu::button_down? Gosu::KbUp then
          @player.accelerate
        end
        if Gosu::button_down? Gosu::KbDown then
          @player.accelerate_down
        end

        @player.move
        @player.collect_sushi(@sushi)

    if rand(100) < 4 and @sushi.size < 25 then
          @sushi.push(Sushi.new(@sushi_anim))
        end

    # if rand(100) < 4 and @rice.size < 25 then
    #       @rice.push(Rice.new(@rice_anim))
    #     end
  end

  def draw
    @player.draw
    # @rice.each { |rice| rice.draw }
    @sushi.each { |sushi| sushi.draw }
    @background_image.draw(0, 0, ZOrder::Background)
    @font.draw("SCORE: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_000000)
    @font.draw("Sushi Game!! Developed with Gosu by Leslie, Fariha, James and Marcela", 175, 10, ZOrder::UI, 1.0, 1.0, 0xff_fff000)
  end

  def button_down(id)
      if id == Gosu::KbEscape
        close
      end
    end



end

window = GameWindow.new
window.show
