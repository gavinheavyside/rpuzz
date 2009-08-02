module RPuzz
  class SpritePlayer < Sprite
    
    def initialize()
      super
      @squashable = true
      @rollable_left = true
      @rollable_right = true
    end
  end
end