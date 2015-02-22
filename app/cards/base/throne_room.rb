class ThroneRoom < KingdomCard

  include BaseSet

  def base_cost
    {
      coin: 4
    }
  end

  def type
    [:action]
  end

end
