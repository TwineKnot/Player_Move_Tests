local Quad = love.graphics.newQuad

player = {}

function playerLoad()
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
	tTimer = 0
	animate = false
	isMoving = false
	direction = "sW"
	running = false
	turning = false
	player.x = 256
	player.y = 384
	act_x = 256
	act_y = 384
	player.w = 128
	player.h = 128
	wWCount = 0 ; wWMove = false;
	sWCount = 0 ; sWMove = false;
	dWCount = 0 ; dWMove = false;
	aWCount = 0 ; aWMove = false;
	wRCount = 0 ; wRMove = false;
	sRCount = 0 ; sRMove = false;
	dRCount = 0 ; dRMove = false;
	aRCount = 0 ; aRMove = false;

	
	
end
	
function playerUpdate(dt)
	
	if animate then
		timer = timer + dt
		if timer > 0.2 then -- adjust to change animation speed. may want to separate into 2 timers for each
			timer = 0
			iterator = iterator + 1
			if iterator > max then
				iterator = 2
			end
		end
	end

	if turning then
		tTimer = tTimer + dt
			if tTimer > 0.1 then
				turning = false
				tTimer = 0
			end
	end
	
	if love.keyboard.isDown("x") then
		running = true
	else
		running = false
	end
	
		if love.keyboard.isDown("w") and running == false and turning == false and isMoving == false then
			animate = true
			direction = "wW"
			wWMove = true
			isMoving = true

		else if love.keyboard.isDown("s") and running == false and turning == false and isMoving == false then
			animate = true
			direction = "sW"
			sWMove = true
			isMoving = true
			
		else if love.keyboard.isDown("a") and running == false and turning == false and isMoving == false then
			animate = true
			direction = "aW"
			aWMove = true
			isMoving = true
	
		else if love.keyboard.isDown("d") and running == false and turning == false and isMoving == false then
			animate = true
			direction = "dW"
			dWMove = true
			isMoving = true

		end
		end
		end
		end
		
	
		if love.keyboard.isDown("w") and running == true and turning == false and isMoving == false then
			animate = true
			direction = "wR"
			wRMove = true
			isMoving = true

		else if love.keyboard.isDown("s") and running == true and turning == false and isMoving == false then
			animate = true
			direction = "sR"
			sRMove = true
			isMoving = true
		
		elseif love.keyboard.isDown("a") and running == true and turning == false and isMoving == false then
			animate = true
			direction = "aR"
			aRMove = true
			isMoving = true

			
		else if love.keyboard.isDown("d") and running == true and turning == false and isMoving == false then
			animate = true
			direction = "dR"
			dRMove = true
			isMoving = true
		
		end
		end
		end
		if isMoving == true then playerMove(dt) end
		if love.keyboard.isDown("w") == false and love.keyboard.isDown("s") == false and love.keyboard.isDown("a") == false and love.keyboard.isDown("d") == false and animate == false then
	iterator = 1
	end
	end

function playerMove(dt)
			if wWMove == true and wRMove == false then			
			wWCount = wWCount + 4
			player.y = player.y - 4
			if wWCount >= 128 then
				wWCount = 0
				animate = false
				isMoving = false
				wWMove = false
			end

			
			elseif sWMove == true and sRMove == false then
			sWCount = sWCount + 4
			player.y = player.y + 4
			if sWCount >= 128 then
				sWCount = 0
				animate = false
				isMoving = false
				sWMove = false
			end


			elseif aWMove == true and aRMove == false then
			aWCount = aWCount + 4
			player.x = player.x - 4
			if aWCount >= 128 then
				aWCount = 0
				animate = false
				isMoving = false
				aWMove = false
			end
			
			
			elseif dWMove == true and dRMove == false then
			dWCount = dWCount + 4
			player.x = player.x + 4
			if dWCount >= 128 then
				dWCount = 0
				animate = false
				isMoving = false
				dWMove = false
			end
			end


			
			if wRMove == true and wWMove == false then
			wRCount = wRCount + 8
			player.y = player.y - 8
			if wRCount >= 128 then
				wRCount = 0
				animate = false
				isMoving = false
				wRMove = false
			end

			
			elseif sRMove == true and sWMove == false then
			sRCount = sRCount + 8
			player.y = player.y + 8
			if sRCount >= 128 then
				sRCount = 0
				animate = false
				isMoving = false
				sRMove = false
			end


			elseif aRMove == true and aWMove == false then
			aRCount = aRCount + 8
			player.x = player.x - 8
			if aRCount >= 128 then
				aRCount = 0
				animate = false
				isMoving = false
				aRMove = false
			end
			
			elseif dRMove == true and dWMove == false then
			dRCount = dRCount + 8
			player.x = player.x + 8
			if dRCount >= 128 then
				dRCount = 0
				animate = false
				isMoving = false
				dRMove = false
			end
			end
end

function playerDraw()
		love.graphics.draw(sprite, quads[direction][iterator], player.x, player.y)
end

function love.keypressed(key) -- this is good
	if key == "w" and isMoving == false then
		turning = true
		direction = "wW"	
	
	else if key == "s" and isMoving == false then
		turning = true
		direction = "sW"	
	
	else if key == "a" and isMoving == false then
		turning = true
		direction = "aW"	
	
	else if key == "d" and isMoving == false then
		turning = true
		direction = "dW"	
	end
	end
	end
	end
end