require 'ruleerrors'
require 'pawn'
class Board
  def initialize
     @wpip={"pa"=>"2a","pb"=>"2b","pc"=>"2c","pd"=>"2d","pe"=>"2e","pf"=>"2f","pg"=>"2g","ph"=>"2h"}
     @bpip={"pa"=>"7a","pb"=>"7b","pc"=>"7c","pd"=>"7d","pe"=>"7e","pf"=>"7f","pg"=>"7g","ph"=>"7h"}
     @turn="W"
  end
  def locate(id,player)
      player=='W'? @wpip[id] : @bpip[id] 	     
  end
  def pip_count
    return @wpip.count+@bpip.count
  end
  def state
    @locations=Hash.new
    @wpip.each_pair do |k,v|
      @locations[v]=k[0]
    end
    @bpip.each_pair do |k,v|
      @locations[v]=k[0].capitalize!
    end
  end
  def print
    self.state
    @board={"8"=>{"a"=>" ","b"=>" ","c"=>" ","d"=>" ","e"=>" ","f"=>" ","g"=>" ","h"=>" "},
            "7"=>{"a"=>" ","b"=>" ","c"=>" ","d"=>" ","e"=>" ","f"=>" ","g"=>" ","h"=>" "},
            "6"=>{"a"=>" ","b"=>" ","c"=>" ","d"=>" ","e"=>" ","f"=>" ","g"=>" ","h"=>" "},
            "5"=>{"a"=>" ","b"=>" ","c"=>" ","d"=>" ","e"=>" ","f"=>" ","g"=>" ","h"=>" "},
            "4"=>{"a"=>" ","b"=>" ","c"=>" ","d"=>" ","e"=>" ","f"=>" ","g"=>" ","h"=>" "},
            "3"=>{"a"=>" ","b"=>" ","c"=>" ","d"=>" ","e"=>" ","f"=>" ","g"=>" ","h"=>" "},
            "2"=>{"a"=>" ","b"=>" ","c"=>" ","d"=>" ","e"=>" ","f"=>" ","g"=>" ","h"=>" "},
            "1"=>{"a"=>" ","b"=>" ","c"=>" ","d"=>" ","e"=>" ","f"=>" ","g"=>" ","h"=>" "}}  
    @locations.each_pair do |k,v|
      @board[k[0]][k[1]]=v      
     end 
    puts "Current State:"
    8.times do |i|
      row=Array.new
      @board[(8-i).to_s].each_pair do |k,v|
        row<<v
      end
      puts row.join("|")
    end
    puts "White: #{@wpip.count} / Black: #{@bpip.count}"
  end
  def move(id, to, player)
    if @turn==player
      from=self.locate(id,player)
      case id[0]
        when "p" 
          if Pawn.is_move_valid(from,to,player)
            self.update(id,to,player)
            @turn=="W" ? @turn="B" : @turn="W"
          end
         else 
          false
       end
    else
      raise OutOfTurnError
    end
  end
  def update(id,to,player)
    if player=="W"
      @wpip[id]=to
    else
      @bpip[id]=to
    end
  end
end
		
