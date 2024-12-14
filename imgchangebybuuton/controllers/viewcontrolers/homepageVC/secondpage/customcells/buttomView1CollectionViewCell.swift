//
//  buttomView1CollectionViewCell.swift
//  imgchangebybuuton
//
//  Created by shahadat on 1/10/24.
//

import UIKit

class buttomView1CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var uiview: UIView!
    @IBOutlet weak var uiview1: UIView!
    @IBOutlet weak var uiimg: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var stock: UILabel!
    
  
     
    
    override func awakeFromNib() {
        super.awakeFromNib()

    
        
        self.uiview.layer.cornerRadius = 10.0
        self.uiview.layer.shadowColor = UIColor.black.cgColor
        self.uiview.layer.shadowOpacity = 0.5
        self.uiview.layer.shadowOffset = .zero
        self.uiview.layer.shadowRadius = 5.0
        self.layer.masksToBounds = false
        
        self.uiview1.layer.cornerRadius = 30
        self.uiview1.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        //for lower corner curve
        self.uiview1.layer.shadowColor = UIColor.black.cgColor
        self.uiview1.layer.shadowOpacity = 0.5
        self.uiview1.layer.shadowOffset = .zero
        self.uiview1.layer.shadowRadius = 5.0
    }

}
