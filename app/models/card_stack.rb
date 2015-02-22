class CardStack < Array

  attr_accessor :name

  def initialize(cards = [], name = nil)
    super cards
    @name = name
  end

  def to_json(opts = nil)
    {
      name: @name.titleize,
      type_class: self.first.type_class
    }.to_json
  end

end
