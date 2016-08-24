require_relative 'AttackCard'

class Barbarian
  attr_accessor :name, :attack, :health
  def initialize()
    @name = "Barbarian"
    @attack = [AttackCard::SWING, AttackCard::SLASH]
    @health = 30
  end

  def take_damage(amount)
    @health -= amount
    if @health < 0
      @health = 0
    end
  end

end
