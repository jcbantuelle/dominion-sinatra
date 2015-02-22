class Platinum < Card

  include ProsperitySet

  def starting_count
    12
  end

  def base_cost
    {
      coin: 9
    }
  end

  def type
    [:treasure]
  end

end
