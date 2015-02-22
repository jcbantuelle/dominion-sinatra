class Necropolis < Card

  include DarkAgesSet

  def base_cost
    {
      coin: 1
    }
  end

  def type
    [:action, :shelter]
  end

end
