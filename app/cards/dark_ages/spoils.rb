class Spoils < Card

  include DarkAgesSet

  def starting_count
    15
  end

  def base_cost
    {
      coin: 0
    }
  end

end
