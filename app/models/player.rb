class Player
  attr_accessor :name, :last_active, :status, :game_status, :victory_tokens, :card_stacks, :game

  def initialize(name)
    @name = name
    @last_active = Time.now
    @status = :lobby
  end

  def active!
    @last_active = Time.now
  end

  def inactive?(status = nil)
    (Time.now - @last_active > 300) && (status.nil? || @status == status)
  end

  def in_game?
    @status == :game
  end

  def in_lobby?
    @status == :lobby
  end

  def accepted?
    @game_status == :accepted
  end

  def pending?
    @game_status == :pending
  end

  def deck
    @card_stacks[:deck]
  end

  def discard
    @card_stacks[:discard]
  end

  def hand
    @card_stacks[:hand]
  end

  def to_json(opts = nil)
    {
      name: @name
    }.to_json
  end
end
