class Copper < Card

  include BaseSet

  def starting_count
    60
  end

  def base_cost
    {
      coin: 0
    }
  end

  def type
    [:treasure]
  end

end
