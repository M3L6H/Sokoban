# Sokoban

A Sokoban clone made with Ruby and [Curses](https://github.com/ruby/curses) as
prep work for the second App Academy assessment.

## Instructions

Download the project or clone it with
`git clone https://github.com/M3L6H/Sokoban.git`. Run
`ruby ./play_sokoban.rb` to start the game.

## Description

You play as a factory worker. Your goal is to move crates onto a set of
designated locations. However, you can only push the crates. Pulling is out of
the question.

There are currently five levels available to solve, taken from
[this website](https://www.mathsisfun.com/games/sokoban.html). If I find the
time, I will add more/create my own.

## Creating Levels

You can add to the list of levels at any point by adding to
`lib/levels/all.rb`.

The level format is fairly easy to understand. Each map is
designated by an array of strings, with each string representing a row in the
map. Targets and walls are established here.

Additionally, a second array of locations and characters is created, specifying
where the crates and the player should start. More details are included in the
documentation inside `lib/map.rb`.
