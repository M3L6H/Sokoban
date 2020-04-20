require "curses"

require_relative "./levels/all.rb"
require_relative "./map.rb"

# @author Michael Hollingworth
class Window
    def initialize
        Curses.init_screen
        Curses.curs_set(0) # don't show the cursor
        Curses.noecho # don't echo the keys we press

        @level_num = 0
        
        @game = Curses::Window.new(Curses.lines - 5, Curses.cols, 0, 0)
        @game.refresh

        @desc = Curses::Window.new(5, Curses.cols, Curses.lines - 5, 0)
        @desc.refresh
    end

    def get_input
        case @game.getch
        when Curses::Key::UP, "w"
            @map.move(:u)
        when Curses::Key::DOWN, "s"
            @map.move(:d)
        when Curses::Key::LEFT, "a"
            @map.move(:l)
        when Curses::Key::RIGHT, "d"
            @map.move(:r)
        when " "
            @map.restart
        when "q"
            return false
        end

        true
    end

    def print_game
        @game.clear
        @map.to_s.split("\n").each_with_index do |line, i|
            @game.setpos((Curses.lines - 5) / 2 - @map.height / 2 + i, Curses.cols / 2 - @map.width / 2)
            @game << line + "\n"
        end
        @game.refresh
    end

    def print_desc
        @desc.clear
        @desc.setpos(0, 0)
        @desc << "━" * Curses.cols
        @desc << @level.name + "\n"
        @desc << "Use WASD or the arrow keys to move\n"
        @desc << "Press space to restart\n"
        @desc << ", takes you to the previous level while . moves you forward"
        @desc.refresh
    end

    def start
        begin
            @level = Level::LEVELS[@level_num]
            @map = Map.new(@level.map_data, @level.entity_data)
            self.print_game
            self.print_desc
            while get_input
                self.print_game
            end
        ensure
            Curses.close_screen
        end
    end
end