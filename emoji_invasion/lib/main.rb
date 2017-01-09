require 'gosu'

module Invaders
  class Game < Gosu::Window

    attr_reader :images, :delta, :targets, :bullets, :ship

    SPEED = 400

    IMAGE_ASSETS = {
      background_stage: "images/stage.jpg",
      ship: "images/ship.png",
      bullet: "images/beam.jpg",
      enemy: "images/enemy.jpg",

    }

    def initialize
      super 480, 640
      self.caption = "Invaders: The Game"
      @images = {}

      @ship = nil
      @bullets = []
      @targets = []
      @screen = nil
      @space_y = -1050
      self.load_assets
    end

    def begin!
      self.setup_game
      @screen = :background_stage
      self.show
    end

    def draw

      if @screen == :background_stage
        @ship.draw
        @bullets.each {|bullet| bullet.draw }
        @targets.each {|enemy| enemy.draw }

        if @space_y < 0
          @space_y += SPEED * $game.delta
        else
          @space_y = -1050
        end

      end
    end

    def update
      if @screen == :background_stage
        self.update_delta
        self.spawn_targets

        @ship.update
        @bullets.each {|bullet| bullet.update }
        @targets.each {|enemy| enemy.update }

        self.handle_kills
      end
    end

    def button_up(key)
      if key == Gosu::KbEscape
        self.close
      end

      if @screen == :background_stage
        if key == Gosu::KbSpace
          self.shoot
        end
      end
    end

    protected

    def load_assets
      IMAGE_ASSETS.each do |key, value|
        @images[key] = Gosu::Image.new(value)
      end

    end

    def update_delta
      current_time = Gosu::milliseconds / 1000.0
      @delta = [current_time - @last_time, 0.25].min
      @last_time = current_time
    end

    def setup_game
      @last_time = Gosu::milliseconds / 1000.0
      @ship = Ship.new
    end

    def shoot
      @bullets.push(Bullet.new(@ship.x, @ship.y)) unless @ship.nil?
    end

    def spawn_targets
      if rand(50) < 50 * @delta
        @targets.push(Target.new(rand(3)+1))
      end
    end

    def handle_kills
      @targets.reject! {|x| x.killed? }
      @bullets.reject! {|x| x.killed? }
    end


  end
end
