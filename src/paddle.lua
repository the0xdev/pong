-- SPDX-FileCopyrightText: 2024 Imran Mustafa <imran@imranmustafa.net>
--
-- SPDX-License-Identifier: GPL-3.0-or-later

Paddle = {
   x = 0,
   y = 0,

   w = 15,
   h = 60,

   speed = 1000,

   up = "",
   down = ""
}

function Paddle:new(o)
   o = o or {}   -- create object if user does not provide one
   setmetatable(o, self)
   self.__index = self

   o.b = love.physics.newBody(o.world, o.x, o.y, "static")

   o.s = love.physics.newRectangleShape(o.w, o.h)

   o.f = love.physics.newFixture(o.b, o.s)
   o.f:setUserData("Paddle")

   return o
end

function Paddle:draw()
   love.graphics.polygon("fill", self.b:getWorldPoints(self.s:getPoints()))
end

function Paddle:move(dt, max_height)
   if love.keyboard.isDown( self.up ) then
      self.b:setY(math.max(self.b:getY() - self.speed * dt, 0))
   end
   if love.keyboard.isDown( self.down ) then
      self.b:setY(math.min(self.b:getY() + self.speed * dt, max_height))
   end
end

return Paddle
