class ThrowHere::Course

    attr_accessor :name, :city, :state, :num_of_holes

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end
end