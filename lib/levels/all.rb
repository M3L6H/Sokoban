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
    ]),
    Level.new("Level 2", [
        "    wwwww             ", # 0 
        "    w   w             ", # 1
        "    w   w             ", # 2
        "  www   www           ", # 3
        "  w       w           ", # 4
        "www w www w     wwwwww", # 5
        "w   w www wwwwwww  ttw", # 6
        "w                  ttw", # 7
        "wwwww wwww w wwww  ttw", # 8
        "    w      www  wwwwww", # 9
        "    wwwwwwww          "  # 10
        #0123456789012345678901
    ], [
        Pair.new(Pair.new(8, 12), "p"),
        Pair.new(Pair.new(2, 5), "b"),
        Pair.new(Pair.new(4, 5), "b"),
        Pair.new(Pair.new(7, 5), "b"),
        Pair.new(Pair.new(3, 7), "b"),
        Pair.new(Pair.new(4, 8), "b"),
        Pair.new(Pair.new(7, 2), "b")
    ])
]