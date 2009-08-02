module RPuzz
  class Sprite
    attr_reader :edible
    attr_reader :squashable
    attr_reader :rolls_left
    attr_reader :rolls_right
    attr_reader :rollable_left
    attr_reader :rollable_right
    
    def initialize()
      @edible = false
      @squashable = false
      @rolls_left = false
      @rolls_right = false
      @rollable_left = false
      @rollable_right = false
    end
  end
end