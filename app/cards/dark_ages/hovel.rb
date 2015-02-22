class Hovel < Card

  include DarkAgesSet

  def base_cost
    {
      coin: 1
    }
  end

  def type
    [:reaction, :shelter]
  end

end
