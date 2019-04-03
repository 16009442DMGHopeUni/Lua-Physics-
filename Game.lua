local gameState = {}
function gameState:create()
	
	local game = {}
	function game:load()
		--Physics World Creation
		world = love.physics.newWorld(0, 100, true) -- (X, Y, Boolean)
		world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	
		--Local img Variable
		local img = love.graphics.newImage('fire.png')
				
		--sound variables
		sound = love.audio.newSource("Explosion1.wav", "static") -- the "static" tells LÖVE to load the file into memory, good for short sound effects
		sound:setVolume(0.7) -- 90% of ordinary volume
		sound:setPitch(0.5) -- one octave lower	
				
		--Font Variables 
		font1 = love.graphics.newFont(18)
		font2 = love.graphics.newFont(30)
	
		--Tables
		objects = {}
		objects.ball = {}
		objects.ground = {}
		objects.fixed = {}
		objects.fixed.static = {}
		objects.fixed.static1 = {}
		objects.fixed.static2 = {}
		objects.fixed.static3 = {}
		objects.fixed.static4 = {}
		objects.fixed.static5 = {}
		objects.fixed.static6 = {}
		objects.fixed.static7 = {}
		objects.fixed.static8 = {}
		objects.fixed.static9 = {}
		objects.fixed.static10 = {}
		objects.fixed.static11 = {}
		objects.fixed.static12 = {}
		objects.fixed.static13 = {}
		objects.fixed.static14 = {}
		objects.fixed.static15 = {}
	
		--Particle System
		psystem = love.graphics.newParticleSystem(img, 50)
		psystem:setParticleLifetime(20, 500) -- Particles live at least 2s and at most 5s.
		psystem:setEmissionRate(200)
		psystem:setSizeVariation(0.8)
		psystem:setLinearAcceleration(-20, -20, 20, 20) -- Random movement in all directions.
		psystem:setColors(1, 1, 1, 1, 1, 1, 1, 0) -- Fade to transparency.
		psystem:setEmitterLifetime(1000)
		psystem:setRotation( 1, 13 )
		
	
		--Shape Creation
		objects.ground.body = love.physics.newBody(world, 675, 660, "static") -- Physics world > Body > Fixture .
		objects.ground.shape = love.physics.newRectangleShape(1290,30)
		objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape) --Applies Fixture physics 
		objects.ground.fixture:setUserData("Ground") --Called later with b:getUserData 
	
		objects.ball.body = love.physics.newBody(world, 70, 80, "dynamic")
		objects.ball.body:setMass(10)
		objects.ball.shape = love.physics.newCircleShape(20)
		objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape)
		objects.ball.fixture:setRestitution(0.5)    -- Collision physics, > current value, increases bounciness 
		objects.ball.fixture:setUserData("Ball")
		
		objects.fixed.static.body = love.physics.newBody(world, 70, 480, "static")
		objects.fixed.static.shape = love.physics.newRectangleShape(100,20)
		objects.fixed.static.fixture = love.physics.newFixture(objects.fixed.static.body, objects.fixed.static.shape)
		objects.fixed.static.fixture:setUserData("Block")
		
		objects.fixed.static1.body = love.physics.newBody(world, 300, 400, "static")
		objects.fixed.static1.shape = love.physics.newRectangleShape(100,20)
		objects.fixed.static1.fixture = love.physics.newFixture(objects.fixed.static1.body, objects.fixed.static1.shape)
		objects.fixed.static1.fixture:setUserData("Block1")
		
		objects.fixed.static2.body = love.physics.newBody(world, 1200, 300, "static")
		objects.fixed.static2.shape = love.physics.newRectangleShape(100,20)
		objects.fixed.static2.fixture = love.physics.newFixture(objects.fixed.static2.body, objects.fixed.static2.shape)
		objects.fixed.static2.fixture:setUserData("Block2")
	
		objects.fixed.static3.body = love.physics.newBody(world, 15, 338, "static")
		objects.fixed.static3.shape = love.physics.newRectangleShape(30, 680)
		objects.fixed.static3.fixture = love.physics.newFixture(objects.fixed.static3.body, objects.fixed.static3.shape)
		objects.fixed.static3.fixture:setUserData("LEFT WALL")
	
		objects.fixed.static4.body = love.physics.newBody(world, 1335, 338, "static") --(>>) (^^) "Not Moveable"
		objects.fixed.static4.shape = love.physics.newRectangleShape(30,680)
		objects.fixed.static4.fixture = love.physics.newFixture(objects.fixed.static4.body, objects.fixed.static4.shape)
		objects.fixed.static4.fixture:setUserData("RIGHT WALL")
	
		objects.fixed.static5.body = love.physics.newBody(world, 675, 10, "static")
		objects.fixed.static5.shape = love.physics.newRectangleShape(1290, 30)
		objects.fixed.static5.fixture = love.physics.newFixture(objects.fixed.static5.body, objects.fixed.static5.shape)
		objects.fixed.static5.fixture:setUserData("CEILING")
	
		objects.fixed.static6.body = love.physics.newBody(world, 180, 320, "static")
		objects.fixed.static6.shape = love.physics.newRectangleShape(100,20)
		objects.fixed.static6.fixture = love.physics.newFixture(objects.fixed.static6.body, objects.fixed.static6.shape)
		objects.fixed.static6.fixture:setUserData("Block6")
	
		objects.fixed.static7.body = love.physics.newBody(world, 400, 250, "static")
		objects.fixed.static7.shape = love.physics.newRectangleShape(100,20)
		objects.fixed.static7.fixture = love.physics.newFixture(objects.fixed.static7.body, objects.fixed.static7.shape)
		objects.fixed.static7.fixture:setUserData("Block7")
	
		objects.fixed.static8.body = love.physics.newBody(world, 600, 320, "static")
		objects.fixed.static8.shape = love.physics.newRectangleShape(100,20)
		objects.fixed.static8.fixture = love.physics.newFixture(objects.fixed.static8.body, objects.fixed.static8.shape)
		objects.fixed.static8.fixture:setUserData("Block8")
			
		objects.fixed.static9.body = love.physics.newBody(world, 800, 320, "static")
		objects.fixed.static9.shape = love.physics.newRectangleShape(100,20)
		objects.fixed.static9.fixture = love.physics.newFixture(objects.fixed.static9.body, objects.fixed.static9.shape)
		objects.fixed.static9.fixture:setUserData("Block9")
	
		objects.fixed.static10.body = love.physics.newBody(world, 1000, 200, "static")
		objects.fixed.static10.shape = love.physics.newRectangleShape(150,20)
		objects.fixed.static10.fixture = love.physics.newFixture(objects.fixed.static10.body, objects.fixed.static10.shape)
		objects.fixed.static10.fixture:setUserData("Block10")
	
		objects.fixed.static11.body = love.physics.newBody(world, 900, 500, "static")
		objects.fixed.static11.shape = love.physics.newRectangleShape(150,20)
	
		--Text to Screen
		text       	= "" 
		textCounter = ""
	
		--Program Trackers
		persisting 	= 0    -- we'll use this to store the state of repeated callback calls
		counter 	= 20			
	end


	function game:update(dt)
		--Physics World Update
		world:update(dt)
	
		--Particle System Update
		psystem:update(dt)
	
		--Event Handlers 
		if love.keyboard.isDown("w") then
			objects.ball.fixture:setRestitution(0.8)
		end
		
		if love.keyboard.isDown("r") then
			objects.ball.fixture:setRestitution(0.4)
		end

		if love.keyboard.isDown("e") then
			love.event.quit( "restart" )
		end
	
		if love.keyboard.isDown("space") then
			objects.ball.body:applyForce(100, -350)
			sound:play()
		end
 
		if love.keyboard.isDown("right") then
			objects.ball.body:applyForce(100, 0)
		elseif love.keyboard.isDown("left") then
			objects.ball.body:applyForce(-100, 0)
		end
	
		if love.keyboard.isDown("up") then
			objects.ball.body:applyForce(0, -350)
		elseif love.keyboard.isDown("down") then
			objects.ball.body:applyForce(0, 350)
		end
 
		if string.len(text) > 500 then    --Cleanup text > 500
			text = ""
		end
	end


	function game:draw()
		--Shape Sizes & Color 
		love.graphics.setColor(0, 1, 1)
		love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
	
		love.graphics.setColor(0, 1, 0)
		love.graphics.circle("line", objects.ball.body:getX(),objects.ball.body:getY(), objects.ball.shape:getRadius(), 20)
	
		love.graphics.setColor(0, 0, 1)
		love.graphics.polygon("fill", objects.fixed.static.body:getWorldPoints(objects.fixed.static.shape:getPoints()))
	
		love.graphics.setColor(1, 1, 0)
		love.graphics.polygon("fill", objects.fixed.static1.body:getWorldPoints(objects.fixed.static1.shape:getPoints()))
	
		love.graphics.setColor(0, 1, 1)
		love.graphics.polygon("fill", objects.fixed.static2.body:getWorldPoints(objects.fixed.static2.shape:getPoints()))
	
		love.graphics.setColor(1, 0, 1)
		love.graphics.polygon("fill", objects.fixed.static3.body:getWorldPoints(objects.fixed.static3.shape:getPoints()))
	
		love.graphics.setColor(0.5, 0, 0)
		love.graphics.polygon("fill", objects.fixed.static4.body:getWorldPoints(objects.fixed.static4.shape:getPoints()))
	
		love.graphics.setColor(0, 0.5, 0)
		love.graphics.polygon("fill", objects.fixed.static5.body:getWorldPoints(objects.fixed.static5.shape:getPoints()))
	
		love.graphics.setColor(0, 0, 0.5)
		love.graphics.polygon("fill", objects.fixed.static6.body:getWorldPoints(objects.fixed.static6.shape:getPoints()))
	
		love.graphics.setColor(0.5, 0.5, 0)
		love.graphics.polygon("fill", objects.fixed.static7.body:getWorldPoints(objects.fixed.static7.shape:getPoints()))
	
		love.graphics.setColor(0, 0.5, 0.5)
		love.graphics.polygon("fill", objects.fixed.static8.body:getWorldPoints(objects.fixed.static8.shape:getPoints()))
	
		love.graphics.setColor(0.5, 0, 0.5)
		love.graphics.polygon("fill", objects.fixed.static9.body:getWorldPoints(objects.fixed.static9.shape:getPoints()))
	
		love.graphics.setColor(0.75, 0, 0)
		love.graphics.polygon("fill", objects.fixed.static10.body:getWorldPoints(objects.fixed.static10.shape:getPoints()))
	
		love.graphics.setColor(0, 0.75, 0)
		love.graphics.polygon("fill", objects.fixed.static11.body:getWorldPoints(objects.fixed.static11.shape:getPoints()))
	
		love.graphics.setFont(font1)
		love.graphics.setColor(1, 1, 1)
		love.graphics.print(text, 30, 580)
	
		love.graphics.setFont(font2)
		love.graphics.setColor(0, 0, 0)
		love.graphics.print(textCounter, 900, 645)
	
		love.graphics.draw(psystem, love.graphics.getWidth() * 0.5, love.graphics.getHeight() * 0.5)
	end

	--Functions
	function love.mousepressed(x, y, button, istouch)
		if button == 1 then -- Versions prior to 0.10.0 use the MouseConstant 'l'
			objects.ball.body:applyForce(9000, -27500)
		end
	end

	function beginContact(a, b, collision)
		x,y = collision:getNormal()
		text = a:getUserData()
			
		if text == "Block2" then 
			love.event.quit()
		end
		
		if text == "Ground" then 
			objects.ball.fixture:setRestitution(1.0)
		end
		
		if text == "CEILING" then 
			objects.ball.fixture:setRestitution(1.25)
		end
	
		text = text.." colliding with "..b:getUserData().." with a vector normal of: "..x..", "..y
		counter = counter - 1
		textCounter  = counter..": COLLISIONS REMAINING"
		sound:play()
		love.system.vibrate(0.5)	
	end	

	function endContact(a, b, collision)
		persisting = 0
		text = text.."\n"..a:getUserData().." uncolliding with "..b:getUserData()
	end
 
	function preSolve(a, b, collision)
		if persisting == 0 then    -- only say when they first start touching
			text = text.."\n"..a:getUserData().." touching "..b:getUserData()
		elseif persisting < 300 then    -- then just start counting
			text = text..","..persisting
		end
			
		persisting = persisting + 1    -- keep track of how many updates they've been touching for
	
		if persisting == 25 then
			love.event.quit( "restart" )
		end
	
		if counter == 0 then 
			love.event.quit( "restart" )
		end  
	end
 
	function postSolve(a, b, collision, normalimpulse, tangentimpulse)
		
	end
	return game 
end 
return gameState