class Duchy < VictoryCard

  include BaseSet

  def base_cost
    {
      coin: 5
    }
  end

  def type
    [:victory]
  end

end
