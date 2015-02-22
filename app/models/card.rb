class Card

  attr_accessor :game

  def initialize(game)
    @game = game
  end

  def name
    self.class.to_s.gsub(/(.)([A-Z])/, '\1_\2').downcase
  end

  def looter?
    false
  end

  def type_class
    type.map(&:to_s).join(' ')
  end

  def to_json(opts = nil)
    {
      type_class: type_class,
      name: name
    }
  end

end
