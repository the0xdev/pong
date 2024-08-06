-- SPDX-FileCopyrightText: 2024 Imran Mustafa <imran@imranmustafa.net>
--
-- SPDX-License-Identifier: GPL-3.0-or-later

Wall = {}

function Wall:new(o)
   o = o or {}   -- create object if user does not provide one
   setmetatable(o, self)
   self.__index = self

   o.b = love.physics.newBody(o.world, 0, o.p, "static")

   o.s = love.physics.newRectangleShape(o.w, 1)

   o.f = love.physics.newFixture(o.b, o.s)
   o.f:setUserData("Wall")

   return o
end

return Wall
