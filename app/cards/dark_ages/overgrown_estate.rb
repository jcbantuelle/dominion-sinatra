class OvergrownEstate < Card

  include DarkAgesSet

  def base_cost
    {
      coin: 1
    }
  end

  def type
    [:victory, :shelter]
  end

end
