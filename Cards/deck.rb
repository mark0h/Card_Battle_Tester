

class Deck

  def initialize(class_selected)
    @player_class = Object.const_get(class_selected).new
    @player_
  end
end
