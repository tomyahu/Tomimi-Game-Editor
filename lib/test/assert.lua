-- assertEquals: object, object -> None/Error
-- Raises an error if received is different than expected
function assertEquals(received, expected)
    assert(received == expected)
end

-- assertFalse: bool -> None/Error
-- Raises an error if received is true
function assertFalse(received)
    assert(not received)
end

-- assertTrue: bool -> None/Error
-- Raises an error if received is fals
function assertTrue(received)
    assert(received)
end
