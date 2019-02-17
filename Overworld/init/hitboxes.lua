require "lib.physics.hitboxes.RectangleHitbox"
--------------------------------------------------------------------------------------------------------

function newPlayerHitboxes()
    return {RectangleHitbox.new(4, 4, 28, 28)}
end

function newPersonHitboxes()
    return {RectangleHitbox.new(4, 4, 28, 28)}
end

function newWallHitboxes(x, y)
    return {RectangleHitbox.new(0, 0, x, y)}
end
