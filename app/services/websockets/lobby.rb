class Websockets::Lobby

  class << self

    def lobby_chat(data, player)
      Websockets::Manager.sockets.each do |name, socket|
        socket.send Json::Lobby.chat(player, data['message'])
      end
    end

    def refresh
      players = PlayerManager.lobby_players
      Websockets::Manager.sockets.each do |name, socket|
        players_excluding_self = PlayerManager.players_excluding_self(players, name)
        socket.send Json::Lobby.refresh(players_excluding_self) unless players_excluding_self.empty?
      end
    end

  end

end
