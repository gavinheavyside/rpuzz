module RPuzz
  class Level
    attr_reader :level
    attr_reader :author
    attr_reader :name

    def initialize(level)
      load_level(level)
    end

    def paint(io)
      @level.each {|line| io.puts line}
    end
    
    def at(x,y)
      @level[x][y,1]
    end

    def above(x,y)
      at(x-1,y)
    end
    
    def below(x,y)
      at(x+1,y)
    end
    
    def left_of(x,y)
      at(x,y-1)
    end
    
    def right_of(x,y)
      at(x,y+1)
    end
    
    def move_up(x,y)
      swap(x-1,y,x,y) if above(x,y) == " "
    end
    
    def move_down(x,y)
      swap(x+1,y,x,y) if below(x,y) == " "
    end
    
    def move_right(x,y)
      swap(x,y+1,x,y) if right_of(x,y) == " "
    end
    
    def move_left(x,y)
      swap(x,y,x,y-1) if left_of(x,y) == " "
    end
    
    def eat_diamond(x,y)
      set(x,y, " ") if at(x,y) == "*"
    end
    
  private
  
    def set(x,y, character)
      @level[x][y] = character
    end
    
    def swap(x,y,x2,y2)
      tmp = at(x,y)
      set(x,y, at(x2,y2))
      set(x2,y2,tmp)
    end
    
    def load_level(level)
      @level = []
      File.open(level).each_line do |line|
        line = line.chomp
        @level.push(line) if line =~ /#/
        @author = $1 if line =~ /^AUTHOR (.*)$/
        @name = $1 if line =~ /^LEVELNAME (.*)$/
      end
    end
  end
end
