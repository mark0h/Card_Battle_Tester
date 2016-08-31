

class SkillCard

  def initialize(name, card_type, cost, attack, damage, description, cooldown, buff, debuff, targets = 1)

    @name = name
    @card_type = card_type
    @cost = cost
    @attack = attack
    @damage = damage
    @description = description
    @cooldown = cooldown
    @used_cooldown = cooldown
    @buff = buff
    @debuff = debuff
    @targets - targets

  end

  def use_card
    @used_cooldown = 0
  end

  def ready_to_play?
    @used_cooldown += 1
    return true if @used_cooldown == @cooldown

    return false

  end


end
