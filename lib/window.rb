require "curses"

require_relative "./levels/all.rb"
require_relative "./map.rb"

# @author Michael Hollingworth
class Window
    def initialize
        Curses.init_screen
        Curses.start_color
        Curses.curs_set(0) # don't show the cursor
        Curses.noecho # don't echo the keys we press

        @level_num = 0
        
        @game = Curses::Window.new(Curses.lines - 5, Curses.cols, 0, 0)
        @game.refresh

        @desc = Curses::Window.new(5, Curses.cols, Curses.lines - 5, 0)
        @desc.refresh

        # Colors
        Curses.init_pair(1, 1, 0) # red
        Curses.init_pair(2, 2, 0) # green
        Curses.init_pair(3, 4, 0) # blue
    end

    def load_level
        @level = Level::LEVELS[@level_num]
        @map = Map.new(@level.map_data, @level.entity_data)
        self.print_desc
    end

    def next_level
        @level_num = [@level_num + 1, Level::LEVELS.size - 1].min
        self.load_level
    end

    def prev_level
        @level_num = [@level_num - 1, 0].max
        self.load_level
    end

    def get_input
        case @game.getch
        when "w"
            @map.move(:u)
        when "s"
            @map.move(:d)
        when "a"
            @map.move(:l)
        when "d"
            @map.move(:r)
        when " "
            @map.restart
        when "."
            self.next_level
        when ","
            self.prev_level
        when "q"
            return false
        end

        true
    end

    def get_color(color_str)
        case color_str
        when "0;31;49m"
            1
        when "0;32;49m"
            2
        when "0;34;49m"
            3
        else
            raise "Unrecognized color string: #{color_str}!"
        end
    end

    def print_game
        @game.clear
        @map.to_s.split("\n").each_with_index do |line, i|
            @game.setpos((Curses.lines - 5) / 2 - @map.height / 2 + i, Curses.cols / 2 - @map.width / 2)
            line.split("\e[").each do |color_str|
                match = color_str.match(/\d+;\d+;\d+m/)
                if match
                    @game.attron(Curses.color_pair(get_color(match.to_s))) { @game << color_str[color_str.index("m") + 1..-1] }
                else
                    @game << color_str.gsub(/0m/, "")
                end
            end
            @game << "\n"
        end
        @game.refresh
    end

    def print_desc
        @desc.clear
        @desc.setpos(0, 0)
        @desc << "━" * Curses.cols
        @desc << @level.name + "\n"
        @desc << "Use WASD to move. Press space to restart. q to quit.\n"
        @desc << "Push all the boxes onto the red targets.\n"
        @desc << ", takes you to the previous level while . moves you forward"
        @desc.refresh
    end

    def print_msg(msg)
        @desc.clear
        @desc.setpos(0, 0)
        @desc << "━" * Curses.cols
        @desc << msg
        @desc.refresh
    end

    def prompt_user(msg)
        self.print_msg(msg)
        case @desc.getch
        when "y"
            self.print_desc
            true
        else
            self.print_desc
            false
        end
    end

    def start
        begin
            self.load_level
            self.print_game
            while true
                if (@map.win?)
                    @map.restart
                    if @level_num == Level::LEVELS.size - 1
                        self.prompt_user("You have completed all the levels. Congratulations! (c)")
                    else
                        self.next_level if self.prompt_user("Level complete! Move to the next level? (y/n)")
                    end
                elsif !self.get_input
                    break if self.prompt_user("Are you sure you want to quit? (y/n)")
                end
                self.print_game
            end
        ensure
            Curses.close_screen
        end
    end
end