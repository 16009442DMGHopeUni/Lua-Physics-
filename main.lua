local menuengine = require "menuengine"
local gameState = require "Game"
local optionsState = require "options"

game = gameState:create()
option = optionsState:create()

currentState = "Menu"

local Text = ""

-- Mainmenu
local mainmenu

-- Start Game
local function start_game()
    Text = "Start Game was selected!"
	currentState = "Game"
end

-- Options
local function options()
	currentState = "options"
end

-- Quit Game
local function quit_game()
   love.event.quit()
end

function love.load()
    
    love.graphics.setFont(love.graphics.newFont(40))

    mainmenu = menuengine.new(450,100)
    mainmenu:addEntry("Start Game", start_game)
    mainmenu:addEntry("How to Play", options)
    mainmenu:addSep()
    mainmenu:addEntry("Quit Game", quit_game)
	
	game:load()
	option:load()
end

function love.update(dt)
	if currentState == "Menu" then
		mainmenu:update()
	elseif currentState == "Game" then
		game:update(dt)
	elseif currentState == "options" then
		option:update(dt)
	end
end

function love.draw()
    love.graphics.clear()
    love.graphics.print(Text)
	if currentState == "Menu" then
		mainmenu:draw()
	elseif currentState == "Game" then
		game:draw()
	elseif currentState == "options" then
		option:draw()
	end
end

function love.keypressed(key, scancode, isrepeat)
    menuengine.keypressed(scancode)

    if scancode == "escape" then
        love.event.quit()
    end
end

function love.mousemoved(x, y, dx, dy, istouch)
    menuengine.mousemoved(x, y)
end
