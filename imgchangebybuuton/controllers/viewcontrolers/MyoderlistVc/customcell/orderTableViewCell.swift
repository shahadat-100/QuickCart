//
//  orderTableViewCell.swift
//  imgchangebybuuton
//
//  Created by shahadat on 6/10/24.
//

import UIKit

class orderTableViewCell: UITableViewCell {

    @IBOutlet weak var uiimg: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var uiview: UIView!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var cancelbnt: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.uiview.layer.cornerRadius = 15.0
        self.uiview.layer.shadowColor = UIColor.black.cgColor
        self.uiview.layer.shadowOpacity = 0.5
        self.uiview.layer.shadowOffset = .zero
        self.uiview.layer.shadowRadius = 4.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func cancelbutton(_ sender: UIButton) {
        
    }
    
}
