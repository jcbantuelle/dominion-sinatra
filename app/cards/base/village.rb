class Village < KingdomCard

  include BaseSet

  def base_cost
    {
      coin: 3
    }
  end

  def type
    [:action]
  end

end
