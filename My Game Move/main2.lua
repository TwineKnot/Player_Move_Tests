local Quad = love.graphics.newQuad

function love.load()
	love.graphics.newFont(12)

    player = {
	x = 256,
	y = 256,
	speed = 1,
	}
	sprite = love.graphics.newImage "res/testplayersheet.png"
	quads = {
		s = {
			Quad( 0,   0, 192, 256, 2304, 1536);
			Quad( 256,   0, 192, 256, 2304, 1536);
			Quad( 512,   0, 192, 256, 2304, 1536);
			Quad( 768,   0, 192, 256, 2304, 1536);
			Quad( 1024,   0, 192, 256, 2304, 1536);
			Quad( 1280,   0, 192, 256, 2304, 1536);
			Quad( 1536,   0, 192, 256, 2304, 1536);
			Quad( 1792,   0, 192, 256, 2304, 1536);
		};
		w = {
			Quad( 0,   384, 192, 256, 2304, 1536);
			Quad( 256, 384, 192, 256, 2304, 1536);
			Quad( 512,   384, 192, 256, 2304, 1536);
			Quad( 768,   384, 192, 256, 2304, 1536);
			Quad( 1024,   384, 192, 256, 2304, 1536);
			Quad( 1280,   384, 192, 256, 2304, 1536);
			Quad( 1536,   384, 192, 256, 2304, 1536);
			Quad( 1792,   384, 192, 256, 2304, 1536);
		};
		d = {
			Quad( 0,   768, 192, 256, 2304, 1536);
			Quad( 256, 768, 192, 256, 2304, 1536);
			Quad( 512,   768, 192, 256, 2304, 1536);
			Quad( 768,   768, 192, 256, 2304, 1536);
			Quad( 1024,   768, 192, 256, 2304, 1536);
			Quad( 1280,   768, 192, 256, 2304, 1536);
			Quad( 1536,   768, 192, 256, 2304, 1536);
			Quad( 1792,   768, 192, 256, 2304, 1536);
		};
		a = {
			Quad( 0,   1152, 192, 256, 2304, 1536);
			Quad( 256, 1152, 192, 256, 2304, 1536);
			Quad( 512,   1152, 192, 256, 2304, 1536);
			Quad( 768,   1152, 192, 256, 2304, 1536);
			Quad( 1024,   1152, 192, 256, 2304, 1536);
			Quad( 1280,   1152, 192, 256, 2304, 1536);
			Quad( 1536,   1152, 192, 256, 2304, 1536);
			Quad( 1792,   1152, 192, 256, 2304, 1536);
		};
	}
end
	
	moveOrTurn = false
	startTTime = false
	walkingAnimation = false
	moving = false
	isRunning = false
	direction = "s"
	anTimer = 0 -- animation dependant timer
	tTimer = 0 -- direction timer. if all goes as planned, the player can just press a button to change direction without walking
	iterator = 1
	max = 8
	
	
function love.update(dt)

	if walkingAnimation == true then
		anTimer = anTimer + dt
		if anTimer > 0.2 then -- speed of animation loop, smaller is faster
			anTimer = 0
			iterator = iterator + 1
			if iterator > max then
				iterator = 1
			end
		end
	end
	
	if startTTime == true then
		tTimer = tTimer + dt
			if tTimer > 1 then -- might need to take this out
				tTimer = 0
			end
		
	end
	
	-- Player Everything(animation, moving, turning)
	
	-- master run
	if love.keyboard.isDown("x")== true then
		isRunning = true
	
	end
	if love.keyreleased("x") then
		isRunning = false
	end
	
	
	-- timer for if player will turn or move
	
	-- this might need to be pressed
	if love.keyboard.isDown("w") then
		startTTime = true
		moveOrTurn = true
    elseif love.keyboard.isDown("s") then
		startTTime = true
		moveOrTurn = true
    end
    if love.keyboard.isDown("a") then
		startTTime = true
		moveOrTurn = true
    elseif love.keyboard.isDown("d") then
		startTTime = true
		moveOrTurn = true
    end
	
	-- player will turn
	
	if moveOrTurn == true and tTimer < 0.05 and move == false then -- will need adjusting once move is put in
		turn = key
		isTurn = false
		--startTTime = false prob not helpful
		--tTimer = 0
	end
	
	-- player will move
	
	if moveOrTurn == true and tTimer > 0.1 then
		moving = true
	end
	
	
	-- walking animation
	
function walkAnimation(dt)
	
	if love.keyboard.isDown("w") and isRunning == false and moving == true then
       direction = "w"
	   walkingAnimation = true
	   player.y = player.y - 10
	   
    elseif love.keyboard.isDown("s") and isRunning == false and moving == true then
       direction = "s"
	   walkingAnimation = true
	   player.y = player.y + 10
	   
    end
    if love.keyboard.isDown("a") and isRunning == false and moving == true then
		direction = "a"
		walkingAnimation = true
		
    elseif love.keyboard.isDown("d") and isRunning == false and moving == true then
		direction = "d"
		walkingAnimation = true
    end
end

	
	function runAnimation(dt)	
	-- running animation
	
		if love.keyboard.isDown("w") and isRunning == true and moving == true then
     
	   
		elseif love.keyboard.isDown("s") and isRunning == true and moving == true then
    
	   
		end
		if love.keyboard.isDown("a") and isRunning == true and moving == true then
    

		elseif love.keyboard.isDown("d") and isRunning == true and moving == true then
    

		end
	end

end

function love.keyreleased(key)
	if quads[key] and direction == key then -- only stop moving if we're still moving in only that direction. might need or later
	
		
		walkingAnimation = false
		moving = false
		direction = key
		turn = key
		iterator = 1
		moveOrTurn = false
		startTTime = false
		tTimer = 0
	end
	
end



function love.draw()
    for x = 1, 10 do
       for y = 1, 10 do
          love.graphics.rectangle("line", x * 128, y * 128, 128, 128)
       end 
    end
	love.graphics.draw(sprite, quads[direction][iterator], player.x, player.y) -- will need offset
end