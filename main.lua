function love.load()
    love.window.setMode(800, 600, {resizable=false, fullscreen=false})
    love.graphics.setBackgroundColor(255,255,255)
    color = "black"
    light = "white"
    bgcolor = "white"
    painted = {}
    torch = love.graphics.newImage("torch.png")
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
function clear()
    bgcolor = "white"
    painted = {}
    color = "black"
    light = "white"
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
        clear()
    elseif love.mouse.isDown(1) then
        pos = {love.mouse.getPosition()}
        if pos[1] < ((love.graphics.getWidth() / 2) - 10) and pos[1] > 20 and pos[2] < ((love.graphics.getHeight()) - 40) and pos[2] > 20 then
            table.insert(painted,{{love.mouse.getPosition()}, {color}})
        elseif pos[1] < love.graphics.getWidth()/2 + 45 and pos[1] > love.graphics.getWidth()/2 + 25 and pos[2] < 70 and pos[2] > 50 then
            color = "black"
        elseif pos[1] < love.graphics.getWidth()/2 + 70 and pos[1] > love.graphics.getWidth()/2 + 50 and pos[2] < 70 and pos[2] > 50 then
            color = "white"
        elseif pos[1] < love.graphics.getWidth()/2 + 95 and pos[1] > love.graphics.getWidth()/2 + 75 and pos[2] < 70 and pos[2] > 50 then
            color = "red"
        elseif pos[1] < love.graphics.getWidth()/2 + 120 and pos[1] > love.graphics.getWidth()/2 + 100 and pos[2] < 70 and pos[2] > 50 then
            color = "green"
        elseif pos[1] < love.graphics.getWidth()/2 + 145 and pos[1] > love.graphics.getWidth()/2 + 125 and pos[2] < 70 and pos[2] > 50 then
            color = "blue"
        elseif pos[1] < love.graphics.getWidth()/2 + 170 and pos[1] > love.graphics.getWidth()/2 + 150 and pos[2] < 70 and pos[2] > 50 then
            color = "yellow"
        elseif pos[1] < love.graphics.getWidth()/2 + 195 and pos[1] > love.graphics.getWidth()/2 + 175 and pos[2] < 70 and pos[2] > 50 then
            color = "magenta"
        elseif pos[1] < love.graphics.getWidth()/2 + 220 and pos[1] > love.graphics.getWidth()/2 + 200 and pos[2] < 70 and pos[2] > 50 then
            color = "cyan"
        elseif pos[1] < love.graphics.getWidth()/2 + 45 and pos[1] > love.graphics.getWidth()/2 + 25 and
            pos[2] < love.graphics.getHeight()/8 + 20 +70 and pos[2] > love.graphics.getHeight()/8 + 20 +50 then
            bgcolor = "black"
        elseif pos[1] < love.graphics.getWidth()/2 + 70 and pos[1] > love.graphics.getWidth()/2 + 50 and
            pos[2] < love.graphics.getHeight()/8 + 20 +70 and pos[2] > love.graphics.getHeight()/8 + 20 +50 then
            bgcolor = "white"
        elseif pos[1] < love.graphics.getWidth()/2 + 95 and pos[1] > love.graphics.getWidth()/2 + 75 and
            pos[2] < love.graphics.getHeight()/8 + 20 +70 and pos[2] > love.graphics.getHeight()/8 + 20 +50 then
            bgcolor = "red"
        elseif pos[1] < love.graphics.getWidth()/2 + 120 and pos[1] > love.graphics.getWidth()/2 + 100 and
            pos[2] < love.graphics.getHeight()/8 + 20 +70 and pos[2] > love.graphics.getHeight()/8 + 20 +50 then
            bgcolor = "green"
        elseif pos[1] < love.graphics.getWidth()/2 + 145 and pos[1] > love.graphics.getWidth()/2 + 125 and
            pos[2] < love.graphics.getHeight()/8 + 20 +70 and pos[2] > love.graphics.getHeight()/8 + 20 +50 then
            bgcolor = "blue"
        elseif pos[1] < love.graphics.getWidth()/2 + 170 and pos[1] > love.graphics.getWidth()/2 + 150 and
            pos[2] < love.graphics.getHeight()/8 + 20 +70 and pos[2] > love.graphics.getHeight()/8 + 20 +50 then
            bgcolor = "yellow"
        elseif pos[1] < love.graphics.getWidth()/2 + 195 and pos[1] > love.graphics.getWidth()/2 + 175 and
            pos[2] < love.graphics.getHeight()/8 + 20 +70 and pos[2] > love.graphics.getHeight()/8 + 20 +50 then
            bgcolor = "magenta"
        elseif pos[1] < love.graphics.getWidth()/2 + 220 and pos[1] > love.graphics.getWidth()/2 + 200 and
            pos[2] < love.graphics.getHeight()/8 + 20 +70 and pos[2] > love.graphics.getHeight()/8 + 20 +50 then
            bgcolor = "cyan"
        elseif pos[1] < love.graphics.getWidth()/2 + 45 and pos[1] > love.graphics.getWidth()/2 + 25 and
            pos[2] < love.graphics.getHeight()/8*4+30+70 and pos[2] > love.graphics.getHeight()/8*4+30+50 then
            light = "white"
        elseif pos[1] < love.graphics.getWidth()/2 + 70 and pos[1] > love.graphics.getWidth()/2 + 50 and
            pos[2] < love.graphics.getHeight()/8*4+30+70 and pos[2] > love.graphics.getHeight()/8*4+30+50 then
            light = "red"
        elseif pos[1] < love.graphics.getWidth()/2 + 95 and pos[1] > love.graphics.getWidth()/2 + 75 and
            pos[2] < love.graphics.getHeight()/8*4+30+70 and pos[2] > love.graphics.getHeight()/8*4+30+50 then
            light = "green"
        elseif pos[1] < love.graphics.getWidth()/2 + 120 and pos[1] > love.graphics.getWidth()/2 + 100 and
            pos[2] < love.graphics.getHeight()/8*4+30+70 and pos[2] > love.graphics.getHeight()/8*4+30+50 then
            light = "blue"
        elseif pos[1] < love.graphics.getWidth()/2 + 145 and pos[1] > love.graphics.getWidth()/2 + 125 and
            pos[2] < love.graphics.getHeight()/8*4+30+70 and pos[2] > love.graphics.getHeight()/8*4+30+50 then
            light = "yellow"
        elseif pos[1] < love.graphics.getWidth()/2 + 170 and pos[1] > love.graphics.getWidth()/2 + 150 and
            pos[2] < love.graphics.getHeight()/8*4+30+70 and pos[2] > love.graphics.getHeight()/8*4+30+50 then
            light = "magenta"
        elseif pos[1] < love.graphics.getWidth()/2 + 195 and pos[1] > love.graphics.getWidth()/2 + 175 and
            pos[2] < love.graphics.getHeight()/8*4+30+70 and pos[2] > love.graphics.getHeight()/8*4+30+50 then
            light = "cyan"
        end
    elseif love.keyboard.isDown("return") then
        if color ~= "black" then
            light = color
        end
    end
end
function torchcolormenu()
    love.graphics.setColor(0,0,0)
    love.graphics.draw(torch,(love.graphics.getWidth() / 2) + 20, love.graphics.getHeight()/4 +70, math.rad(-30))       
    love.graphics.setColor({0,0,0})
    love.graphics.rectangle("line", (love.graphics.getWidth() / 2) + 20, love.graphics.getHeight()/8*4+30+20, love.graphics.getWidth()/2 - 40, love.graphics.getHeight() / 8)
    love.graphics.print("Light Color", love.graphics.getWidth() / 2 + 25 , love.graphics.getHeight()/8*4+30+25)
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 25, love.graphics.getHeight()/8*4+30+50, 20, 20)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("line", love.graphics.getWidth()/2 + 25, love.graphics.getHeight()/8*4+30+51, 19, 18)
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 50, love.graphics.getHeight()/8*4+30+50, 20, 20)
    love.graphics.setColor(0,255,0)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 75, love.graphics.getHeight()/8*4+30+50, 20, 20)
    love.graphics.setColor(0,0,255)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 100, love.graphics.getHeight()/8*4+30+50, 20, 20)
    love.graphics.setColor(255,255,0)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 125, love.graphics.getHeight()/8*4+30+50, 20, 20)
    love.graphics.setColor(255,0,255)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 150, love.graphics.getHeight()/8*4+30+50, 20, 20)
    love.graphics.setColor(0,255,255)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 175, love.graphics.getHeight()/8*4+30+50, 20, 20)
    love.graphics.setColor(210,105,30)
    if light == "white" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 25, love.graphics.getHeight()/8*4+30+51, 19, 18)
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8*4+30+25, 75,65)
    elseif light == "red" then
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 50, love.graphics.getHeight()/8*4+30+51, 19, 18)
        love.graphics.setColor(255,0,0)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8*4+30+25, 75,65)
    elseif light == "green" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 75, love.graphics.getHeight()/8*4+30+51, 19, 18)
        love.graphics.setColor(0,255,0)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8*4+30+25, 75,65)
    elseif light == "blue" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 100, love.graphics.getHeight()/8*4+30+51, 19, 18)
        love.graphics.setColor(0,0,255)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8*4+30+25, 75,65)
    elseif light == "yellow" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 125, love.graphics.getHeight()/8*4+30+51, 19, 18)
        love.graphics.setColor(255,255,0)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8*4+30+25, 75,65)
    elseif light == "magenta" then
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 150, love.graphics.getHeight()/8*4+30+51, 19, 18)
        love.graphics.setColor(255,0,255)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8*4+30+25, 75,65)
    elseif light == "cyan" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 175, love.graphics.getHeight()/8*4+30+51, 19, 18)
        love.graphics.setColor(0,255,255)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8*4+30+25, 75,65)
    end
end
function bgcolormenu()
    love.graphics.setColor({0,0,0})
    love.graphics.rectangle("line", (love.graphics.getWidth() / 2) + 20, love.graphics.getHeight()/8 +40, love.graphics.getWidth()/2 - 40, love.graphics.getHeight() / 8)
    love.graphics.print("Background Color", love.graphics.getWidth() / 2 + 25 ,love.graphics.getHeight()/8 + 45)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 25, love.graphics.getHeight()/8 + 70, 20, 20)
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 50, love.graphics.getHeight()/8 + 20 + 50, 20, 20)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("line", love.graphics.getWidth()/2 + 50, love.graphics.getHeight()/8 + 20 + 51, 19, 18)
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 75, love.graphics.getHeight()/8 + 20 + 50, 20, 20)
    love.graphics.setColor(0,255,0)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 100, love.graphics.getHeight()/8 + 20 + 50, 20, 20)
    love.graphics.setColor(0,0,255)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 125, love.graphics.getHeight()/8 + 20 + 50, 20, 20)
    love.graphics.setColor(255,255,0)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 150, love.graphics.getHeight()/8 + 20 + 50, 20, 20)
    love.graphics.setColor(255,0,255)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 175, love.graphics.getHeight()/8 + 20 + 50, 20, 20)
    love.graphics.setColor(0,255,255)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 200, love.graphics.getHeight()/8 + 20 + 50, 20, 20)
    love.graphics.setColor(210,105,30)
    if bgcolor == "black" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 25, love.graphics.getHeight()/8 + 20 + 51, 19, 18)
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8 + 20 + 25, 75,65)
    elseif bgcolor == "white" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 50, love.graphics.getHeight()/8 + 20 + 51, 19, 18)
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8 + 20 + 25, 75,65)
    elseif bgcolor == "red" then
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 75, love.graphics.getHeight()/8 + 20 + 51, 19, 18)
        love.graphics.setColor(255,0,0)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8 + 20 + 25, 75,65)
    elseif bgcolor == "green" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 100, love.graphics.getHeight()/8 + 20 + 51, 19, 18)
        love.graphics.setColor(0,255,0)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8 + 20 + 25, 75,65)
    elseif bgcolor == "blue" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 125, love.graphics.getHeight()/8 + 20 + 51, 19, 18)
        love.graphics.setColor(0,0,255)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8 + 20 + 25, 75,65)
    elseif bgcolor == "yellow" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 150, love.graphics.getHeight()/8 + 20 + 51, 19, 18)
        love.graphics.setColor(255,255,0)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8 + 20 + 25, 75,65)
    elseif bgcolor == "magenta" then
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 175, love.graphics.getHeight()/8 + 20 + 51, 19, 18)
        love.graphics.setColor(255,0,255)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8 + 20 + 25, 75,65)
    elseif bgcolor == "cyan" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 200, love.graphics.getHeight()/8 + 20 + 51, 19, 18)
        love.graphics.setColor(0,255,255)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, love.graphics.getHeight()/8 + 20 + 25, 75,65)
    end

end

function colormenu()
    love.graphics.setColor({0,0,0})
    love.graphics.rectangle("line", (love.graphics.getWidth() / 2) + 20, 20, love.graphics.getWidth()/2 - 40, love.graphics.getHeight() / 8)
    love.graphics.print("Color", love.graphics.getWidth() / 2 + 25 , 25)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 25, 50, 20, 20)
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 50, 50, 20, 20)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("line", love.graphics.getWidth()/2 + 50, 51, 19, 18)
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 75, 50, 20, 20)
    love.graphics.setColor(0,255,0)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 100, 50, 20, 20)
    love.graphics.setColor(0,0,255)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 125, 50, 20, 20)
    love.graphics.setColor(255,255,0)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 150, 50, 20, 20)
    love.graphics.setColor(255,0,255)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 175, 50, 20, 20)
    love.graphics.setColor(0,255,255)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 200, 50, 20, 20)
    love.graphics.setColor(210,105,30)
    if color == "black" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 25, 51, 19, 18)
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, 25, 75,65)
    elseif color == "white" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 50, 51, 19, 18)
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 300, 25, 75,65)
    elseif color == "red" then
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 75, 51, 19, 18)
        love.graphics.setColor(255,0,0)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, 25, 75,65)
    elseif color == "green" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 100, 51, 19, 18)
        love.graphics.setColor(0,255,0)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, 25, 75,65)
    elseif color == "blue" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 125, 51, 19, 18)
        love.graphics.setColor(0,0,255)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, 25, 75,65)
    elseif color == "yellow" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 150, 51, 19, 18)
        love.graphics.setColor(255,255,0)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, 25, 75,65)
    elseif color == "magenta" then
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 175, 51, 19, 18)
        love.graphics.setColor(255,0,255)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, 25, 75,65)
    elseif color == "cyan" then
        love.graphics.rectangle("line", love.graphics.getWidth()/2 + 200, 51, 19, 18)
        love.graphics.setColor(0,255,255)
        love.graphics.rectangle("fill", love.graphics.getWidth()/2 + 300, 25, 75,65)
    end

end
function love.draw()
    clr = {love.graphics.getColor()}
    love.graphics.setColor(cl(bgcolor, light))
    love.graphics.rectangle("fill", 20, 20, (love.graphics.getWidth() / 2) - 10, love.graphics.getHeight() - 40)
    love.graphics.setColor({0,0,0})
    love.graphics.rectangle("line", 19, 19, (love.graphics.getWidth() / 2) - 9, love.graphics.getHeight() - 39)
    love.graphics.setColor(clr)
    colormenu()
    bgcolormenu()
    torchcolormenu()
    if painted ~= {} then
        clr = {love.graphics.getColor()}
        for i=1, table.getn(painted) do
            pixelinfo = painted[i] 
            love.graphics.setColor(cl(pixelinfo[2][1],light))
            love.graphics.rectangle("fill", pixelinfo[1][1], pixelinfo[1][2], 10,10)
        end
        love.graphics.setColor(clr)
    end
end
