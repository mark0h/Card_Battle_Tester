require_relative 'AttackCard'

class Sorcerer
  attr_accessor :name, :attack, :health
  def initialize()
    @name = "Sorcerer"
    @attack = [AttackCard::FIREBALL, AttackCard::ELECTRO]
    @health = 25
  end

  def take_damage(amount)
    @health -= amount
    if @health < 0
      @health = 0
    end
  end
  
end
