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
    
    

    router.post(PlayerCreationInfo.self, at: "addPlayer") { req, data -> PlayerCreationInfoResponse in
        let newPlayer = Player(playerCreationInfo: data)
        players.append(newPlayer)
        
        let response = PlayerCreationInfoResponse(allPlayers: players)
        return response
    }
}

var players = [Player]()


