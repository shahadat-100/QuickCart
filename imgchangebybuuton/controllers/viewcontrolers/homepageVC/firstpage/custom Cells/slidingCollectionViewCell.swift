//
//  slidingCollectionViewCell.swift
//  imgchangebybuuton
//
//  Created by shahadat on 30/9/24.
//

import UIKit

class slidingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var uiview: UIView!
    @IBOutlet weak var slidingimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
        
        self.uiview.layer.shadowColor = UIColor.black.cgColor
        self.uiview.layer.shadowOpacity = 0.5
        self.uiview.layer.shadowOffset = .zero
        self.uiview.layer.shadowRadius = 5.0
        
    }

}
