class CardDrawer

  def initialize(player)
    @player = player
  end

  def draw(count)
    count.times do
      shuffle_discard_into_deck if @player.deck.count == 0 && @player.discard.count > 0
      draw_card if @player.deck.count > 0
    end
  end

  private

  def shuffle_discard_into_deck
    @player.deck = @player.discard
    @player.discard = []
    @player.deck.shuffle!
  end

  def draw_card
    @player.hand.push(@player.deck.shift)
  end

end
