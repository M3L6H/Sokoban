require_relative "../util/pair.rb"

require_relative "./map_elements/all.rb"

# @author Michael Hollingworth
class Map
    attr_reader :height, :width
    
    # Initializes a new instance of Map
    #
    # @param map_data [Array<String>] a list of strings describing the map
    #   The strings should all have the same length
    #   The strings should adhere to the following format:
    #   - " " for empty space
    #   - "t" for a target. There should be the same number of boxes and targets
    #   - "w" for a wall
    # @param entity_data [Array<Pair<Pair<Numeric>,String>] an array of pairs
    #   describing the locations of entities
    #   Entities should be either "p" for player or "b" for box
    # @return [Map] a new map instance
    # @raise [MapFormatError] if the passed map is in an incorrect format
    def initialize(map_data, entity_data)
        raise MapFormatError unless map_data.is_a? Array
        raise MapHeightError unless map_data.size >= 1
        raise MapFormatError unless map_data[0].is_a? String
        raise MapWidthError  unless map_data[0].size >= 1
        raise MapRowError unless map_data.all?{ |r| r.size == map_data[0].size }
        
        @map_data = map_data
        @entity_data = entity_data
        @height = map_data.size
        @width = map_data[0].size
        
        make_map(map_data, entity_data)
    end

    def restart
        @player = nil
        make_map(map_data, entity_data)
    end

    def win?
        boxes.all?(&:done?)
    end

    # Moves the player in the specified direction
    #
    # @param dir [Symbol] a symbol indicating the direction to move in
    #   :u -> up
    #   :d -> down
    #   :l -> left
    #   :r -> right
    # @return [Boolean] whether or not the move was successful
    # @raise [ArgumentError] if the passed symbol is not recognized
    def move(dir)
        delta = Pair.new(0, 0)

        # Figure out which direction we want to head
        case dir
        when :u
            delta.x -= 1 
        when :d
            delta.x += 1
        when :l
            delta.y -= 1
        when :r
            delta.y += 1
        else
            raise ArgumentError, "Unrecognized direction #{dir}!"
        end

        new_p = player_pos + delta
        
        # We cannot head into a wall
        return false if @map[new_p.x][new_p.y].is_a? Wall

        entity = @entities[new_p.x][new_p.y]

        # Are we trying to push a box?
        if entity.is_a? Box
            new_bp = new_p + delta

            # Boxes can only be pushed into empty spaces/targets
            return false if @map[new_bp.x][new_bp.y].is_a?(Wall) || @entities[new_bp.x][new_bp.y].is_a?(Box)

            # Move the box
            @entities[new_bp.x][new_bp.y] = entity
            @entities[new_p.x][new_p.y] = nil

            # Update its done state
            entity.done = @map[new_bp.x][new_bp.y].is_a?(Target)
        end

        # Move the player
        @entities[new_p.x][new_p.y] = player
        @entities[player_pos.x][player_pos.y] = nil

        # Update the player position
        player_pos.x = new_p.x
        player_pos.y = new_p.y

        true
    end

    def to_s
        str = ""

        each_in_map do |i, j|
            str += (@entities[i][j] ? @entities[i][j].to_s : @map[i][j].to_s)
            str += "\n" if j == self.width - 1
        end
        
        str
    end

    private

    attr_reader :player, :player_pos, :boxes, :map, :map_data, :entity_data

    def each_in_map(&prc)
        (0...self.height).each do |i|
            (0...self.width).each do |j|
                prc.call(i, j)
            end
        end
    end

    # Uses the passed map to generate @map and @entities members
    #
    # @param map [Array<string>] a list of strings describing the map
    # @return [nil]
    # @raise [MapFormatError] if an invalid symbol is found
    def make_map(map_data, entity_data)
        @map = Array.new(self.height) { Array.new(self.width) }
        @entities = Array.new(self.height) { Array.new(self.width) }
        @boxes = []

        each_in_map do |i, j|
            @map[i][j] = get_element(map_data[i][j])
        end

        entity_data.each do |pair|
            pos, entity = pair.first, get_element(pair.second)

            @entities[pos.x][pos.y] = entity

            if entity.is_a? Player
                raise MapPlayerError if player
                @player = entity
                @player_pos = Pair.new(pos.x, pos.y) 
            elsif entity.is_a? Box
                @boxes << entity
                entity.done = true if @map[pos.x][pos.y].is_a?(Target)
            end
        end

        raise MapPlayerError unless player

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

    class MapPlayerError < MapFormatError
        def message
            "Map should contain one player!"
        end
    end
end