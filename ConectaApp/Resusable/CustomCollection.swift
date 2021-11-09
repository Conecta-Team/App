//
//  CustomCollection.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 29/10/21.
//

import UIKit

class CustomCollection: UICollectionView {
    
    var intrinsicContentSizeDidChange: (() -> Void)?

    override var intrinsicContentSize: CGSize {
        return self.collectionViewLayout.collectionViewContentSize
      }

      override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
        self.intrinsicContentSizeDidChange?()
      }
}
