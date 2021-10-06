//
//  Goals.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 06/10/21.
//

import Foundation

enum Goal: Int, CaseIterable {
    case forFun
    case competitive

    var name: String {
        switch self {
        case .forFun:
            return "Diversão"
        case .competitive:
            return "Competitivo"
        }
    }
}
