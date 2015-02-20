class PlayerManager
  @@players = {}

  class << self

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

    def find(names = nil)
      if names.is_a? Array
        @@players.values.select{|player| names.include?(player.name)}
      elsif names
        @@players[names]
      else
        @@players.values
      end
    end
  end
end
