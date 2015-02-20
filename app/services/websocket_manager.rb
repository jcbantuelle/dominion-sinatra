class WebsocketManager
  @@sockets = {}

  class << self

    def add_socket(websocket, player)
      @@sockets[player.name] = websocket
    end

    def remove_socket(player)
      @@sockets.delete(player.name)
    end

    def find(names = nil)
      if names.is_a? Array
        @@sockets.select{|name, socket| names.include?(name)}
      elsif names
        @@sockets[names]
      else
        @@sockets
      end
    end

  end
end
