//
//  ViewModelProtocols.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 17/09/21.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func willLoadData()
    func didLoadData()
}

protocol ViewModelType {
    var delegate: ViewModelDelegate? { get set }

    func initialization()
}
