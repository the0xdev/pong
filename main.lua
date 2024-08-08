-- SPDX-FileCopyrightText: 2024 Imran Mustafa <imran@imranmustafa.net>
--
-- SPDX-License-Identifier: GPL-3.0-or-later
local Paddle = require "src.paddle"
local Ball = require "src.ball"
local Wall = require "src.wall"

local window_width, window_height = love.graphics.getDimensions()

local offset = 50 -- this defines where the paddle is from its side of the screen
local p1_score = 0
local p2_score = 0

function ballReset()
   B.b:destroy()
   B = Ball:new{x = window_width / 2, y = window_height / 2, r = 10, world = World}
end

function love.load()
   World = love.physics.newWorld(0, 0, true)

   W1 = Wall:new{p = 0, w = window_width * 2, world = World}
   W2 = Wall:new{p = window_height, w = window_width * 2, world = World}

   P1 = Paddle:new{x = 10, y = 400, up = "w", down = "s", world = World}
   P2 = Paddle:new{x = window_width - offset, y = 200, up = "up", down = "down", world = World}

   B = Ball:new{x = window_width / 2, y = window_height / 2, r = 10, world = World}
end
function love.update(dt)
   P1:move(dt, window_height)
   P2:move(dt, window_height)

   World:update(dt)

   
   if love.keyboard.isDown("r") then
      ballReset()
   end

   local offset = B.b:getX()
   if offset > window_width then
      p1_score = p1_score + 1
      ballReset()
   elseif offset < 0 then
      p2_score = p2_score + 1
      ballReset()
   end
end
function love.draw()
   love.graphics.print(p1_score, 0, 100)
   love.graphics.print(p2_score, 100, 100)
   B:draw()
   P1:draw()
   P2:draw()
end
