//
//  Game.swift
//  App
//
//  Created by Justin Haddadnia on 4/19/20.
//

import Foundation

enum GameState {
    case lobby
    case playing
    case postGame
}

struct Game {

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
}

struct Team {
    var teamName: String
    let leader: Player
    var players: [Player]
}
