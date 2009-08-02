require File.join(File.dirname(__FILE__), '/../spec_helper')

module RPuzz
  describe Sprite do
    it "should have the correct default behaviour" do
      sprite = Sprite.new
      sprite.edible.should be_false
      sprite.squashable.should be_false
      sprite.rolls_left.should be_false
      sprite.rolls_right.should be_false
      sprite.rollable_left.should be_false
      sprite.rollable_right.should be_false
    end
  end
end
