//
//  CollectionViewCellforleft.swift
//  imgchangebybuuton
//
//  Created by shahadat on 30/9/24.
//

import UIKit

class CollectionViewCellforleft: UICollectionViewCell {

    @IBOutlet weak var uiview: UIView!
    @IBOutlet weak var uiimg: UIImageView!
    @IBOutlet weak var uilvl1: UILabel!
    @IBOutlet weak var uilvl2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.uiview.layer.cornerRadius = 15.0
        self.uiview.layer.shadowColor = UIColor.bg2.cgColor
        self.uiview.layer.shadowOpacity = 0.5
        self.uiview.layer.shadowOffset = .zero
        self.uiview.layer.shadowRadius = 5.0
        
        self.layer.masksToBounds = false
    }

}
