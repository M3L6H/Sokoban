# @author Michael Hollingworth
class Pair
    attr_accessor :first, :second
    
    def initialize(a, b)
        @first = a
        @second = b
    end

    def x
        @first
    end

    def y
        @second
    end

    def x=(val)
        @first = val
    end

    def y=(val)
        @second = val
    end

    def +(other)
        Pair.new(@first + other.first, @second + other.second)
    end

    def -(other)
        Pair.new(@first - other.first, @second - other.second)
    end

    def ==(other)
        @first == other.first && @second == other.second
    end

    def [](idx)
        raise IndexError.new("Invalid index! Expected value between 0 and 1. Instead received #{idx}.") unless (0..1) === idx
        idx == 0 ? @first : @second
    end
end