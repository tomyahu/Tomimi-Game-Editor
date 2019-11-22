require "lib.classes.class"
--------------------------------------------------------------------------------------------------------
-- TODO: Document this
-- TODO: Generalize this for more tools
local PartyMenuView = class(function(self, background_border, character_cards)
    self.background_border = background_border
    self.character_cards = character_cards
    -- TODO: Create Menu in ctrl that just have a back state
end)

-- TODO: Document this
function PartyMenuView.draw(self)
    self.background_border:draw()
    for index, card in pairs(self.character_cards) do
        card:draw()
    end
end

return PartyMenuView