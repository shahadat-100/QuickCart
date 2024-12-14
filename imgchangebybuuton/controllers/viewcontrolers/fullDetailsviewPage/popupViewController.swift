//
//  popupViewController.swift
//  imgchangebybuuton
//
//  Created by shahadat on 7/10/24.
//

import UIKit

class popupViewController: UIViewController {

    @IBOutlet weak var uiview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

     
        self.uiview.layer.shadowColor = UIColor.black.cgColor
        self.uiview.layer.shadowOpacity = 1.0
        self.uiview.layer.shadowOffset = .zero
        self.uiview.layer.shadowRadius = 7.0
        
    }
    
    @IBAction func dismis(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
