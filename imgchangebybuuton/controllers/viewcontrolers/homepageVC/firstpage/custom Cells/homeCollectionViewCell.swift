//
//  homeCollectionViewCell.swift
//  imgchangebybuuton
//
//  Created by shahadat on 28/9/24.
//

import UIKit

class homeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var uiviewforcell: UIView!
    @IBOutlet weak var namelabel: UILabel!
   // @IBOutlet weak var button423: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
        
        self.uiviewforcell.layer.cornerRadius = 15.0
        self.uiviewforcell.layer.shadowColor = UIColor.black.cgColor
        self.uiviewforcell.layer.shadowOpacity = 0.5
        self.uiviewforcell.layer.shadowOffset = .zero
        self.uiviewforcell.layer.shadowRadius = 5.0
        
        self.layer.masksToBounds = false

    }

}
