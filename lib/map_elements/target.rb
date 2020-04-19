require_relative "./map_element.rb"

class Target < MapElement
    def to_s
        "⛶".center(2)
    end
end