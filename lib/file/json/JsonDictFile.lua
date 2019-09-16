require "lib.classes.class"
local json = require("lib.file.json.json")
local DictFile = require("lib.file.DictFile")
--------------------------------------------------------------------------------------------------------

-- class: JsonDictFile
-- param: path:str -> the path of the file serving as a dictionary
-- An object to manage json files that contain dictionaries
local JsonDictFile = extend(DictFile, function(self, path)
    -- Try opening the file
    if pcall(function()
        json.decode(love.filesystem.read(path))
        end) then

        -- If the file was opened load the file
        self.dict = json.decode(love.filesystem.read(self.path))
    else
        -- Create a new file with an empty json dictionary otherwise
        love.filesystem.write(path, "{}")
        
        -- Assign the dictionary to a new empty dictionary
        self.dict = {}
    end
end,

function(path)
    return DictFile.new(path)
end)

-- load: None -> None
-- loads the dictionary in the file in the local field
function JsonDictFile.load(self)
    self.dict = json.decode(love.filesystem.read(self.path))
end

-- save: None -> None
-- saves the dictionary field in the file
function JsonDictFile.save(self)
    love.filesystem.write(self.path, json.encode(self.dict))
end

return JsonDictFile