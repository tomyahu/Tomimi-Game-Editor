local RectangleHitbox = require "lib.physics.hitboxes.RectangleHitbox"
--------------------------------------------------------------------------------------------------------

function paddleHitboxes()
    return {RectangleHitbox.new(6, 0, 18, 60)}
end

function noteHitboxes()
    return {RectangleHitbox.new(0, 0, 48, 48)}
end
