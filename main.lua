-- SPDX-FileCopyrightText: 2024 Imran Mustafa <imran@imranmustafa.net>
--
-- SPDX-License-Identifier: GPL-3.0-or-later
local Paddle = require "src.paddle"
local Ball = require "src.ball"
local Wall = require "src.wall"

local window_width, window_height = love.graphics.getDimensions()

local offset = 50 -- this defines where the paddle is from its side of the screen

function love.load()
   World = love.physics.newWorld(0, 0, true)

   W1 = Wall:new{p = 0, w = window_width * 2, world = World}
   W2 = Wall:new{p = window_height, w = window_width * 2, world = World}

   P1 = Paddle:new{x = 10, y = 400, up = "w", down = "s", world = World}
   P2 = Paddle:new{x = window_width - offset, y = 200, up = "up", down = "down", world = World}

   B = Ball:new{x = window_width / 2, y = window_height / 2, r = 10, world = World}
end
function love.update(dt)
   World:update(dt)

   P1:move(dt, window_height)
   P2:move(dt, window_height)
end
function love.draw()
   B:draw()
   P1:draw()
   P2:draw()
end
