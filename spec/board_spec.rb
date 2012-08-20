require 'board'

describe Board, "initial placement" do
  it "initializes the board" do  
    board= Board.new
    board.pip_count.should eq(16)
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
 
end
