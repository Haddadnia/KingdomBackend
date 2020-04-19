//
//  PlayerCreationInfo.swift
//  App
//
//  Created by Justin Haddadnia on 4/19/20.
//

import Foundation
import Vapor

struct PlayerCreationInfo: Content {
    let name: String
    let word: String
    var gameCode: String?
}

struct PlayerCreationInfoResponse: Content {
    let allPlayers: [Player]
}

class Player: Codable {
    init(playerCreationInfo: PlayerCreationInfo) {
        self.name = playerCreationInfo.name
        self.word = playerCreationInfo.word
    }
    
    init(name: String, word: String) {
        self.name = name
        self.word = word
    }
    
    var name: String = ""
    let teammates: [Player] = []
    let leader: Player? = nil
    var word: String
    var playerID: String?
}
