require_relative "../../util/pair.rb"

require_relative "./level.rb"

# Levels taken from https://www.mathsisfun.com/games/sokoban.html
Level::LEVELS = [
    Level.new("Level 1 of 10", [
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
    Level.new("Level 2 of 10", [
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
    Level.new("Level 3 of 10", [
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
    Level.new("Level 4 of 10", [
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
    Level.new("Level 5 of 10", [
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
    ]),
    Level.new("Level 6 of 10", [
        "         wwwww    ", # 0 
        "         w   wwwww", # 1
        "         w w ww  w", # 2
        "         w       w", # 3
        "wwwwwwwwww www   w", # 4
        "wtttt   ww     www", # 5
        "wtttt          ww ", # 6
        "wtttt   ww      w ", # 7
        "wwwwwwwwww     ww ", # 8
        "         w      w ", # 9
        "         www ww w ", # 10
        "           w    w ", # 11
        "           wwwwww "  # 12
        #0123456789012345678
    ], [
        Pair.new(Pair.new(7, 15), "p"),
        Pair.new(Pair.new(6, 10), "b"),
        Pair.new(Pair.new(7, 10), "b"),
        Pair.new(Pair.new(5, 11), "b"),
        Pair.new(Pair.new(9, 11), "b"),
        Pair.new(Pair.new(2, 12), "b"),
        Pair.new(Pair.new(6, 12), "b"),
        Pair.new(Pair.new(8, 12), "b"),
        Pair.new(Pair.new(6, 13), "b"),
        Pair.new(Pair.new(7, 13), "b"),
        Pair.new(Pair.new(9, 13), "b"),
        Pair.new(Pair.new(5, 14), "b"),
        Pair.new(Pair.new(3, 15), "b")
    ]),
    Level.new("Level 7 of 10", [
        "wwwwww  www ", # 0 
        "wtt  w ww ww", # 1
        "wtt  www   w", # 2
        "wtt        w", # 3
        "wtt  w w   w", # 4
        "wttwww w   w", # 5
        "wwww   w   w", # 6
        "   w   w   w", # 7
        "   w       w", # 8
        "   w  ww   w", # 9
        "   wwwwwwwww"  # 10
        #012345678901
    ], [
        Pair.new(Pair.new(1, 9), "p"),
        Pair.new(Pair.new(6, 5), "b"),
        Pair.new(Pair.new(8, 5), "b"),
        Pair.new(Pair.new(7, 6), "b"),
        Pair.new(Pair.new(3, 8), "b"),
        Pair.new(Pair.new(6, 8), "b"),
        Pair.new(Pair.new(8, 8), "b"),
        Pair.new(Pair.new(3, 9), "b"),
        Pair.new(Pair.new(4, 9), "b"),
        Pair.new(Pair.new(5, 9), "b"),
        Pair.new(Pair.new(7, 9), "b")
    ]),
    Level.new("Level 8 of 10", [
        "       wwwww ", # 0 
        " wwwwwww   ww", # 1
        "ww w  ww    w", # 2
        "w           w", # 3
        "w     www   w", # 4
        "www wwwww www", # 5
        "w    www ttw ", # 6
        "w       tttw ", # 7
        "w    wwwtttw ", # 8
        "w    w wtttw ", # 9
        "w  www wwwww ", # 10
        "wwww         "  # 11
        #0123456789012
    ], [
        Pair.new(Pair.new(2, 5), "p"),
        Pair.new(Pair.new(6, 2), "b"),
        Pair.new(Pair.new(7, 2), "b"),
        Pair.new(Pair.new(9, 2), "b"),
        Pair.new(Pair.new(4, 3), "b"),
        Pair.new(Pair.new(9, 3), "b"),
        Pair.new(Pair.new(7, 4), "b"),
        Pair.new(Pair.new(3, 5), "b"),
        Pair.new(Pair.new(7, 6), "b"),
        Pair.new(Pair.new(2, 9), "b"),
        Pair.new(Pair.new(5, 9), "b"),
        Pair.new(Pair.new(2, 10), "b")
    ]),
    Level.new("Level 9 of 10", [
        "  wwww          ", # 0 
        "  w  wwwwwwwwwww", # 1
        "  w            w", # 2
        "  w  w   w     w", # 3
        "  w       w    w", # 4
        "www  w w  wwww w", # 5
        "w w       ww   w", # 6
        "w      w w   w w", # 7
        "ww             w", # 8
        " wwww  wwwwwwwww", # 9
        "  www  www      ", # 10
        "  w      w      ", # 11
        "  w      w      ", # 12
        "  wttttttw      ", # 13
        "  wttttttw      ", # 14
        "  wttttttw      ", # 15
        "  wwwwwwww      "  # 16
        #0123456789012345
    ], [
        Pair.new(Pair.new(6, 1), "p"),
        Pair.new(Pair.new(6, 3), "b"),
        Pair.new(Pair.new(3, 4), "b"),
        Pair.new(Pair.new(5, 4), "b"),
        Pair.new(Pair.new(8, 4), "b"),
        Pair.new(Pair.new(4, 5), "b"),
        Pair.new(Pair.new(6, 5), "b"),
        Pair.new(Pair.new(7, 5), "b"),
        Pair.new(Pair.new(2, 7), "b"),
        Pair.new(Pair.new(3, 7), "b"),
        Pair.new(Pair.new(4, 7), "b"),
        Pair.new(Pair.new(6, 7), "b"),
        Pair.new(Pair.new(7, 8), "b"),
        Pair.new(Pair.new(8, 9), "b"),
        Pair.new(Pair.new(2, 11), "b"),
        Pair.new(Pair.new(8, 11), "b"),
        Pair.new(Pair.new(3, 12), "b"),
        Pair.new(Pair.new(2, 13), "b"),
        Pair.new(Pair.new(8, 13), "b")
    ]),
    Level.new("Level 10 of 10", [
        "          wwwwwww", # 0 
        "          w  tttw", # 1
        "      wwwww  tttw", # 2
        "      w      tttw", # 3
        "      w  ww  tttw", # 4
        "      ww ww  tttw", # 5
        "     www wwwwwwww", # 6
        "     w     ww    ", # 7
        " wwwww      wwwww", # 8
        "ww   w      w   w", # 9
        "w               w", # 10
        "wwwwww      wwwww", # 11
        "     w      w    ", # 12
        "     wwww www    ", # 13
        "        w  w     ", # 14
        "        w  w     ", # 15
        "        w  w     ", # 16
        "        wwww     ", # 17
        #01234567890123456
    ], [
        Pair.new(Pair.new(10, 1), "p"),
        Pair.new(Pair.new(10, 3), "b"),
        Pair.new(Pair.new(9, 6), "b"),
        Pair.new(Pair.new(10, 6), "b"),
        Pair.new(Pair.new(7, 7), "b"),
        Pair.new(Pair.new(11, 7), "b"),
        Pair.new(Pair.new(12, 7), "b"),
        Pair.new(Pair.new(7, 8), "b"),
        Pair.new(Pair.new(8, 8), "b"),
        Pair.new(Pair.new(9, 8), "b"),
        Pair.new(Pair.new(11, 8), "b"),
        Pair.new(Pair.new(7, 9), "b"),
        Pair.new(Pair.new(8, 10), "b"),
        Pair.new(Pair.new(11, 10), "b"),
        Pair.new(Pair.new(10, 11), "b"),
        Pair.new(Pair.new(10, 14), "b")
    ])
]