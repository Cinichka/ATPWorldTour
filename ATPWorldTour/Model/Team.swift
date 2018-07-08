//
//  Team.swift
//  ATPWorldTour
//
//  Created by Вероника Садовская on 28.06.2018.
//  Copyright © 2018 Veronika Sadovskaya. All rights reserved.
//

import Foundation
struct Team: Codable {
    let playerID: String
    let partnerID: String?
    let playerFirstName, playerLastName, partnerFirstName: String
    let partnerLastName: String?
    let playerSeed: Int?
    let playerEntryType: String?
    let playerCountryCode: String
    let partnerCountryCode: String?
    let partnerSeed, partnerEntryType, gamePointsPlayerTeam: String?
    let playerOneName, playerTwoName, playerOneFlag: String
    let playerTwoFlag: String?
    let playerOneLink: String
    let playerTwoLink: String?
    let playerOneHeadshot: String
    let playerTwoHeadshot, teamSeed, teamEntryType: String?
    let teamStatus: TeamStatus?
    let scores: [String: String?]
    
    enum CodingKeys: String, CodingKey {
        case playerID = "PlayerId"
        case partnerID = "PartnerId"
        case playerFirstName = "PlayerFirstName"
        case playerLastName = "PlayerLastName"
        case partnerFirstName = "PartnerFirstName"
        case partnerLastName = "PartnerLastName"
        case playerSeed = "PlayerSeed"
        case playerEntryType = "PlayerEntryType"
        case playerCountryCode = "PlayerCountryCode"
        case partnerCountryCode = "PartnerCountryCode"
        case partnerSeed = "PartnerSeed"
        case partnerEntryType = "PartnerEntryType"
        case gamePointsPlayerTeam = "GamePointsPlayerTeam"
        case playerOneName = "PlayerOneName"
        case playerTwoName = "PlayerTwoName"
        case playerOneFlag = "PlayerOneFlag"
        case playerTwoFlag = "PlayerTwoFlag"
        case playerOneLink = "PlayerOneLink"
        case playerTwoLink = "PlayerTwoLink"
        case playerOneHeadshot = "PlayerOneHeadshot"
        case playerTwoHeadshot = "PlayerTwoHeadshot"
        case teamSeed = "TeamSeed"
        case teamEntryType = "TeamEntryType"
        case teamStatus = "TeamStatus"
        case scores = "Scores"
    }
}
enum TeamStatus: String, Codable {
    case empty = ""
    case nowServing = "now-serving"
    case wonGame = "won-game"
}
