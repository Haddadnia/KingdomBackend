import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    

    router.get("hello", String.parameter) { req -> String in
        let name = try req.parameters.next(String.self) //{
            return "Hello " + name
//        } else {
//            return "Hello nameless!"
//        }
    }
    
    router.get { req in
        return "It works Sarah!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    

    router.post(PlayerCreationInfo.self, at: "addPlayer") { req, data -> Game in
        let newPlayer = Player(playerCreationInfo: data)
        players.append(newPlayer)
        let game = handleNewPlayer(player: newPlayer, toGame: data.gameCode)
        games[game.code] = game
        return game
//        let response = PlayerCreationInfoResponse(allPlayers: players)
//        return response
    }
    
    func handleNewPlayer(player: Player, toGame gameCode: String?) -> Game {
        player.playerID = randomString(length: 20)
        if let gameCode = gameCode,
            var game = games[gameCode] {
            game.addPlayer(player)
            return game
        } else {
            return Game.gameFromPlayer(player)
        }
    }
}

var players = [Player]()
var games = [String: Game]()

func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}

