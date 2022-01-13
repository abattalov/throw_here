class Course

    attr_accessor :name, :city, :state, :postal_code, :num_of_holes

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