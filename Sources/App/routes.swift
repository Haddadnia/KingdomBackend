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

    router.get("hello", "justin") { req -> String in
      return "Hello Justin!"
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
    
    
    // Justins stuff (Ray W)
    router.post(PlayerInfo.self, at: "addPlayer") { req, data -> String in
        playerNames.append(data.name)
        var allNames = ""
        for name in playerNames {
            allNames = allNames + name + " "
        }
        return "Hello \(data.name)!   All players: \(allNames)"
    }
}

var playerNames = [String]()

struct PlayerInfo: Content {
 let name: String
}
