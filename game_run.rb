require_relative 'AttackCard'
require_relative 'ClassCard'

# puts "Barbarian #{AttackCard::SWING[0]} for #{AttackCard::SWING[1]} damage"


# test_class = ClassCard.new(1)
# puts "Selected #{test_class.class_name}"
# test_attack = test_class.attack
# puts "#{test_class.class_name} #{test_attack[0]} for #{test_attack[1]} damage"


player_one = ClassCard.new(1, false)
player_two = ClassCard.new(2, false, player_one.rand_class_num)
player_dead = false

puts ""
puts "Welcome to the random battle generator!"
puts ""

puts "What would you like to do? Type quit to exit"
puts "1. Run a battle simulation"
puts "2. Play as player one against the computer"
player_selection = gets.chomp

if player_selection == "1"

  puts "You have decided to run a full similated battle! Hit enter to go to next action. "
  sleep(2)

  puts "player one is a #{player_one.class_name} with #{player_one.class_health} health"
  # gets
  puts "player two is a #{player_two.class_name} with #{player_two.class_health} health"
  puts "\nLet the BATTLE begin!!!"

  until player_dead

    gets
    player_one_attack = player_one.attack
    puts "Player one #{player_one_attack[0]} that does #{player_one_attack[1]} damage."
    gets
    block = player_two.defend(player_one_attack[1])
    puts "Player two blocks #{block} damage and loses #{player_one_attack[1] - block} health. #{player_two.class_health} health left."
    if player_two.class_health == 0
      puts "Player one has killed player two. Player one wins!"
      player_dead = true
      exit
    end

    gets
    player_two_attack = player_two.attack
    puts "Player two #{player_two_attack[0]} that does #{player_two_attack[1]} damage."
    gets
    block = player_one.defend(player_two_attack[1])
    puts "Player one blocks #{block} damage and loses #{player_two_attack[1] - block} health. #{player_one.class_health} health left."
    if player_one.class_health == 0
      puts "Player two has killed player two. Player two wins!"
      player_dead = true
      exit
    end

  end

elsif player_selection == "2"
  puts "You have chosen to control player one! Fun!"
  puts ""
  player_selected = false
  puts "Select your class.  Type quit to exit"
  puts "1. Sorcerer"
  puts "2. Barbarian"
  player_class_selection = gets.chomp

  if player_class_selection == "1"
    player_one = ClassCard.new(1, false, nil, 0)
    player_two = ClassCard.new(2, false, player_one.rand_class_num)
    puts "You have selected the #{player_one.class_name}"
  elsif player_class_selection == "2"
    player_one = ClassCard.new(1, false, nil, 1)
    player_two = ClassCard.new(2, false, player_one.rand_class_num)
    puts "You have selected the #{player_one.class_name}"
  elsif player_class_selection == "quit"
    puts "Goodbye!"
    exit
  end

  #GAMEPLAY CODE
  player_dead = false
  round_over = false

  #who goes first selector
  initial_turn_start = rand(2)
  whose_turn = initial_turn_start

  #GAME Loop
  until player_dead

    #TURN loop
    until round_over
    end

  end  


elsif player_selection == "quit"
  puts "Goodbye!"
  exit
else
  puts "just running else?"
end
