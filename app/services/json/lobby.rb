class Json::Lobby

  class << self

    def chat(player, message)
      {
        action: 'chat',
        message: "<strong>#{player.name}:</strong> #{message}"
      }.to_json
    end

    def refresh(players)
      {
        action: 'refresh',
        players: players.values
      }.to_json
    end
  end

end
