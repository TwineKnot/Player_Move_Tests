local Quad = love.graphics.newQuad

function love.load()
	sprite = love.graphics.newImage "res/testplayersheet.png"
	quads = {
		sW = {
			Quad( 0,   0, 192, 256, 1984, 2048);
			Quad( 256,   0, 192, 256, 1984, 2048);
			Quad( 512,   0, 192, 256, 1984, 2048);
			Quad( 768,   0, 192, 256, 1984, 2048);
			Quad( 1024,   0, 192, 256, 1984, 2048);
			Quad( 1280,   0, 192, 256, 1984, 2048);
			Quad( 1536,   0, 192, 256, 1984, 2048);
			Quad( 1792,   0, 192, 256, 1984, 2048);
		};
		
		sR = {
			Quad( 0,   0, 192, 256, 1984, 2048); -- same as standing. need for key release
			Quad( 256,   256, 192, 256, 1984, 2048);
			Quad( 512,   256, 192, 256, 1984, 2048);
			Quad( 768,   256, 192, 256, 1984, 2048);
			Quad( 1024,   256, 192, 256, 1984, 2048);
			Quad( 1280,   256, 192, 256, 1984, 2048);
			Quad( 1536,   256, 192, 256, 1984, 2048);
			Quad( 1792,   256, 192, 256, 1984, 2048);
		};
		
		wW = {
			Quad( 0,   512, 192, 256, 1984, 2048);
			Quad( 256,   512, 192, 256, 1984, 2048);
			Quad( 512,   512, 192, 256, 1984, 2048);
			Quad( 768,   512, 192, 256, 1984, 2048);
			Quad( 1024,   512, 192, 256, 1984, 2048);
			Quad( 1280,   512, 192, 256, 1984, 2048);
			Quad( 1536,   512, 192, 256, 1984, 2048);
			Quad( 1792,   512, 192, 256, 1984, 2048);
		};
		
		wR = {
			Quad( 0,   512, 192, 256, 1984, 2048); -- sas
			Quad( 256,   768, 192, 256, 1984, 2048);
			Quad( 512,   768, 192, 256, 1984, 2048);
			Quad( 768,   768, 192, 256, 1984, 2048);
			Quad( 1024,   768, 192, 256, 1984, 2048);
			Quad( 1280,   768, 192, 256, 1984, 2048);
			Quad( 1536,   768, 192, 256, 1984, 2048);
			Quad( 1792,   768, 192, 256, 1984, 2048);
		};
		
		aW = {
			Quad( 0,   1024, 192, 256, 1984, 2048);
			Quad( 256,   1024, 192, 256, 1984, 2048);
			Quad( 512,   1024, 192, 256, 1984, 2048);
			Quad( 768,   1024, 192, 256, 1984, 2048);
			Quad( 1024,   1024, 192, 256, 1984, 2048);
			Quad( 1280,   1024, 192, 256, 1984, 2048);
			Quad( 1536,   1024, 192, 256, 1984, 2048);
			Quad( 1792,   1024, 192, 256, 1984, 2048);
		};

		aR = {
			Quad( 0,   1024, 192, 256, 1984, 2048); --sas
			Quad( 256,   1280, 192, 256, 1984, 2048);
			Quad( 512,   1280, 192, 256, 1984, 2048);
			Quad( 768,   1280, 192, 256, 1984, 2048);
			Quad( 1024,   1280, 192, 256, 1984, 2048);
			Quad( 1280,   1280, 192, 256, 1984, 2048);
			Quad( 1536,   1280, 192, 256, 1984, 2048);
			Quad( 1792,   1280, 192, 256, 1984, 2048);
		};
		
		dW = {
			Quad( 0,   1536, 192, 256, 1984, 2048);
			Quad( 256,   1536, 192, 256, 1984, 2048);
			Quad( 512,   1536, 192, 256, 1984, 2048);
			Quad( 768,   1536, 192, 256, 1984, 2048);
			Quad( 1024,   1536, 192, 256, 1984, 2048);
			Quad( 1280,   1536, 192, 256, 1984, 2048);
			Quad( 1536,   1536, 192, 256, 1984, 2048);
			Quad( 1792,   1536, 192, 256, 1984, 2048);
		};
		
		dR = {
			Quad( 0,   1536, 192, 256, 1984, 2048); --sas
			Quad( 256,   1792, 192, 256, 1984, 2048);
			Quad( 512,   1792, 192, 256, 1984, 2048);
			Quad( 768,   1792, 192, 256, 1984, 2048);
			Quad( 1024,   1792, 192, 256, 1984, 2048);
			Quad( 1280,   1792, 192, 256, 1984, 2048);
			Quad( 1536,   1792, 192, 256, 1984, 2048);
			Quad( 1792,   1792, 192, 256, 1984, 2048);
		};
	}
	iterator = 1
	max = 8
	timer = 0
	moving = false
	direction = "sW"
	running = false
	
end

function love.update(dt)
	if moving then
		timer = timer + dt
		if timer > 0.2 then
			timer = 0
			iterator = iterator + 1
			if iterator > max then
				iterator = 2
			end
		end
	end
	
	if love.keyboard.isDown("x") then
		running = true
	else
		running = false
	end
	
		if love.keyboard.isDown("w") and running == false then
			moving = true
			direction = "wW"
		else if love.keyboard.isDown("s") and running == false then
			moving = true
			direction = "sW"
		else if love.keyboard.isDown("a") and running == false then
			moving = true
			direction = "aW"
		else if love.keyboard.isDown("d") and running == false then
			moving = true
			direction = "dW"			
		end
		end
		end
		end
		
	
		if love.keyboard.isDown("w") and running == true then
			moving = true
			direction = "wR"
		else if love.keyboard.isDown("s") and running == true then
			moving = true
			direction = "sR"
		else if love.keyboard.isDown("a") and running == true then
			moving = true
			direction = "aR"
		else if love.keyboard.isDown("d") and running == true then
			moving = true
			direction = "dR"
		end
		end
		end
		end
end

function love.draw()
    for x = 1, 10 do
       for y = 1, 10 do
          love.graphics.rectangle("line", x * 128, y * 128, 128, 128)
       end 
    end
	love.graphics.draw(sprite, quads[direction][iterator], 256, 256)
end

--[[function love.keypressed(key)
	if key == "w" and running == false then --and key does not equal a or d (if need)
		moving = true
		direction = "wW"
	elseif key =="s" then
		moving = true
		direction = "sW"
	elseif key =="a" then
		moving = true
		direction = "aW"
	elseif key =="d" then
		moving = true
		direction = "dW"
	elseif key == "w" and running == true then
		moving = true
		direction = "wR"
	end
end]]

function love.keyreleased(key)
	if key == "w" and direction == "wW" or key == "s" and direction == "sW" or key == "d" and direction == "dW" or key == "a" and direction == "aW" or key == "w" and direction == "wR" or key == "s" and direction == "sR" or key == "d" and direction == "dR" or key == "a" and direction == "aR" then
		moving = false
		iterator = 1
		
	end
end