local RectangleHitbox = require "lib.physics.hitboxes.RectangleHitbox"
--------------------------------------------------------------------------------------------------------

function newPlayerHitboxes()
    return {RectangleHitbox.new(16, 40, 48, 64)}
end

function newPlayerInteractuableHitboxes()
    return {RectangleHitbox.new(31, -8, 33, 32), RectangleHitbox.new(31, 32, 33, 72), RectangleHitbox.new(-8, 31, 32, 33), RectangleHitbox.new(32, 31, 72, 33)}
end


function newEntityHitboxes()
    return {RectangleHitbox.new(8, 8, 56, 56)}
end

function newWallHitboxes(x, y)
    return {RectangleHitbox.new(0, 0, x, y)}
end
