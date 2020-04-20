require_relative "../../util/pair.rb"

require_relative "./level.rb"

Level::LEVELS = [
    Level.new("Level 1", [
        "  wwwww ",
        "www   w ",
        "wt    w ",
        "www  tw ",
        "wtww  w ",
        "w w t ww",
        "w  t  tw",
        "w   t  w",
        "wwwwwwww"
    ], [
        Pair.new(Pair.new(2, 2), "p"),
        Pair.new(Pair.new(3, 4), "b"),
        Pair.new(Pair.new(4, 4), "b"),
        Pair.new(Pair.new(6, 1), "b"),
        Pair.new(Pair.new(6, 3), "b"),
        Pair.new(Pair.new(6, 4), "b"),
        Pair.new(Pair.new(6, 5), "b"),
        Pair.new(Pair.new(2, 3), "b")
    ])
]