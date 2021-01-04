=begin

The classical approach to object oriented programming is:

1. Write a textual description of the problem or exercise.

2. Extract the major nouns and verbs from the description.

3. Organize and associate the verbs with the nouns.

4. The nouns are the classes and the verbs are the behaviors or methods.

Notice that in OO, we don't think about the game flow logic at all. It's all about organizing and modularizing the code into a cohesive structure - classes. After we come up with the initial class definitions, the final step is to orchestrate the flow of the program using objects instantiated from the classes. We won't worry about that final step yet.



=end

class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
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
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'DogBot'].sample
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
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def create_empty_scoreboard
    @human_score = 0
    @computer_score = 0
  end

  def select_rounds
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
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"
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
    elsif computer.move > human.move 
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

  def play
    display_welcome_message
    select_rounds
    create_empty_scoreboard

    loop do
      until @human_score == @rounds || @computer_score == @rounds
        human.choose
        computer.choose
        display_moves
        display_round_winner
        update_score
        display_score
      end
      display_game_winner
      create_empty_scoreboard
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
