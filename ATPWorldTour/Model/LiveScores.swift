//
//  LiveScores.swift
//  ATPWorldTour
//
//  Created by Veronika Sadovskaya on 28.06.2018.
//  Copyright © 2018 Veronika Sadovskaya. All rights reserved.
//

import Foundation
struct LiveScores: Decodable {
    let tournaments: [Tournament]
    let expiredTournaments, matches, expiredMatches, matchUpdates: [String]
    
    enum CodingKeys: String, CodingKey {
        case tournaments = "Tournaments"
        case expiredTournaments = "ExpiredTournaments"
        case matches = "Matches"
        case expiredMatches = "ExpiredMatches"
        case matchUpdates = "MatchUpdates"
    }
}
