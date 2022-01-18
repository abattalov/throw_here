class ThrowHere::Course

    attr_accessor :name, :city, :state, :num_of_holes

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.count
        @@all.count
    end
end