require "lib.test"
require "lib.algorithm.Arrays"
require "lib.structures.util.Pair"

-- Quicksort
a = {}
a[1] = Pair.new(1,"a")
a[2] = Pair.new(0,"b")
a[3] = Pair.new(1,"c")
a[4] = Pair.new(3,"d")
a[5] = Pair.new(-1,"e")

quicksortPairs(a)

assertEquals("e", a[1]:getSecond())
assertEquals("b", a[2]:getSecond())
assertEquals("d", a[5]:getSecond())