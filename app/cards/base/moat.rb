class Moat < KingdomCard

  include BaseSet

  def base_cost
    {
      coin: 2
    }
  end

  def type
    [:action, :reaction]
  end

end
