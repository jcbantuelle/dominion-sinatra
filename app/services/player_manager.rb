class PlayerManager
  @@players = {}

  class << self

    def players
      @@players
    end

    def players_excluding_self(players, name)
      players.reject{ |player_name, player| player_name == name }
    end

    def flush_inactive_players
      @@players.reject!{ |name, player| player.inactive?(:lobby) }
    end

    def add_player(name)
      new_player = Player.new(name)
      @@players[name] = new_player
      new_player
    end

    def remove_player(player)
      @@players.delete(player.name)
    end

    def player_exists?(name)
      @@players.key?(name)
    end

    def lobby_players
      @@players.select{ |name, player| player.status == :lobby }
    end

  end
end
