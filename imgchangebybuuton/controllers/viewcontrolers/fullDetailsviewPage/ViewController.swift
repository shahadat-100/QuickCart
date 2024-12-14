//
//  ViewController.swift
//  imgchangebybuuton
//
//  Created by shahadat on 28/9/24.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var firstUiview: UIView!
    @IBOutlet weak var secondUiview: UIView!
    @IBOutlet weak var thirdUiview: UIView!
    
    @IBOutlet weak var cartbutton: UIButton!
    @IBOutlet weak var redbutton: UIButton!
    @IBOutlet weak var bluebutton: UIButton!
    @IBOutlet weak var orginalbuuton: UIButton!
    
    
    @IBOutlet weak var pricee: UILabel!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var MainImg: UIImageView!
    
    @IBOutlet weak var shortdescription: UILabel!
    
    var imgName : [String]?
    var price:String?
    var name1 : String?
    var des : String?
    var currentimg : String?
    var pp : Double? 
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        setUPLayer()

        
        
        
    }
    
    @IBAction func forRedbuton(_ sender: UIButton) {
        
        MainImg.image = UIImage(named: imgName![0])
        currentimg = imgName![0]
        //self.redbutton.imageView?.tintColo = .red
    }
    
    @IBAction func forbluebutton(_ sender: UIButton) {
        
        MainImg.image = UIImage(named: imgName![1])
        currentimg = imgName![1]
    }
    
    @IBAction func forOrginalbutton(_ sender: UIButton) {
        
        MainImg.image = UIImage(named: imgName![2])
        currentimg = imgName![2]
    }
    
    @IBAction func addcartbutton(_ sender: UIButton) {
        
        
        guard let _email = FirebaseAuth.Auth.auth().currentUser?.email else
        {
            return
        }
        
        let date  = getCurrentDate()
        let item = orderitem(name:name1 ?? "N/A", price: pp ?? 0, imgName: currentimg ?? "N/A", date: date)
        
        
        FirebaseDatabaseManager.shared.updateBuyerDetails(with: _email , item: item, price: pp ?? 0) { success in
            
            if success
            {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let alert = sb.instantiateViewController(identifier: "popupViewController")
                
                alert.modalPresentationStyle = .overCurrentContext
                self.present(alert, animated: true,completion: nil)
            }
            else
            {
                print("something went wrong,item not added")
            }
        }
       
    }
    
    private func setUPLayer()
    {
        self.orginalbuuton.tintColor = .color1
        self.bluebutton.tintColor = .tintColor
        self.redbutton.tintColor = .red
        
        self.MainImg.image = UIImage(named: imgName![2])
        self.currentimg = imgName![2]
        
        self.pricee.text = price
        self.name.text = name1
        self.shortdescription.text = des
        
        
        secondUiview.layer.cornerRadius = 20.0
        secondUiview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        secondUiview.layer.shadowColor = UIColor.black.cgColor
        secondUiview.layer.shadowOpacity = 0.5
        secondUiview.layer.shadowOffset = .zero
        secondUiview.layer.shadowRadius = 5
        
        
        MainImg.layer.shadowColor = UIColor.black.cgColor
        MainImg.layer.shadowOpacity = 0.3
        MainImg.layer.shadowOffset = CGSize(width: 15,height: 15)
        MainImg.layer.shadowRadius = 4
       
        
        thirdUiview.layer.cornerRadius = 20
        thirdUiview.layer.shadowColor = UIColor.black.cgColor
        thirdUiview.layer.shadowOpacity = 0.5
        thirdUiview.layer.shadowOffset = .zero
        thirdUiview.layer.shadowRadius = 5
        
    }
    
    private func getCurrentDate() -> String {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" // Set the format to Year-Month-Day.
        return formatter.string(from: date) // Convert the date to the desired format.
    }
    
}


