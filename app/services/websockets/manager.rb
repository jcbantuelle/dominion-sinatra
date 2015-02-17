class Websockets::Manager
  @@sockets = {}

  class << self

    def sockets
      @@sockets
    end

    def add_socket(websocket, player)
      @@sockets[player.name] = websocket
    end

    def remove_socket(player)
      @@sockets.delete(player.name)
    end

  end
end
