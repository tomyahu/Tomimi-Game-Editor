require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: NoteView
-- Creates a new NoteView to visualize notes
local NoteView = class(function(self)
    self.note_image = love.graphics.newImage("Resources/Track/cube.png")
    self.inactive_note_image = love.graphics.newImage("Resources/Track/cube2.png")

    self.particles_sist = love.graphics.newParticleSystem(self.note_image, 32)
    self.particles_sist:setSizes(2* getScale())
    self.particles_sist:setColors(1,1,1,1,1,1,1,0)
    self.particles_sist:setParticleLifetime(0,0.5)
    self.particles_sist:setLinearAcceleration(-200, -200, 200, 200)
    self.particles_sist:setSpeed( -2500, 2500 )
    self.particles_sist:setSpread( 3.14*2 )
    self.particle_sist_y = 0
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
        self.particle_sist_y = note:getY()
        self.particles_sist:emit(20)

    else
        self:drawInactiveBasicNote(note)
    end

    love.graphics.draw(self.particles_sist, getRelativePosX(50), getRelativePosY(self.particle_sist_y + 32))
end

function NoteView.drawBasicNote(self, note)
    love.graphics.draw(self.note_image,getRelativePosX(note:getX()), getRelativePosY(note:getY()),0, 3*getScale())
end

function NoteView.drawInactiveBasicNote(self, note)
    love.graphics.draw(self.inactive_note_image,getRelativePosX(note:getX()),getRelativePosY(note:getY()),0, 3*getScale())
end

return NoteView