Paddle = {
   x = 0,
   y = 0,

   width = 30,
   height = 60,

   speed = 1000,

   up = "",
   down = ""
}

function Paddle:new(o)
   o = o or {}   -- create object if user does not provide one
   setmetatable(o, self)
   self.__index = self
   return o
end

function Paddle:draw()
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Paddle:move(dt, max_height)
   if love.keyboard.isDown( self.up ) then
      self.y = math.max(self.y - self.speed * dt, 0)
   end
   if love.keyboard.isDown( self.down ) then
      self.y = math.min(self.height + self.y + self.speed * dt, max_height) - self.height
   end
end

return Paddle
