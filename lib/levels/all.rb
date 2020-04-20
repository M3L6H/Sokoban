require_relative "../../util/pair.rb"

require_relative "./level.rb"

# Levels taken from https://www.mathsisfun.com/games/sokoban.html
Level::LEVELS = [
    Level.new("Level 1 of 5", [
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
    Level.new("Level 2 of 5", [
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
    ]),
    Level.new("Level 3 of 5", [
        "wwwwwwwwwwww  ", # 0 
        "wtt  w     www", # 1
        "wtt  w       w", # 2
        "wtt  w wwww  w", # 3
        "wtt      ww  w", # 4
        "wtt  w w    ww", # 5
        "wwwwww ww    w", # 6
        "  w          w", # 7
        "  w    w     w", # 8
        "  wwwwwwwwwwww"  # 9
        #01234567890123
    ], [
        Pair.new(Pair.new(4, 7), "p"),
        Pair.new(Pair.new(7, 4), "b"),
        Pair.new(Pair.new(3, 6), "b"),
        Pair.new(Pair.new(2, 7), "b"),
        Pair.new(Pair.new(7, 7), "b"),
        Pair.new(Pair.new(6, 9), "b"),
        Pair.new(Pair.new(7, 9), "b"),
        Pair.new(Pair.new(2, 10), "b"),
        Pair.new(Pair.new(5, 10), "b"),
        Pair.new(Pair.new(6, 11), "b"),
        Pair.new(Pair.new(7, 11), "b")
    ]),
    Level.new("Level 4 of 5", [
        "        wwwwwwww ", # 0 
        "        w      w ", # 1
        "        w  w  ww ", # 2
        "        w     w  ", # 3
        "        ww    w  ", # 4
        "wwwwwwwww   w www", # 5
        "wtttt  ww       w", # 6
        "wwttt           w", # 7
        "wtttt  wwwwwwwwww", # 8
        "wwwwwwww         "  # 9
        #01234567890123456
    ], [
        Pair.new(Pair.new(1, 14), "p"),
        Pair.new(Pair.new(7, 9), "b"),
        Pair.new(Pair.new(2, 10), "b"),
        Pair.new(Pair.new(3, 10), "b"),
        Pair.new(Pair.new(4, 10), "b"),
        Pair.new(Pair.new(5, 10), "b"),
        Pair.new(Pair.new(6, 10), "b"),
        Pair.new(Pair.new(2, 12), "b"),
        Pair.new(Pair.new(4, 12), "b"),
        Pair.new(Pair.new(7, 12), "b"),
        Pair.new(Pair.new(3, 13), "b"),
        Pair.new(Pair.new(6, 13), "b")
    ]),
    Level.new("Level 5 of 5", [
        "              wwwwwwww", # 0 
        "              w  ttttw", # 1
        "   wwwwwwwwwwww  ttttw", # 2
        "   w    w        ttttw", # 3
        "   w    w     w  ttttw", # 4
        "   w          w  ttttw", # 5
        "   w    w     wwwwwwww", # 6
        "wwww    w     w       ", # 7
        "w   w wwwwwwwww       ", # 8
        "w       ww            ", # 9
        "w   w    w            ", # 10
        "w   w   ww            ", # 11
        "wwwwwwwww             "  # 12
        #0123456789012345678901
    ], [
        Pair.new(Pair.new(10, 8), "p"),
        Pair.new(Pair.new(10, 2), "b"),
        Pair.new(Pair.new(10, 3), "b"),
        Pair.new(Pair.new(4, 5), "b"),
        Pair.new(Pair.new(6, 5), "b"),
        Pair.new(Pair.new(9, 5), "b"),
        Pair.new(Pair.new(10, 5), "b"),
        Pair.new(Pair.new(4, 6), "b"),
        Pair.new(Pair.new(5, 6), "b"),
        Pair.new(Pair.new(6, 6), "b"),
        Pair.new(Pair.new(7, 6), "b"),
        Pair.new(Pair.new(10, 6), "b"),
        Pair.new(Pair.new(4, 7), "b"),
        Pair.new(Pair.new(4, 9), "b"),
        Pair.new(Pair.new(6, 9), "b"),
        Pair.new(Pair.new(3, 11), "b"),
        Pair.new(Pair.new(6, 11), "b"),
        Pair.new(Pair.new(4, 12), "b"),
        Pair.new(Pair.new(5, 12), "b"),
        Pair.new(Pair.new(3, 13), "b"),
        Pair.new(Pair.new(6, 13), "b")
    ])
]