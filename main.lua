function love.load()
    love.window.setMode(800, 600, {resizable=false, fullscreen=false})
    love.graphics.setBackgroundColor(255,255,255)
    color = "black"
    light = "white"
    bgcolor = "white"
    painted = {}
end

function TextToColor(color)
    colorlist = {}
    if color == "black" then
       colorlist = {0,0,0}
    elseif color == "white" then
        colorlist = {255,255,255}
    elseif color == "red" then
        colorlist = {255,0,0}
    elseif color == "green" then
        colorlist = {0,255,0}
    elseif color == "blue" then
        colorlist = {0,0,255}
    elseif color == "yellow" then
        colorlist = {255,255,0}
    elseif color == "magenta" then
        colorlist = {255,0,255}
    elseif color == "cyan" then
        colorlist = {0,255,255}
    end
    return colorlist
end

function cl(color,light)
    lastcolor = {}
    if light == "white" then
        lastcolor = TextToColor(color)
    elseif light == "red" then
        if color == "black" then
            lastcolor = {0,0,0}
        elseif color == "white" then
            lastcolor = {255,0,0}
        elseif color == "red" then
            lastcolor = {255,0,0}
        elseif color == "green" then
            lastcolor = {0,0,0}
        elseif color == "blue" then
            lastcolor = {0,0,0}
        elseif color == "yellow" then
            lastcolor = {255,0,0}
        elseif color == "magenta" then
            lastcolor = {255,0,0}
        elseif color == "cyan" then
            lastcolor = {0,0,0}
        end
    elseif light == "green" then
        if color == "black" then
            lastcolor = {0,0,0}
        elseif color == "white" then
            lastcolor = {0,255,0}
        elseif color == "red" then
            lastcolor = {0,0,0}
        elseif color == "green" then
            lastcolor = {0,255,0}
        elseif color == "blue" then
            lastcolor = {0,0,0}
        elseif color == "yellow" then
            lastcolor = {0,255,0}
        elseif color == "magenta" then
            lastcolor = {0,0,0}
        elseif color == "cyan" then
            lastcolor = {0,255,0}
        end
    elseif light == "blue" then
        if color == "black" then
            lastcolor = {0,0,0}
        elseif color == "white" then
            lastcolor = {0,0,255}
        elseif color == "red" then
            lastcolor = {0,0,0}
        elseif color == "green" then
            lastcolor = {0,0,0}
        elseif color == "blue" then
            lastcolor = {0,0,255}
        elseif color == "yellow" then
            lastcolor = {0,0,0}
        elseif color == "magenta" then
            lastcolor = {0,0,255}
        elseif color == "cyan" then
            lastcolor = {0,0,255}
        end
    elseif light == "yellow" then 
        if color == "black" then
            lastcolor = {0,0,0}
        elseif color == "white" then
            lastcolor = {255,255,0}
        elseif color == "red" then
            lastcolor = {255,0,0}
        elseif color == "green" then
            lastcolor = {0,255,0}
        elseif color == "blue" then
            lastcolor = {0,0,0}
        elseif color == "yellow" then
            lastcolor = {255,255,0}
        elseif color == "magenta" then
            lastcolor = {255,0,0}
        elseif color == "cyan" then
            lastcolor = {0,255,0}
        end
    elseif light == "magenta" then
        if color == "black" then
            lastcolor = {0,0,0}
        elseif color == "white" then
            lastcolor = {255,0,255}
        elseif color == "red" then
            lastcolor = {255,0,0}
        elseif color == "green" then
            lastcolor = {0,0,0}
        elseif color == "blue" then
            lastcolor = {0,0,255}
        elseif color == "yellow" then
            lastcolor = {255,0,0}
        elseif color == "magenta" then
            lastcolor = {255,0,255}
        elseif color == "cyan" then
            lastcolor = {0,0,255}
        end
    elseif light == "cyan" then
        if color == "black" then
            lastcolor = {0,0,0}
        elseif color == "white" then
            lastcolor = {0,255,255}
        elseif color == "red" then
            lastcolor = {0,0,0}
        elseif color == "green" then
            lastcolor = {0,255,0}
        elseif color == "blue" then
            lastcolor = {0,0,255}
        elseif color == "yellow" then
            lastcolor = {0,255,0}
        elseif color == "magenta" then
            lastcolor = {0,0,255}
        elseif color == "cyan" then
            lastcolor = {0,255,255}
        end
    end
    return lastcolor
end

function love.update(dt)
    if love.keyboard.isDown("1") then
        color = "black"
    elseif love.keyboard.isDown("2") then
        color = "white"
    elseif love.keyboard.isDown("3") then
        color = "red"
    elseif love.keyboard.isDown("4") then
        color = "green"
    elseif love.keyboard.isDown("5") then
        color = "blue"
    elseif love.keyboard.isDown("6") then
        color = "yellow"
    elseif love.keyboard.isDown("7") then
        color = "magenta"
    elseif love.keyboard.isDown("8") then
        color = "cyan"
    elseif love.keyboard.isDown("space") then
        bgcolor = color
    elseif love.keyboard.isDown("c") then
        bgcolor = "white"
        painted = {}
        color = "black"
        light = "white"
    elseif love.mouse.isDown(1) then
            table.insert(painted,{{love.mouse.getPosition()}, {color}})
    elseif love.keyboard.isDown("return") then
        if color ~= "black" then
            light = color
        end
    end
end

function love.draw()
    love.graphics.setBackgroundColor(cl(bgcolor, light))
    if painted ~= {} then
        clr = {love.graphics.getColor()}
        for i=1, table.getn(painted) do
            pixelinfo = painted[i] 
            love.graphics.setColor(cl(pixelinfo[2][1],light))
            love.graphics.rectangle("fill", pixelinfo[1][1], pixelinfo[1][2], 20,20)
        end
        love.graphics.setColor(clr)
    end
end
