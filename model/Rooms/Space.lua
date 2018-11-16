----------------------------------------------------------------------------------------------------------
-- Space: None -> Space
-- Creates an empty space
Space = class(function(sp) end)

-- enter: Entity -> None
-- If the entity e enters this space nothing happens
function Space:enter(e)
end

-- exit: Entity -> None
-- If the entity e exits this space nothing happens
function Space:exit(e)
end

----------------------------------------------------------------------------------------------------------
-- SolidSpace: None -> SolidSpace
-- Creates a solid space
SolidSpace = class(Space, function(sp)
    Space.init(sp)
end)

-- enter: Entity -> None
-- If the entity e enters this space it is moved to a valid position
function SolidSpace:enter(e)
    -- no deja entrar en esta posicion
end

WarpSpace = class(Space, function(sp, habitacion, x, y)
    Space.init(sp)
    sp.x = x
    sp.y = y
    sp.habitacion = habitacion
end)

-- enter: Entity -> None
-- If the entity e enters this space it is teleported to a position in a different room
function WarpSpace:enter(e)
    -- lleva a la posicion (x,y) en la matriz de la otra habitacion
end