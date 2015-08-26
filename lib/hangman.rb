
def load_dictionary()
  dictionary = Array.new()
  if File.exist? "5desk.txt"
    dictionary_lines = File.readlines "5desk.txt"
    dictionary_lines.each do |line|
      dictionary.push(line)
    end
  else
    puts "Missing dictionary 5desk.txt"
  end
  return dictionary
end

def select_word(dictionary)
  word = "" 
  begin
    word = dictionary.sample
  end until word.to_s.length.between?(5,12)
  return  word
end

def build_board(length)
  board = Array.new(length)
  board.fill("_")
end

def display_board(board)
  display = board.join(" ")
  puts display
end
  
def take_turn(board, word)
  puts "Choose a letter"
  choice = gets.chomp
  word.split("").each_with_index {|letter, index| 
    if choice == word[index]
      board[index] = choice
    end
    }
  unless board.include? "_"
    abort("YOU WIN")
  end
  return board
end

def play_game
  max_turns = 10
  turn = 1
  dictionary = load_dictionary()
  word = select_word(dictionary)
  board = build_board(word.length - 2)
  while turn < max_turns do
    puts "You are on turn " + turn.to_s
    display_board(board)
    board = take_turn(board, word)
    turn += 1
  end
  puts "You lose: The word was... " + word
end

play_game()