//
//  homeTableViewCell.swift
//  imgchangebybuuton
//
//  Created by shahadat on 28/9/24.
//

import UIKit

class homeTableViewCell: UITableViewCell {

    @IBOutlet weak var uiview: UIView!
    @IBOutlet weak var uilabel: UILabel!
    
    @IBOutlet weak var uiview1: UIView!
    @IBOutlet weak var uiimg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
   
        self.uiview.layer.cornerRadius = 15.0
        self.uiview.layer.shadowColor = UIColor.black.cgColor
        self.uiview.layer.shadowOpacity = 0.5
        self.uiview.layer.shadowOffset = .zero
        self.uiview.layer.shadowRadius = 5.0
        
        self.uiview1.layer.cornerRadius = 15.0
        self.uiview1.layer.shadowColor = UIColor.bgcolor.cgColor
        self.uiview1.layer.shadowOpacity = 0.3
        self.uiview1.layer.shadowOffset = .zero
        self.uiview1.layer.shadowRadius = 3.0


        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

