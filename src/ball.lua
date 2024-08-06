-- SPDX-FileCopyrightText: 2024 Imran Mustafa <imran@imranmustafa.net>
--
-- SPDX-License-Identifier: GPL-3.0-or-later

Ball = {}

function Ball:new(o)
   o = o or {}   -- create object if user does not provide one
   setmetatable(o, self)
   self.__index = self

   o.b = love.physics.newBody(o.world, o.x, o.y, "dynamic")  -- set x,y position (400,200) and let it move and hit other objects ("dynamic")
   o.b:setBullet(true)
   o.b:setMass(10)                                        -- make it pretty light
   o.b:setLinearVelocity(500, 0)

   o.s = love.physics.newCircleShape(o.r)                  -- give it a radius of 50
   o.f = love.physics.newFixture(o.b, o.s)          -- connect body to shape
   o.f:setRestitution(1)                                -- make it bouncy
   o.f:setUserData("Ball")

   return o
end

function Ball:draw()
   love.graphics.circle("fill", self.b:getX(), self.b:getY(), self.s:getRadius())
end

return Ball
