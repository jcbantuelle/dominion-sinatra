class GameCreator

  VICTORY_CARDS = %w(estate duchy province)
  TREASURE_CARDS = %w(copper silver gold)
  SPOILS_CARDS = %w(bandit_camp marauder pillage)

  def initialize(players, proposer)
    @players = players
    @game = Game.new(proposer)
    @game.current_turn = Turn.new(@game)
    @included_cards = []
  end

  def create
    add_players
    add_game_cards
    add_player_decks
    draw_hands
    @game
  end

  private

  def add_players
    @players.shuffle.each do |player|
      player.victory_tokens = 0
      player.card_stacks = {}
      player.game = @game
      player.status = :pending
      @game.players << player
    end
  end

  def add_game_cards
    add_kingdom_cards
    add_victory_cards
    add_treasure_cards
    add_miscellaneous_cards
  end

  def add_player_decks
    @game.players.each do |player|
      player.card_stacks[:hand] = CardStack.new
      player.card_stacks[:discard] = CardStack.new
      player.card_stacks[:deck] = CardStack.new(starting_deck)
    end
  end

  def draw_hands
    @game.players.each do |player|
      CardDrawer.new(player).draw(5)
    end
  end

  def add_cards(card_names, type)
    @game.card_stacks[type] = []
    card_names.each do |card_name|
      card = CardCreator.create(card_name, @game)
      @included_cards << card
      cards = Array.new(card.starting_count) { CardCreator.create(card_name, @game) }
      @game.card_stacks[type] << CardStack.new(cards, card_name)
    end
  end

  def add_kingdom_cards
    add_cards(KingdomCardIndex.starting_cards, :kingdom)
  end

  def add_victory_cards
    victory_cards = VICTORY_CARDS.dup
    victory_cards << 'colony' if prosperity?
    add_cards(victory_cards, :victory)
  end

  def add_treasure_cards
    treasure_cards = TREASURE_CARDS.dup
    treasure_cards << 'potion' if potions?
    treasure_cards << 'platinum' if prosperity?
    treasure_cards << 'spoils' if spoils?
    add_cards(treasure_cards, :treasure)
  end

  def add_miscellaneous_cards
    miscellaneous_cards = ['curse']
    add_cards(miscellaneous_cards, :miscellaneous)
  end

  def prosperity?
    @prosperity ||= cards_from_set(:prosperity).count >= d10_roll
  end

  def dark_ages?
    cards_from_set(:dark_ages).count >= d10_roll
  end

  def ruins?
    @included_cards.any?{ |card| card.looter? }
  end

  def potions?
    @included_cards.any?{ |card| !card.base_cost[:potion].nil? }
  end

  def spoils?
    @included_cards.any?{ |card| SPOILS_CARDS.include?(card.name) }
  end

  def cards_from_set(set)
    @included_cards.select{ |card| card.set == set }
  end

  def starting_deck
    deck = Array.new(7) { CardCreator.create('copper', @game) }
    if dark_ages?
      deck << CardCreator.create('hovel', @game)
      deck << CardCreator.create('necropolis', @game)
      deck << CardCreator.create('overgrown_estate', @game)
    else
      deck += Array.new(3) { CardCreator.create('estate', @game) }
    end
    deck.shuffle!
  end

  def d10_roll
    rand(10) + 1
  end

end
