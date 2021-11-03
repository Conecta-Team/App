//
//  CustomCollection.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 29/10/21.
//

import UIKit

class CustomCollection: UICollectionView {

    override var intrinsicContentSize: CGSize {
        self.collectionViewLayout.collectionViewContentSize
      }

      override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
      }

}
