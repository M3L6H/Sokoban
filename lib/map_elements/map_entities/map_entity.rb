require_relative "../map_element.rb"

# @abstract Subclass and override {#to_s} to impelment
class MapEntity < MapElement
    def to_s; raise NotImplementedError end
end