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
            return UIColor.darkBlue
        case .orange:
            return UIColor.darkOrange
        case .purple:
            return UIColor.darkPurple
        case .defaultColor:
            return UIColor.clear
        }
    }

    var lightColor: UIColor {
        switch self {
        case .blue:
            return UIColor.lightBlue
        case .orange:
            return UIColor.lightOrange
        case .purple:
            return UIColor.lightPurple
        case .defaultColor:
            return UIColor.clear
        }
    }

    var fontColor: UIColor {
        switch self {
        case .blue:
            return UIColor.textGreen
        case .orange:
            return UIColor.textBrown
        case .purple:
            return UIColor.textPurple
        case .defaultColor:
            return UIColor.clear
        }
    }
}
