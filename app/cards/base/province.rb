class Province < VictoryCard

  include BaseSet

  def base_cost
    {
      coin: 8
    }
  end

  def type
    [:victory]
  end

end
