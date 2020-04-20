class Level
    attr_reader :name, :map_data, :entity_data
    
    def initialize(name, map_data, entity_data)
        @name, @map_data, @entity_data = name, map_data, entity_data
    end
end