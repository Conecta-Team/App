//
//  ColorsManage.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 18/09/21.
//

import UIKit

enum ColorManager {
    case purple
    case blue
    case orange
    case defaultColor

    var darkColor: UIColor {
        switch self {
        case .blue:
            return UIColor.blueProfile
        case .orange:
            return UIColor.orangeProfile
        case .purple:
            return UIColor.purpleProfile
        case .defaultColor:
            return UIColor.clear
        }
    }

    var lightColor: UIColor {
        switch self {
        case .blue:
            return UIColor.blueBackground
        case .orange:
            return UIColor.orangeBackground
        case .purple:
            return UIColor.purpleBackground
        case .defaultColor:
            return UIColor.clear
        }
    }
}
