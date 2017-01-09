# sweet_libs:

GOSU is a lightweight 2D game development library for Ruby and C++ that provides:
    - A window and main loop 
    - 2D graphics and text
    - Sound effects and music
    - Keyboard, mouse, gamepad input

Gosu helps you to get a better understanding of Object Oriented Programming. 

You can create your own games from scratch.

Steps:


1. Getting started

gem install gosu

mkdir rps
cd rps 

mkdir lib
mkdir img
touch main.rb

Every Gosu app starts with a class that derives from Gosu::Window, which creates a new window on your screen every time you run the game. Gosu::Window will also initialize all of gosu's core components.

``` Ruby ```
require 'gosu'

class GameWindow < Gosu::Window
def initialize
super WIDTH, HEIGHT
self.caption = "Sushi!!"
end


def update
end


def draw
end

window = GameWindow.new
window.show

```
If you want a fullscreen window instead of a predetermined height and width, run 
:fullscreen => true after the window height:

```Ruby```
class GameWindow < Gosu::Window
def initialize
super WIDTH, HEIGHT
 :fullscreen => true
self.caption = "Sushi!!"
end

```
2. update() and draw()

These two methods override Gosu::Window and allow Gosu to display the game elements on the screen.

#update and #draw are called 60 times per seconds by default.
update() contains the main game logic: move objects, handle collisions, etc.

Placing a puts statement inside the #update method will allow you to see the 60 calls per second.

```Ruby```
def update
puts "Testing fps for update"
end



3. show()

Then the main program follows:

window = GameWindow.new
window.show


The general structure of the window main loop:
---- screenshot



***PLAYER AND MOVEMENT

1. Player class 

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
end


2. z ordering

All drawing operations in Gosu accept a floating-point value called "z"
---- screenshot



3.  offset_x 
    offset_y

These properties determine the distance and movement of the cursor.
---- accelerate 



4. Keyboard and gamepad input

update () calls the player's movement methods.



5. Animations

Animations are sequences of images. We don't want to pass in constructor, as each sushi piece would load in the animation all over again.


6. Score

We draw the current score.

 






