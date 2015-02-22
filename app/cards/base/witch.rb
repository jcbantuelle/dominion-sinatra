class Witch < KingdomCard

  include BaseSet

  def base_cost
    {
      coin: 5
    }
  end

  def type
    [:action, :attack]
  end

end
