=begin

  --Winner Logic--

  # rock > lizard, scissors
  # paper > rock, spock
  # scissors > paper, lizard
  # lizard > spock, paper
  # spock > scissors, rock

   --Added Bonus Features--

  0. Keeping Score
    Note: You can select how many rounds you'd like to play
  1. Add Lizard and Spock

=end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def scissors?
    @wins = ['paper', 'lizard']
    @losses = ['rock', 'spock']
    @value == 'scissors'
  end

  def rock?
    @wins = ['scissors', 'lizard']
    @losses = ['paper', 'spock']
    @value == 'rock'
  end

  def paper?
    @wins = ['rock', 'spock']
    @losses = ['scissors', 'lizard']
    @value == 'paper'
  end

  def lizard?
    @wins = ['spock', 'paper']
    @losses = ['rock', 'scissors']
    @value == 'lizard'
  end

  def spock?
    @wins = ['rock', 'scissors']
    @losses = ['paper', 'lizard']
    @value == 'spock'
  end

  def >(other_move)
    other_move = other_move.to_s

    (rock? && @wins.include?(other_move)) ||
      (paper? && @wins.include?(other_move)) ||
      (scissors? && @wins.include?(other_move)) ||
      (lizard? && @wins.include?(other_move)) ||
      (spock? && @wins.include?(other_move))
  end

  def <(other_move)
    other_move = other_move.to_s

    (rock? && @losses.include?(other_move)) ||
      (paper? && @losses.include?(other_move)) ||
      (scissors? && @losses.include?(other_move)) ||
      (lizard? && @losses.include?(other_move)) ||
      (spock? && @losses.include?(other_move))
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'The Matrix'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def create_empty_scoreboard
    @human_score = 0
    @computer_score = 0
  end

  def select_number_of_rounds
    puts "How many rounds would you like to play?"
    begin
      @rounds = gets.chomp
      @rounds = Integer(@rounds)
    rescue ArgumentError
      puts "Sorry, must enter a number"
      retry
    end
    puts "First to #{@rounds} victories wins the game!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def update_score
    if human.move > computer.move
      @human_score += 1
    elsif human.move < computer.move
      @computer_score += 1
    end
  end

  def display_score
    puts "#{human.name} now has #{@human_score} points" \
    " and #{computer.name} has #{@computer_score} points"
    puts "      "
  end

  def display_game_winner
    if @human_score == @rounds
      puts "Congrats #{human.name}! You've won the game!"
    elsif @computer_score == @rounds
      puts "#{computer.name} has won the game. Better luck next time!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end
    system 'clear'

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def game_setup
    display_welcome_message
    select_number_of_rounds
    create_empty_scoreboard
  end

  def play_round
    human.choose
    computer.choose
    display_moves
    display_round_winner
    update_score
    display_score
  end

  def play_game
    game_setup

    loop do
      until @human_score == @rounds || @computer_score == @rounds
        play_round
      end
      display_game_winner
      create_empty_scoreboard
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play_game
