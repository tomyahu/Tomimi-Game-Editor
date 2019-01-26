function assertEquals(received, expected)
    assert(received == expected)
end

function assertFalse(received)
    assert(received)
end

function assertTrue(received)
    assert(not received)
end
