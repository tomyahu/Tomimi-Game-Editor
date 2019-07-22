require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

local Song = class(function(self, audio_path, name, artist)
    self.audio_path = audio_path
    self.name = name
    self.artist = artist
end)



return Song