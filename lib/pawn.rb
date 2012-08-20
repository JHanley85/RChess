require 'ruleerrors'
class Pawn 

  def self.is_move_valid(from,to,player,capture=false)
    cols={"a"=>1,"b"=>2,"c"=>3,"d"=>4,"e"=>5,"f"=>6,"g"=>7,"h"=>8}
    f_col=cols[from[1]]
    t_col=cols[to[1]]
    player=="W" ? orient=1 : orient=-1
    valid_capture=((t_col-f_col).abs==1)
      case (to[0].to_i-from[0].to_i)*orient
        when 1
          if capture
            raise InvalidMoveError, "Invalid capture target" unless valid_capture   
            true
          else
            true
          end 
        when 2
          case player
            when "W"
              raise InvalidMoveError, "Pawns may only move 2 spaces in their initial move" unless from[0].to_i==2 
              true
            when "B"
              raise InvalidMoveError, "Pawns may only move 2 spaces in their initial move" unless from[0].to_i==7
              true
            else
              raise InvalidMoveError, "Invalid Team Selector"
          end
        else
            raise InvalidMoveError, "Invalid Move"
        end
     end  
  
end
