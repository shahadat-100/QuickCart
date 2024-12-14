//
//  orderViewController.swift
//  imgchangebybuuton
//
//  Created by shahadat on 6/10/24.
//

import UIKit
import FirebaseAuth

class orderViewController: UIViewController {

    var orderItemsArr : [orderitem] = []
    var itemTotalPrice : Double = 0
    
    @IBOutlet weak var uiview1: UIView!
    @IBOutlet weak var uiview2: UIView!
    
    @IBOutlet weak var uitable: UITableView!
    
    @IBOutlet weak var noorderlvl: UILabel!
    @IBOutlet weak var noorderimg: UIImageView!
    @IBOutlet weak var iTemprice: UILabel!
    
    @IBOutlet weak var totalprice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()

    }
    
    private func updateUI() {
        
        
        guard let email = FirebaseAuth.Auth.auth().currentUser?.email else
        {
            return
        }
        FirebaseDatabaseManager.shared.FetchBuyerDetails(with: email) { data, price in
            
            guard !data.isEmpty,price != 0 else
            {
                print("data missing")
                if self.orderItemsArr.count == 0 {
                    // Show empty cart message
                    print("empty")
                    self.noorderimg.isHidden = false
                    self.noorderlvl.isHidden = false
                    self.noorderimg.image = UIImage(named: "empty-cart")
                    self.noorderlvl.text = "No Items in Order List"
                }
                
                return
            }
            
            self.orderItemsArr = data
            self.itemTotalPrice = price
            
            if self.orderItemsArr.count == 0 {
                // Show empty cart message
                self.noorderimg.isHidden = false
                self.noorderlvl.isHidden = false
                self.noorderimg.image = UIImage(named: "empty-cart")
                self.noorderlvl.text = "No Items in Order List"
            } else {
                self.noorderimg.isHidden = true
                self.noorderlvl.isHidden = true
            }
            
            self.iTemprice.text = "$" + String(self.itemTotalPrice )
            self.totalprice.text = "$" + String(self.itemTotalPrice )
            self.uitable.reloadData()
            
        }
    }
   
    private func setUpView()
    {
       
        
        
        uitable.dataSource = self
        uitable.delegate = self
        uitable.register(UINib(nibName: "orderTableViewCell", bundle: nil), forCellReuseIdentifier: "orderTableViewCell")
        
        self.uiview1.layer.cornerRadius = 15.0
        self.uiview1.layer.shadowColor = UIColor.black.cgColor
        self.uiview1.layer.shadowOpacity = 0.5
        self.uiview1.layer.shadowOffset = .zero
        self.uiview1.layer.shadowRadius = 4.0
        
        self.uiview2.layer.cornerRadius = 15.0
        self.uiview2.layer.shadowColor = UIColor.black.cgColor
        self.uiview2.layer.shadowOpacity = 0.5
        self.uiview2.layer.shadowOffset = .zero
        self.uiview2.layer.shadowRadius = 4.0
    }
    
}

extension orderViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderItemsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderTableViewCell") as! orderTableViewCell
        let item = orderItemsArr[indexPath.row]
        cell.name.text = item.name
        cell.price.text = String(item.price)
        cell.uiimg.image = UIImage(named: item.imgName)
        cell.date.text = "Ordered on \(item.date)"
        
        
        cell.cancelbnt.tag = indexPath.row
        cell.cancelbnt.addTarget(self, action: #selector (cancelbtntapped), for: .touchUpInside)
        return cell
    }
    @objc func cancelbtntapped(sender:UIButton)
    {
        let index = sender.tag

        guard let email = FirebaseAuth.Auth.auth().currentUser?.email else
        {
            return
        }
        FirebaseDatabaseManager.shared.deleteItem(for: email, atIndex: index) { success in
            
            if success
            {
                self.orderItemsArr.remove(at: index)
                self.uitable.reloadData()
                self.viewWillAppear(true)
            }
            else
            {
                print("something went wrong.. item not deleted from database")
            }
        }
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = tableView.frame.height
        return height / 2
    }
    
}
