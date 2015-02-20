class LobbyPlayers

  class << self

    def all
      players
    end

    def all_except(name)
      players.reject{|player| player.name == name}
    end

    def names
      players.map(&:name)
    end

    private

    def players
      PlayerManager.find.select(&:in_lobby?)
    end
  end
end
