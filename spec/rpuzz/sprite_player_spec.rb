require File.join(File.dirname(__FILE__), '/../spec_helper')

module RPuzz
  describe SpritePlayer do
    it "should have the correct behaviour" do
      sprite = SpritePlayer.new
      sprite.edible.should be_false
      sprite.squashable.should be_true
      sprite.rolls_left.should be_false
      sprite.rolls_right.should be_false
      sprite.rollable_left.should be_true
      sprite.rollable_right.should be_true
    end
  end
end
