player {}

function playerLoad()
	sprite = love.graphics.newImage "sprite.png"
	
	walkQuad = {
		w = {
			Quad( 0,   0, 32, 48, 128, 192);
			Quad(32,   0, 32, 48, 128, 192);
			Quad(64,   0, 32, 48, 128, 192);
			Quad(96,   0, 32, 48, 128, 192);
		};
		a = {
			Quad( 0,  48, 32, 48, 128, 192);
			Quad(32,  48, 32, 48, 128, 192);
			Quad(64,  48, 32, 48, 128, 192);
			Quad(96,  48, 32, 48, 128, 192);
		};
		s = {
			Quad( 0,  96, 32, 48, 128, 192);
			Quad(32,  96, 32, 48, 128, 192);
			Quad(64,  96, 32, 48, 128, 192);
			Quad(96,  96, 32, 48, 128, 192);
		};
		d = {
			Quad( 0, 144, 32, 48, 128, 192);
			Quad(32, 144, 32, 48, 128, 192);
			Quad(64, 144, 32, 48, 128, 192);
			Quad(96, 144, 32, 48, 128, 192);
		};
	
	}
	iterator = 1
	max = 8 -- prob works because same number of frames for each movement, but maybe if need to + n...
	timer = 0
	moving = false
	direction = "s"
end

function playerUpdate(dt)
	if moving then
		timer = timer + dt
		if timer > 0.2 then -- speed of animation loop, smaller is faster
			timer = 0
			iterator = iterator + 1
			if iterator > max then
				iterator = 1
			end
		end
	end
end

function playerDraw()
	love.graphics.draw(sprite, quads[direction][iterator], 5, 5)
end

function love.keypressed(key)
	if quads[key] then -- this is really ugly. Don't do it like this in your final game.
		moving = true
		direction = key
	end
end

function love.keyreleased(key)
	if quads[key] and direction == key then -- only stop moving if we're still moving in only that direction.
		moving = false
		direction = key
		iterator = 1
	end
	
end

