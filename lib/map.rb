require_relative "./map_elements/all.rb"

# @author Michael Hollingworth
class Map
    
    
    # Initializes a new instance of Map
    #
    # @param map [Array<String>] a list of strings describing the map
    #   The strings should all have the same length
    #   The strings should adhere to the following format:
    #   - " " for empty space
    #   - "b" for a box
    #   - "p" for the player start. There should only be one!
    #   - "t" for a target. There should be the same number of boxes and targets
    #   - "w" for a wall
    # @return [Map] a new map instance
    # @raise [MapFormatError] if the passed map is in an incorrect format
    def initialize(map)
        raise MapFormatError    unless map.is_a? Array
        raise MapHeightError    unless map.size >= 1
        raise MapFormatError    unless map[0].is_a? String
        raise MapWidthError     unless map[0].size >= 1
        raise MapRowError       unless map.all?{ |row| row.size == map[0].size }
        
        @height = map.size
        @width = map[0].size
        
        make_map(map)
    end

    def to_s
        str = ""

        each_in_map do |i, j|
            str += (@entities[i][j] ? @entities[i][j].to_s : @map[i][j].to_s)
            str += "\n" if j == width - 1
        end
        
        str
    end

    private

    attr_reader :height, :width

    def each_in_map(&prc)
        (0...height).each do |i|
            (0...width).each do |j|
                prc.call(i, j)
            end
        end
    end

    # Uses the passed map to generate @map and @entities members
    #
    # @param map [Array<string>] a list of strings describing the map
    # @return [nil]
    # @raise [MapFormatError] if an invalid symbol is found
    def make_map(map)
        @map = Array.new(height) { Array.new(width) }
        @entities = Array.new(height) { Array.new(width) }

        each_in_map do |i, j|
            ele = get_element(map[i][j])
            ele.is_a?(MapEntity) ? @entities[i][j] = ele : @map[i][j] = ele
        end

        nil
    end

    # Returns a new instance of the MapElement corresponding to the passed
    #   symbol
    #
    # @param sym [Char] a single character representing the symbol to look up
    # @return [MapElement] a MapElement instance
    # @raise [MapFormatError] if no match for the symbol is found
    def get_element(sym)
        case sym
        when " "
            Air.new
        when "b"
            Box.new
        when "p"
            Player.new
        when "t"
            Target.new
        when "w"
            Wall.new
        else
            raise MapElementError
        end
    end
end

# Error definitions
class Map
    class MapFormatError < ArgumentError
        def message
            "Map should be an array of strings!"
        end
    end

    class MapHeightError < MapFormatError
        def message
            "Map should have at least one row!"
        end
    end
    
    class MapWidthError < MapFormatError
        def message
            "Map should have at least one column!"
        end
    end

    class MapRowError < MapFormatError
        def message
            "Map should have rows of equal length!"
        end
    end

    class MapElementError < MapFormatError
        def message
            %{
                Map elements should be one of the following: 
                    - " "
                    - "b"
                    - "p"
                    - "t"
                    - "w"
            }.gsub(/^\s+/, "")
        end
    end
end