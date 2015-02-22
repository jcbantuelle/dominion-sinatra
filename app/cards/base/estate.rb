class Estate < VictoryCard

  include BaseSet

  def base_cost
    {
      coin: 2
    }
  end

  def type
    [:victory]
  end

end
