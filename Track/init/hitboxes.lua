local RectangleHitbox = require "lib.physics.hitboxes.RectangleHitbox"
--------------------------------------------------------------------------------------------------------

function paddleHitboxes()
    return {RectangleHitbox.new(8, 0, 24, 320)}
end

function noteHitboxes()
    return {RectangleHitbox.new(0, 0, 64, 64)}
end
