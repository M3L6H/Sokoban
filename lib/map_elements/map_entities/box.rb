require_relative "./map_entity.rb"

class Box < MapEntity
    def done=(val)
        @done = val
    end

    def done?
        @done == true
    end
    
    def to_s
        "☒".center(2)
    end
end