//
//  Game.swift
//  App
//
//  Created by Justin Haddadnia on 4/19/20.
//

import Foundation
import Vapor

enum GameState: String, Codable {
    case lobby = "lobby"
    case playing = "playing"
    case postGame = "postGame"
}

struct Game: Content {

    //setup
    var host: Player
    var gameState: GameState
    var code: String
    
    //game setup
    var players: [Player]
    var teams: [Team]
    var words: [String]
    
    //gameplay
    var guessingPlayer: Player
    
    mutating func addPlayer(_ player: Player) {
        players.append(player)
        words.append(player.word)
    }
    
    static func gameFromPlayer(_ player: Player) -> Game {
        let game = Game(host: player,
                        gameState: .lobby,
                        code: randomString(length: 5),
                        players: [player],
                        teams: [Team](),
                        words: [player.word],
                        guessingPlayer: player)
        return game
    }
}

struct Team: Codable {
    var teamName: String
    let leader: Player
    var players: [Player]
}
