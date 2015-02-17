class Player
  attr_accessor :name, :last_active, :status

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

  def to_json(opts = nil)
    {
      name: @name
    }.to_json
  end
end
