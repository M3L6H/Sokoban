require_relative "./map_element.rb"

class Wall < MapElement
    def to_s
        "██".center(2)
    end
end