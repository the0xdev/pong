-- SPDX-FileCopyrightText: 2024 Imran Mustafa <imran@imranmustafa.net>
--
-- SPDX-License-Identifier: GPL-3.0-or-later
local Paddle = require "src.paddle"
local Ball = require "src.ball"

local window_width, window_height = love.graphics.getDimensions()

local offset = 50 -- this defines where the paddle is from its side of the screen

function love.load()
   P1 = Paddle:new{x = 10, y = 200, up = "w", down = "s"}
   P2 = Paddle:new{x = window_width - offset, y = 200, up = "up", down = "down"}
end
function love.update(dt)
   P1:move(dt, window_height)
   P2:move(dt, window_height)
end
function love.draw()
   P1:draw()
   P2:draw()
end
