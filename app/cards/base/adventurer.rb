class Adventurer < KingdomCard

  include BaseSet

  def base_cost
    {
      coin: 6
    }
  end

  def type
    [:action]
  end

end
