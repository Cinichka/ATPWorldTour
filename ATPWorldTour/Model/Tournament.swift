//
//  Tournament.swift
//  ATPWorldTour
//
//  Created by Veronika Sadovskaya on 28.06.2018.
//  Copyright © 2018 Veronika Sadovskaya. All rights reserved.
//

import Foundation
struct Tournament: Decodable {
    let name, eventID, tournamentLink, officialWebsite: String
    let location: String
    let tourType: String?
    let tournamentBadgeImage, liveScoresLinkText, liveScoresLink, drawLinkText: String
    let drawLink, scheduleLinkText, scheduleLink, h2HLinkText: String
    let statsLinkText, playNotStarted, tournamentPosition: String
    let matches: [Match]
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case eventID = "EventId"
        case tournamentLink = "TournamentLink"
        case officialWebsite = "OfficialWebsite"
        case location = "Location"
        case tourType = "TourType"
        case tournamentBadgeImage = "TournamentBadgeImage"
        case liveScoresLinkText = "LiveScoresLinkText"
        case liveScoresLink = "LiveScoresLink"
        case drawLinkText = "DrawLinkText"
        case drawLink = "DrawLink"
        case scheduleLinkText = "ScheduleLinkText"
        case scheduleLink = "ScheduleLink"
        case h2HLinkText = "H2HLinkText"
        case statsLinkText = "StatsLinkText"
        case playNotStarted = "PlayNotStarted"
        case tournamentPosition = "TournamentPosition"
        case matches = "Matches"
    }
}
