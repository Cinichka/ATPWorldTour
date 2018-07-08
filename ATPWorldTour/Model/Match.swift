//
//  Match.swift
//  ATPWorldTour
//
//  Created by Вероника Садовская on 28.06.2018.
//  Copyright © 2018 Veronika Sadovskaya. All rights reserved.
//

import Foundation
struct Match: Decodable {
    let id, eventID, roundTitle, matchType: String
    let statsLink, headToHeadLink, secondScreenLink: String
    let railPosition: Int
    let liveListingPosition: Int?
    let status: String
    let numberOfSets: Int
    let matchTime, matchInfo: String
    let teamOne, teamTwo: Team
    let hasHawkeyeData: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case eventID = "EventId"
        case roundTitle = "RoundTitle"
        case matchType = "MatchType"
        case statsLink = "StatsLink"
        case headToHeadLink = "HeadToHeadLink"
        case secondScreenLink = "SecondScreenLink"
        case railPosition = "RailPosition"
        case liveListingPosition = "LiveListingPosition"
        case status = "Status"
        case numberOfSets = "NumberOfSets"
        case matchTime = "MatchTime"
        case matchInfo = "MatchInfo"
        case teamOne = "TeamOne"
        case teamTwo = "TeamTwo"
        case hasHawkeyeData = "HasHawkeyeData"
    }
}
