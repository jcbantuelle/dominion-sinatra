class Gold < Card

  include BaseSet

  def starting_count
    30
  end

  def base_cost
    {
      coin: 6
    }
  end

  def type
    [:treasure]
  end

end
