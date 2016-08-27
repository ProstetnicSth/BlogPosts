//: Playground - noun: a place where people can play

import UIKit

class Player {
    var name: String
    var grandSlamWins: Int
    
    init(name: String, grandSlamWins: Int) {
        self.name = name
        self.grandSlamWins = grandSlamWins
    }
}

extension Player {
    class func sortedPlayersByGrandSlamWins(_ players: [Player]) -> [Player] {
        return players.sorted { (left, right) -> Bool in
            return left.grandSlamWins > right.grandSlamWins
        }
    }
}

var topPlayers = [
    Player(name: "Djokovic", grandSlamWins: 12),
    Player(name: "Federer", grandSlamWins: 17),
    Player(name: "Murray", grandSlamWins: 3),
    Player(name: "Nadal", grandSlamWins: 14)
]

topPlayers = Player.sortedPlayersByGrandSlamWins(topPlayers)

extension Array where Element: Player {
    mutating func sortByGrandSlamWins() {
        self.sort { (left, right) -> Bool in
            return left.grandSlamWins > right.grandSlamWins
        }
    }
    
    func queryString() -> String {
        let mapped = self.flatMap { user in
            return [user.name, String(user.grandSlamWins)]
        }
        return mapped.joined(separator: ";")
    }
}

topPlayers.queryString()
topPlayers.sortByGrandSlamWins()
