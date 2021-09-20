//
//  MatchViewModel.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 17/09/21.
//

import UIKit

class MatchViewModel: ViewModelType {

    weak var delegate: ViewModelDelegate?
    let dados: [ColorManager] = [.orange, .blue,.orange, .blue, .purple, .purple]

    func initialization() {
        print("init")
    }

}
