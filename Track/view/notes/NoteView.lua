require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: NoteView
-- Creates a new NoteView to visualize notes
local NoteView = class(function(self)
    self.note_image = love.graphics.newImage("Resources/Track/cube.png")
    self.inactive_note_image = love.graphics.newImage("Resources/Track/cube2.png")

    self.particles_sist = love.graphics.newParticleSystem(self.note_image, 32)
    self.particles_sist:setSizes(3)
    self.particles_sist:setColors(1,1,1,1,1,1,1,0)
    self.particles_sist:setParticleLifetime(0,0.5)
    self.particles_sist:setLinearAcceleration(-200, -200, 200, 200)
    self.particles_sist:setSpeed( -5000, 5000 )
    self.particles_sist:setSpread( 3.14*2 )
end)

-- updateParticleSystem: num -> None
-- updates the particle system
function NoteView.updateParticleSystem(self, dt)
    self.particles_sist:update(dt)
end

-- draw: Paddle -> None
-- draws the note sprite depending on its state
function NoteView.draw(self, note)
    if note:getStateStr() == "NoteActiveState" then
        self:drawBasicNote(note)
    elseif note:getStateStr() == "NoteActivatedState" then
        self:drawBasicNote(note)
        self.particles_sist:emit(20)
    else
        self:drawInactiveBasicNote(note)
        love.graphics.draw(self.particles_sist, 100,260)
    end
end

function NoteView.drawBasicNote(self, note)
    love.graphics.draw(self.note_image,note:getX(),note:getY(),0, 4*getScale())
end

function NoteView.drawInactiveBasicNote(self, note)
    love.graphics.draw(self.inactive_note_image,note:getX(),note:getY(),0, 4*getScale())
end

return NoteView