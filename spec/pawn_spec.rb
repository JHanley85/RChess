require 'pawn'
require 'board'
require 'ruleerrors'
describe Pawn, "Move" do

  it "should raise errors" do
   lambda{ raise InvalidMoveError}.should raise_error
   lambda{ raise OutOfTurnError}.should raise_error
  end


  it "moves forward valid?" do
    board=Board.new
    Pawn.is_move_valid("2a","3a","W").should be_true
    lambda{ Pawn.is_move_valid("2a","2b","W")}.should raise_error
    Pawn.is_move_valid("2a","4a","W").should be_true
    lambda{ Pawn.is_move_valid("3a","5a","W")}.should raise_error
    Pawn.is_move_valid("7a","6a","B").should be_true
    lambda{ Pawn.is_move_valid("7a","7b","B")}.should raise_error
    Pawn.is_move_valid("7a","5a","B").should be_true
    lambda{ Pawn.is_move_valid("6a","4a","B")}.should raise_error
  end

  it "updates pieces in play, raises errors" do
   board=Board.new
   board.move("pa","3a","W")
   board.move("pa","6a","B")
   lambda{  board.move("pa","5a","W")}.should raise_error #Non-first double spaced move, Invalid Move Error
   lambda{  board.move("pb","6b","B")}.should raise_error #Out of turn move error
   puts board.print
  end

  it "can capture opposing pieces" do
    board=Board.new 
    board.update("pa","4a","W")
    board.update("pb","5b","B")
    board.move("pa","5b","W")
  end
end
