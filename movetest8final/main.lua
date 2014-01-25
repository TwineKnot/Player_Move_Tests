require "player"

function love.load()
	playerLoad()
	
end

function love.update(dt)
	playerUpdate(dt)

end

function love.draw()
	love.graphics.scale(.5)
    for x = 1, 10 do
       for y = 1, 10 do
          love.graphics.rectangle("line", x * 128, y * 128, 128, 128)
       end 
    end
	playerDraw()
end