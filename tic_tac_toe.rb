class Board
  attr_reader :tl_box, :tc_box, :tr_box, :ml_box, :mr_box, :mc_box, :bl_box, :bc_box, :br_box
  def initialize
    @tl_box = Box.new("TL")
    @tc_box = Box.new("TC")
    @tr_box = Box.new("TR")
    @ml_box = Box.new("ML")
    @mc_box = Box.new("MC")
    @mr_box = Box.new("MR")
    @bl_box = Box.new("BL")
    @bc_box = Box.new("BC")
    @br_box = Box.new("BR")
  end
  def check_box(box,player)
    return box.check(player)
  end
  def display
    puts "#{@tl_box}#{@tc_box}#{@tr_box}"
    puts "#{@ml_box}#{@mc_box}#{@mr_box}"
    puts "#{@bl_box}#{@bc_box}#{@br_box}"
  end
  def tic_tac_toe?
    if ((@tl_box.checked && @tc_box.checked && @tr_box.checked) && @tl_box.who_checked == @tc_box.who_checked && @tc_box.who_checked == @tr_box.who_checked) #Top row
      puts "#{@tl_box.who_checked} wins!"
      return true
    elsif ((@ml_box.checked && @mc_box.checked && @mr_box.checked) && @ml_box.who_checked == @mc_box.who_checked && @mc_box.who_checked == @mr_box.who_checked) #Mid row
      puts "#{@ml_box.who_checked} wins!"
      return true
    elsif ((@bl_box.checked && @bc_box.checked && @br_box.checked) && @bl_box.who_checked == @bc_box.who_checked && @bc_box.who_checked == @br_box.who_checked) #Bottom row
      puts "#{@bl_box.who_checked} wins!"
      return true
    elsif ((@tl_box.checked && @ml_box.checked && @bl_box.checked) && @tl_box.who_checked == @ml_box.who_checked && @ml_box.who_checked == @bl_box.who_checked) #Left column
      puts "#{@tl_box.who_checked} wins!"
      return true
    elsif ((@tc_box.checked && @mc_box.checked && @bc_box.checked) && @tc_box.who_checked == @mc_box.who_checked && @mc_box.who_checked == @bc_box.who_checked) #Center column
      puts "#{@tc_box.who_checked} wins!"
      return true
    elsif ((@tr_box.checked && @mr_box.checked && @br_box.checked) && @tr_box.who_checked == @mr_box.who_checked && @mr_box.who_checked == @br_box.who_checked) #Rigth column
      puts "#{@tr_box.who_checked} wins!"
      return true
    elsif ((@tl_box.checked && @mc_box.checked && @br_box.checked) && @tl_box.who_checked == @mc_box.who_checked && @mc_box.who_checked == @br_box.who_checked) #Diagonal1
      puts "#{@tl_box.who_checked} wins!"
      return true
    elsif ((@tr_box.checked && @mc_box.checked && @bl_box.checked) && @tr_box.who_checked == @mc_box.who_checked && @mc_box.who_checked == @bl_box.who_checked) #Diagonal2
      puts "#{@tr_box.who_checked} wins!"
      return true
    elsif (@tl_box.checked && @tc_box.checked && @tr_box.checked && @ml_box.checked && @mc_box.checked && @mr_box.checked && @bl_box.checked && @bc_box.checked && @br_box.checked)
      puts "It's a draw!"
      return true
    else
      return false
    end
  end
end

class Box < Board
  attr_reader :who_checked
  attr_reader :checked
  def initialize(name)
    @name = name
    @checked = false
    @who_checked = ""
  end
  def check (player)
    unless @checked
      @checked = true;
      @who_checked = player
    else
      puts "Already checked!"
      return false
    end
  end
  def to_s
    if (@checked && @who_checked == "Cross player")
      return "[X]"
    elsif (@checked && @who_checked == "Circle player")
      return "[O]"
    else
      return "[ ]"
    end
  end
end

board = Board.new

def cross_player_play(board)
  puts "Cross player turn"
  pick = gets.chomp
  while (pick != "1" && pick != "2" && pick != "3" && pick != "4" && pick != "5" && pick != "6" && pick != "7" && pick != "8" && pick != "9")
    puts "Wrong command, pick again"
    pick = gets.chomp
  end
  case pick
  when "1"
    board.check_box(board.bl_box,"Cross player")
  when "2" 
    board.check_box(board.bc_box,"Cross player")
  when "3"
    board.check_box(board.br_box,"Cross player")
  when "4"
    board.check_box(board.ml_box,"Cross player")
  when "5"
    board.check_box(board.mc_box,"Cross player")
  when "6"
    board.check_box(board.mr_box,"Cross player")
  when "7"
    board.check_box(board.tl_box,"Cross player")
  when "8"
    board.check_box(board.tc_box,"Cross player")
  when "9"
    board.check_box(board.tr_box,"Cross player")
  end
  
end

def circle_player_play(board)
  puts "Circle player turn"
  pick = gets.chomp
  while (pick != "1" && pick != "2" && pick != "3" && pick != "4" && pick != "5" && pick != "6" && pick != "7" && pick != "8" && pick != "9")
    puts "Wrong command, pick again"
    pick = gets.chomp
  end
  case pick
  when "1"
    board.check_box(board.bl_box,"Circle player")
  when "2" 
    board.check_box(board.bc_box,"Circle player")
  when "3"
    board.check_box(board.br_box,"Circle player")
  when "4"
    board.check_box(board.ml_box,"Circle player")
  when "5"
    board.check_box(board.mc_box,"Circle player")
  when "6"
    board.check_box(board.mr_box,"Circle player")
  when "7"
    board.check_box(board.tl_box,"Circle player")
  when "8"
    board.check_box(board.tc_box,"Circle player")
  when "9"
    board.check_box(board.tr_box,"Circle player")
  end
end

puts "Welcome to tic tac toe, make your pick with the numerical keyboard, boxes are arranged in the same way"

while 1
  while(!cross_player_play(board))
  end
  board.display
  break if board.tic_tac_toe?
  while(!circle_player_play(board))
  end
  board.display
  break if board.tic_tac_toe?
end