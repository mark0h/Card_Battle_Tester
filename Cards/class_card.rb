

class ClassCard

  def take_damage(damage, damage_type)
    defend_damage = instance_variable_get("@#{damage_type}")
    final_damage = damage + defend_damage
    final_damage = 1 if final_damage < 1  #MOST you can block is 1
    @health -= final_damage
    @health = 0 if @health < 0
  end

end
