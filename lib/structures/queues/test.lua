require "lib.test.assert"
local ArrayQueue = require "lib.structures.queues.ArrayQueue"


local queues = {}

for _, queue in pairs(queues) do
    assertTrue(queue:isEmpty())

    local aux = {}
    for i=1,50 do
        local random_val = math.random()
        aux[i] = random_val
        queue:push(random_val)
    end

    for i=1,50 do
        assertEquals(queue:pop(), aux[i])
    end

end
