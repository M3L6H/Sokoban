require_relative "./map_entity.rb"

class Box < MapEntity
    def to_s
        "☒".center(2)
    end
end