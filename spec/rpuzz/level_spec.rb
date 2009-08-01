require File.join(File.dirname(__FILE__), '/../spec_helper')

module RPuzz
  describe Level do
    before do
      @level = RPuzz::Level.new(File.join(File.dirname(__FILE__), '/../../test/octothorpe.rpuzz'))
    end
    
    it "should load a level from a file" do
      @level.level.size.should == 20
      @level.name.should == "octothorpe"
      @level.author.should == "Jim Thomson"
      @level.level.each {|line| line.size.should == 19}
    end
    
    it "should print the level to the specified IO thingy" do
      str = StringIO.new
      @level.paint(str)
      bits = str.string.split("\n")
      bits.size.should == 20
      bits.each{|line| line.size.should == 19}
      bits[1][1,1].should == "O"
      bits[2][0,1].should == "#"
      bits[4][5,1].should == "*"
      bits[4][6,1].should == "+"
    end

    it "should return the character at a location" do
      @level.at(1,1).should == "O"
      @level.at(2,0).should == "#"
      @level.at(4,5).should == "*"
      @level.at(4,6).should == "+"
    end
    
    it "should return the characters surrounding a location" do
      @level.above(4,6).should == "#"
      @level.below(4,6).should == "#"
      @level.left_of(4,6).should == "*"
      @level.right_of(4,6).should == " "
    end
    
    it "should move a character when requested and there is nothing blocking it" do
      @level.at(4,6).should == "+"
      @level.move_right(4,6).should_not be_nil
      @level.at(4,6).should == " "
      @level.at(4,7).should == "+"
      @level.move_up(4,7).should_not be_nil
      @level.at(4,7).should == " "
      @level.at(3,7).should == "+"
      @level.move_down(3,7).should_not be_nil
      @level.at(3,7).should == " "
      @level.at(4,7).should == "+"
      @level.move_left(4,7).should_not be_nil
      @level.at(4,7).should == " "
      @level.at(4,6).should == "+"
    end

    it "should not move a character when requested but something is blocking it" do
      @level.at(4,6).should == "+"
      @level.move_up(4,6).should be_nil
      @level.at(4,6).should == "+"
      @level.at(3,6).should == "#"
      @level.move_down(4,6).should be_nil
      @level.at(4,6).should == "+"
      @level.at(5,6).should == "#"
    end
    
    it "should remove a diamond when requested" do
      @level.at(4,5).should == "*"
      @level.eat_diamond(4,5).should_not be_nil
      @level.at(4,5).should == " "
    end
  
    it "should not remove anything if it is not a diamond" do
      @level.at(3,5).should == "O"
      @level.eat_diamond(3,5).should be_nil
      @level.at(3,5).should == "O"
    end
  
  end
end
