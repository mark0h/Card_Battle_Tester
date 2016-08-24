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

puts "Welcome to the random battle generator!"
gets.chomp #gets.chomp will be used to pause output until ENTER is pressed
puts "player one is a #{player_one.class_name} with #{player_one.class_health} health"
# gets.chomp
puts "player two is a #{player_two.class_name} with #{player_two.class_health} health"
puts "\nLet the BATTLE begin!!!"

until player_dead

  gets.chomp
  player_one_attack = player_one.attack
  puts "Player one #{player_one_attack[0]} that does #{player_one_attack[1]} damage."
  gets.chomp
  block = player_two.defend(player_one_attack[1])
  puts "Player two blocks #{block} damage and loses #{player_one_attack[1] - block} health. #{player_two.class_health} health left."
  if player_two.class_health == 0
    puts "Player one has killed player two. Player one wins!"
    player_dead = true
    exit
  end

  gets.chomp
  player_two_attack = player_two.attack
  puts "Player two #{player_two_attack[0]} that does #{player_two_attack[1]} damage."
  gets.chomp
  block = player_one.defend(player_two_attack[1])
  puts "Player one blocks #{block} damage and loses #{player_two_attack[1] - block} health. #{player_one.class_health} health left."
  if player_one.class_health == 0
    puts "Player two has killed player two. Player two wins!"
    player_dead = true
    exit
  end

end
