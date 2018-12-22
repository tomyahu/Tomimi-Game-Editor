require "Menu.model.states.State"
--------------------------------------------------------------------------------------------------------
-- MenuState: MenuState str
-- Creates new MenuState
MenuState = class(State, function(st, name)
    State.init(st)
    st.name = name
end)
