//
//  FontConfiguration.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 18/09/21.
//

import Foundation
import UIKit

extension UIFont {
    static func appRegularFont(with size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "ShareTechMono-Regular", size: size) else { return UIFont() }
        return font
    }
}
