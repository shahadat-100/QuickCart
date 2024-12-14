//
//  TableViewCell.swift
//  imgchangebybuuton
//
//  Created by shahadat on 7/10/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var uiview: UIView!
    @IBOutlet weak var uiimg: UIImageView!
    @IBOutlet weak var uiname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
   
        self.uiview.layer.cornerRadius = 15.0
        self.uiview.layer.shadowColor = UIColor.black.cgColor
        self.uiview.layer.shadowOpacity = 0.5
        self.uiview.layer.shadowOffset = .zero
        self.uiview.layer.shadowRadius = 4.0
        
        self.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
