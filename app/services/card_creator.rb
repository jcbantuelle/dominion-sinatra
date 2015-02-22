class CardCreator

  class << self

    def create(card_name, game)
      Object.const_get(card_name.constantize).new(game)
    end

  end

end
