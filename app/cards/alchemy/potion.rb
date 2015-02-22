class Potion < Card

  include AlchemySet

  def starting_count
    16
  end

  def base_cost
    {
      coin: 4
    }
  end

  def type
    [:treasure]
  end

end
