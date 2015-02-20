class Websockets::Lobby

  class << self

    def lobby_chat(data, player)
      WebsocketManager.find(LobbyPlayers.names).each do |name, socket|
        socket.send Json::Lobby.chat(player, data['message'])
      end
    end

    def refresh
      WebsocketManager.find(LobbyPlayers.names).each do |name, socket|
        socket.send Json::Lobby.refresh(LobbyPlayers.all_except(name))
      end
    end

    def propose_game(data, player)
      GameProposer.new(data, player).propose
    end

  end

end
