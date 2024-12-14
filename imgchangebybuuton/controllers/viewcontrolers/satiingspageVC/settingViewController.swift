//
//  settingViewController.swift
//  imgchangebybuuton
//
//  Created by shahadat on 6/10/24.
//

import UIKit
import FirebaseAuth
class settingViewController: UIViewController {

    @IBOutlet weak var Realname: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var uiview: UIView!
    @IBOutlet weak var uiview2: UIView!
    
    
    
    @IBOutlet weak var uitable1: UITableView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUserProfile()

        uitable1.dataSource = self
        uitable1.delegate = self
        uitable1.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        self.uiview.layer.cornerRadius = 15.0
        self.uiview.layer.shadowColor = UIColor.black.cgColor
        self.uiview.layer.shadowOpacity = 0.5
        self.uiview.layer.shadowOffset = .zero
        self.uiview.layer.shadowRadius = 4.0
        
        self.uiview2.layer.cornerRadius = 15.0
        self.uiview2.layer.shadowColor = UIColor.black.cgColor
        self.uiview2.layer.shadowOpacity = 0.5
        self.uiview2.layer.shadowOffset = .zero
        self.uiview2.layer.shadowRadius = 4.0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUserProfile()
    }
    
    

    @IBAction func logout(_ sender: Any) {
        
        let alert = UIAlertController(title: "Logout", message: "Are you sure You want to logout?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        
        
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (logout) in
            
            do
            {
                try   FirebaseAuth.Auth.auth().signOut()
                print("sccesfully looged out from firebase")
                
                // navigate to login page
                guard let vc = self.storyboard?.instantiateViewController(identifier: "loginvc") as? loginvc else {return}
                
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: false)
                
            }catch let error
            {
                print(error)
            }
        
            
        }))
        self.present(alert, animated: true, completion: nil)
        

    }
    
    
    private func setUserProfile()
    {
        guard let _email = FirebaseAuth.Auth.auth().currentUser?.email else
        {
            return
        }
        
        FirebaseDatabaseManager.shared.fetchUserName(with: _email) {[weak self] userName in
            
            guard let userName = userName else
            {
                print("User name not found")
                return
            }
            
            self?.Realname.text = userName
            self?.email.text = _email
        }
    }
    
}

extension settingViewController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arr1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = uitable1.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            cell.uiimg.image = UIImage(named: arr1[indexPath.row].imageName)
            cell.uiname.text = arr1[indexPath.row].name
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let height = tableView.frame.height / 5
            return height
    }
    
    
}

/* let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginvc") as! loginvc
let currentwindowScene = UIApplication.shared.connectedScenes.first as! UIWindowScene
let sceneDelegate = currentwindowScene.delegate as! SceneDelegate
sceneDelegate.window?.rootViewController = vc*/
