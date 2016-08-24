require_relative 'Barbarian'
require_relative 'Sorcerer'

class ClassCard

  attr_accessor :class_type, :rand_class_num

  def initialize(player, same_class = true, other_player = nil)

    if same_class
      class_type_num = rand(2)

      if class_type_num == 0
        @class_type = Sorcerer.new()
      elsif class_type_num == 1
        @class_type = Barbarian.new()
      else
        puts "error! random set too high!"
      end

    else

      if other_player == 0
        @class_type = Barbarian.new()
      elsif other_player == 1
        @class_type = Sorcerer.new()
      else
        class_type_num = rand(2)
        @rand_class_num = class_type_num
        if class_type_num == 0
          @class_type = Sorcerer.new()
        elsif class_type_num == 1
          @class_type = Barbarian.new()
        else
          puts "error! random set too high!"
        end
      end

    end

  end

  def class_name()
    return @class_type.name
  end

  def class_health()
    return @class_type.health
  end

  def attack()
    rand_num = rand(2)
    return @class_type.attack[rand_num]
  end

  def defend(attack_value)
    rand_block = rand(2)
    damage_taken = attack_value - rand_block
    @class_type.take_damage(damage_taken)
    return rand_block
  end

end
