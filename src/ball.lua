-- SPDX-FileCopyrightText: 2024 Imran Mustafa <imran@imranmustafa.net>
--
-- SPDX-License-Identifier: GPL-3.0-or-later

Ball = {}

function Ball:new(o)
   o = o or {}   -- create object if user does not provide one
   setmetatable(o, self)
   self.__index = self

   o.b = love.physics.newBody(o.world, o.x, math.random(0, 2 * o.y), "dynamic")
   o.b:setBullet(true)
   o.b:setMass(1)
   o.b:setLinearDamping(0)
   o.b:setAngularDamping(0)
   local halfspeed = o.s / 2
   local yspeed = math.random(-halfspeed, halfspeed)
   local xspeed = o.s - math.abs(yspeed)
   xspeed = {xspeed, -xspeed}
   o.b:setLinearVelocity(xspeed[math.random(1,2)], yspeed)

   o.s = love.physics.newCircleShape(o.r)
   o.f = love.physics.newFixture(o.b, o.s)
   o.f:setRestitution(1.05)
   o.f:setUserData("Ball")
   return o
end

function Ball:draw()
   love.graphics.circle("fill", self.b:getX(), self.b:getY(), self.s:getRadius())
end

return Ball
