//
//  Categories.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 06/10/21.
//

import Foundation

enum Category: Int, CaseIterable {
    case moba
    case mmorpg
    case simulation
    case fps
    case battleRoyale
    
    var name: String {
        switch self {
        case .fps:
            return "FPS"
        case .mmorpg:
            return "MMORPG"
        case .simulation:
            return "Simulação"
        case .moba:
            return "MOBA"
        case .battleRoyale:
            return "Battle Royale"
        }
    }
}
