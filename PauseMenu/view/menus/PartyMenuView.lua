require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: PartyMenuView
-- param: background_border:UITeselatedFrame -> a frame that serves as the background of the party menu view
-- param: character_cards:list(CharacterInfoCard) -> a list of the character information cards to display
-- The party menu view class to display the state of the party characters
local PartyMenuView = class(function(self, background_border, character_cards)
    self.background_border = background_border
    self.character_cards = character_cards
end)

-- draw: None -> None
-- draws the background and the character cards of the party
function PartyMenuView.draw(self)
    self.background_border:draw()
    for _, card in pairs(self.character_cards) do
        card:draw()
    end
end

return PartyMenuView