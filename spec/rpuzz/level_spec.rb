require File.join(File.dirname(__FILE__), '/../spec_helper')

module RPuzz
  describe Level do
    
    it "should load a level description from file" do
      RPuzz::Level.new('level/octothorpe.level')
    end
    
  end
end
