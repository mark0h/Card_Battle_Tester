require_relative 'ClassCard'

class Barbarian < ClassCard

  attr_reader :health

  def initialize

    @health = 45
    @mp = 0
    @rp = 0
    @ms = 2
    @rs = 2
    @full_deck = {}
    @play_deck = {}
    @cooldown_deck = {}

    set_full_deck

  end

  def play_card(card_name)

    card_played = @play_deck[card_name]
    card_played.use_card

    #Remove from hash
    @play_deck.tap {|a| a.delete(card_name) }

    #Add to cooldown deck(even if no cooldown)
    @cooldown_deck[card_name] = card_played

  end

  def end_turn

    #First we increase cooldown timer for each card in cooldown Deck
    @cooldown_deck.each do |key, card|
      card_ready = card.ready_to_play?
      if card_ready
        #If ready add back to full_deck not play_deck
        @cooldown_deck.tap {|a| a.delete(key)}
        @full_deck[key] = card
      end
    end

  end


  private
  def set_full_deck  #This will be in a DB eventually!
    #(name, card_type, cost, attack, damage, description, cooldown, buff, debuff, targets = 1)
    @full_deck["Ground Slam"] = SkillCard.new("Ground Slam", "attack", 1, "mp", 4, "Slams the ground, simple but effective", 0, "", "", targets = 2)
    @full_deck["Overpower"] = SkillCard.new("Overpower", "defense", 1, "mp", 4, "Counters an attack, with strength", 1, "", "", targets = 1)

  end

end
