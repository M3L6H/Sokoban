require_relative "./map_entity.rb"

class Player < MapEntity
    def to_s
        "⛑".center(2)
    end
end