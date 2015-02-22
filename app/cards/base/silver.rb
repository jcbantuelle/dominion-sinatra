class Silver < Card

  include BaseSet

  def starting_count
    40
  end

  def base_cost
    {
      coin: 3
    }
  end

  def type
    [:treasure]
  end

end
