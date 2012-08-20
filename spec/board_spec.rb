require 'board'

describe Board, "initial placement" do
  it "initializes the board" do  
    board= Board.new
    board.pip_count.should eq(32)
  end
  it "locates pieces" do
    board=Board.new
    board.locate("pa","W").should eq("2a")
    board.locate("pa","B").should eq("7a")
  end
  it "updates locations" do
    board=Board.new
    board.update("pa","3a","W")
    board.locate("pa","W").should eq("3a")
  end
  it "removes captured pieces" do
    board=Board.new
    board.capture("pa","W")
    board.pip_count.should eq(31)
  end

  it "should be complete" do
    board=Board.new
    board.move("pa","4a","W")
    board.move("pb","5b","B")
    board.move("pa","5b","W")
    board.pip_count.should eq(31)
  end  
end
