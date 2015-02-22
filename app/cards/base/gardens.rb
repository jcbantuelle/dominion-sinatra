class Gardens < VictoryCard

  include BaseSet

  def base_cost
    {
      coin: 4
    }
  end

  def type
    [:victory]
  end

end
