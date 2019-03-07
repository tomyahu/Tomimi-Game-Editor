local RectangleHitbox = require "lib.physics.hitboxes.RectangleHitbox"
--------------------------------------------------------------------------------------------------------

function newPlayerHitboxes()
    return {RectangleHitbox.new(16, 40, 48, 64)}
end

function newPersonHitboxes()
    return {RectangleHitbox.new(8, 8, 56, 56)}
end

function newWallHitboxes(x, y)
    return {RectangleHitbox.new(0, 0, x, y)}
end
