require 'ruleerrors'
class Pawn 

  def self.is_move_valid(from,to,player)
    f_col=from[1].to_i
    t_col=to[1].to_i
    f_row=from[0].to_i
    t_row=to[0].to_i
    player=="W" ? o=1 : o=(-1)

    case (t_row-f_row)*o
      when 1
        true
      when 2
        if player=="W"
          raise InvalidMoveError unless f_row==2 
          true
        elsif player=="B"
          raise InvalidMoveError unless f_row==7
          true
        end
    else
      raise InvalidMoveError, "Invalid Move"
    end


  end
end
