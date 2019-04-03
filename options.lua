local optionsState = {}
	function optionsState:create()
		local options = {}

			function options:load()
				font3 = love.graphics.newFont(38)
			end
 
			function options:update(dt)
				if love.keyboard.isDown("e") then
					love.event.quit( "restart" )
				end
			end
 
			function options:draw()
				love.graphics.setFont(font3)
				love.graphics.setColor(0.5, 0.75, 0.75)
				love.graphics.print("									HOW TO PLAY							", 10, 5)
				love.graphics.setColor(1, 0, 0)
				love.graphics.print("Navigate the Sphere to One of the Rectangles on screen to complete", 10, 50)	--( >, ^ ) 
				love.graphics.setColor(0, 1, 0)
				love.graphics.print("   One Rectangle has a massive Restitution compared to all others ", 10, 100)
				love.graphics.setColor(0, 0, 1)
				love.graphics.print(" 1 Collision is allowed, following this. Be careful not to collide  ", 10, 150)
				love.graphics.setColor(1, 1, 0)
				love.graphics.print(" 			20 Collisions allowed, 2 Second Resting time  ", 10, 200)
				love.graphics.setColor(1, 0, 1)
				love.graphics.print("						  	 CONTROLS KEYBOARD & MOUSE						", 10, 300)
				love.graphics.setColor(0, 1, 1)
				love.graphics.print("Up, Down, Left and Right arrow keys control FORCE in selected direction  ", 10, 350)
				love.graphics.setColor(0.5, 0.5, 0)
				love.graphics.print(" 				 SPACE Applies More FORCE combining Up & Right  ", 10, 400)
				love.graphics.setColor(0, 0.5, 0.5)
				love.graphics.print("			W Adds Restitution, R Decreases Restitution, E Restarts ", 10, 450)
				love.graphics.setColor(0.5, 0.5, 0.5)
				love.graphics.print("		LEFT mouse click Applies a single massive hit of force Up & Right  ", 10, 500)
				love.graphics.setColor(1, 1, 1)
				love.graphics.print("							PRESS E to go Back to MAIN MENU   ", 10, 600)
			end
		return options 
	end 
return optionsState