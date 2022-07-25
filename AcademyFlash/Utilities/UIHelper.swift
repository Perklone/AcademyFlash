//
//  UIHelper.swift
//  AcademyFlash
//
//  Created by Rizky Maulana on 25/07/22.
//

import UIKit

enum UIHelper {
    static func createFlowLayout(in view:UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 21
        let itemSpacing:CGFloat = 21
        let availableWidth = width - (padding*2)
        
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: availableWidth, height: availableWidth/2)
        flowLayout.minimumLineSpacing = 21
        flowLayout.prepare()
        return flowLayout
    }
}
