//
//  Games.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 06/10/21.
//

import Foundation

enum Games: Int, CaseIterable {
    case leagueOfLegends
    case valorant
    case wow
    case sims
    case freeFire

    var category: Category {
        switch self {
        case .leagueOfLegends:
            return .moba
        case .valorant:
            return .fps
        case .wow:
            return .mmorpg
        case .sims:
            return .simulation
        case .freeFire:
            return .battleRoyale
        }
    }

    var name: String {
        switch self {
        case .leagueOfLegends:
            return "League of Legends"
        case .valorant:
            return "Valorant"
        case .wow:
            return "World of Warcraft"
        case .sims:
            return "The Sims"
        case .freeFire:
            return "Free Fire"
        }
    }
}
