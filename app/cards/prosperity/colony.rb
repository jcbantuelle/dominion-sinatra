class Colony < VictoryCard

  include ProsperitySet

  def base_cost
    {
      coin: 11
    }
  end

  def type
    [:victory]
  end

end
