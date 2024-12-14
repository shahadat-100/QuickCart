//
//  homeViewController.swift
//  imgchangebybuuton
//
//  Created by shahadat on 28/9/24.
//

import UIKit
import FirebaseAuth


class homeViewController: UIViewController {
    
    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var topfisrtviewfortable: UIView!
    @IBOutlet weak var topfisrtviewforcollection: UIView!
    
    @IBOutlet weak var buttomview: UIView!
    @IBOutlet weak var leftsideviewofbuttom: UIView!
    
    @IBOutlet weak var rightsideviewofbuttom2: UIView!
    @IBOutlet weak var rightsideviewofbuttom1: UIView!
    @IBOutlet weak var customview: UIView!
    

    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var slidingcollectionview: UICollectionView!
    @IBOutlet weak var buttomleftCV: UICollectionView!
    @IBOutlet weak var butoomrightCV: UICollectionView!
    
   
  
    var previousButton: UIButton?
    var previouscell : UICollectionViewCell?
    var timer : Timer?
    var count = 0
    var flag = true
    var categoryNm : String?
    var tablecellindex : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layerforview()
        
        self.collectionview.dataSource = self
        self.collectionview.delegate = self
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        self.collectionview.setCollectionViewLayout(layout, animated: true)
        self.collectionview.register(UINib(nibName: "homeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "homeCollectionViewCell")
        
        self.buttomleftCV.delegate = self
        self.buttomleftCV.dataSource =  self
        self.buttomleftCV.setCollectionViewLayout(UICollectionViewFlowLayout.init(), animated: true)
        self.buttomleftCV.register(UINib(nibName: "CollectionViewCellforleft", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCellforleft")
        
        
        //tableview
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.register(UINib(nibName: "homeTableViewCell", bundle: nil), forCellReuseIdentifier: "homeTableViewCell")
        
        
        
        //buttomright1
        self.butoomrightCV.delegate = self
        self.butoomrightCV.dataSource = self
        let lyout = UICollectionViewFlowLayout.init()
        lyout.scrollDirection = .horizontal
        self.butoomrightCV.setCollectionViewLayout(lyout, animated: true)
        self.butoomrightCV.register(UINib(nibName: "CollectionViewCellforbuttom1", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCellforbuttom1")
        
        //buttomright2
        self.slidingcollectionview.delegate = self
        self.slidingcollectionview.dataSource = self
        let layout1 = UICollectionViewFlowLayout.init()
        layout1.scrollDirection = .horizontal
        self.slidingcollectionview.setCollectionViewLayout(layout1, animated: true)
        self.slidingcollectionview.register(UINib(nibName: "slidingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "slidingCollectionViewCell")
       
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(slidetonext), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func slidetonext()
    {
        if flag {
            if count < slidingimage.count - 1 {
                count += 1
            } else {
                flag = false
                count -= 1
            }
        } else {
            
            if count > 0 {
                count -= 1
            } else {
                flag = true
                count += 1
            }
        }
        slidingcollectionview.scrollToItem(at: IndexPath(item: count, section: 0), at: .right, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        is_UserSingedIn()
        
    }
    
    private  func is_UserSingedIn()
    {
        if FirebaseAuth.Auth.auth().currentUser == nil
        {
            guard let vc =  self.storyboard?.instantiateViewController(identifier: "loginvc") as?
                    loginvc else
            {
                return
            }
            
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }
}
extension homeViewController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == slidingcollectionview
        {
            return slidingimage.count
        }
        if collectionView == buttomleftCV
        {
            return manualCategory.productDetails.count
        }
        if collectionView == butoomrightCV
        {
            return electronicsCategory.productDetails.count
        }
        return celllist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == slidingcollectionview
        {
            let cell0  = self.slidingcollectionview.dequeueReusableCell(withReuseIdentifier: "slidingCollectionViewCell", for: indexPath) as! slidingCollectionViewCell
            cell0.slidingimg.image = UIImage(named: slidingimage[indexPath.row])
            
            return cell0
        }
        if collectionView == butoomrightCV
        {
            let cell2 = butoomrightCV.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellforbuttom1", for: indexPath) as! CollectionViewCellforbuttom1
            cell2.uiimg.image = UIImage(named: electronicsCategory.productDetails[indexPath.row].imgNames[2])
            cell2.uilvl.text = electronicsCategory.productDetails[indexPath.row].name
            return cell2
        }
        if collectionView == buttomleftCV
        {
            let cell1 =  self.buttomleftCV.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellforleft", for: indexPath) as! CollectionViewCellforleft
            let picture = manualCategory.productDetails[indexPath.row].imgNames[2]
            cell1.uiimg.image = UIImage(named: picture)
            cell1.uilvl1.text = manualCategory.productDetails[indexPath.row].name
            cell1.uilvl2.text = "$" + String(manualCategory.productDetails[indexPath.row].orginalprice)
            
            return  cell1
        }
        let cell = self.collectionview.dequeueReusableCell(withReuseIdentifier: "homeCollectionViewCell", for: indexPath) as! homeCollectionViewCell
        let items =  celllist[indexPath.row]
        cell.namelabel.text = items.name1
       
        return cell
    }

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == slidingcollectionview
        {
            return CGSize(width: rightsideviewofbuttom2.frame.width, height: rightsideviewofbuttom2.frame.height)
        }
        if collectionView == butoomrightCV
        {
            return  CGSize(width: rightsideviewofbuttom1.frame.width - 20  , height: rightsideviewofbuttom1.frame.height - 20  )
        }
        if collectionView == buttomleftCV
        {
            return  CGSize(width: leftsideviewofbuttom.frame.width - 20 , height: leftsideviewofbuttom.frame.height - 10)
        }
        return CGSize(width: self.topfisrtviewforcollection.frame.width / 3.33, height: self.topfisrtviewforcollection.frame.height - 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == slidingcollectionview
        {
            return UIEdgeInsets.zero
        }
        if collectionView == butoomrightCV
        {
            return UIEdgeInsets(top:  0.0, left: 10.0, bottom: 10.0, right: 10.0)
            //return UIEdgeInsets.zero
        }
        if collectionView == buttomleftCV
        {
            return UIEdgeInsets(top:  10.0, left: 0.0, bottom: 0.0, right: 0.0)
        }
       return UIEdgeInsets(top: 0, left: 10.0, bottom: 0, right: 10.0)
   }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == butoomrightCV
        {
            let row1 = indexPath.row
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            vc.imgName = electronicsCategory.productDetails[row1].imgNames
            vc.name1 = electronicsCategory.productDetails[row1].name
            vc.price =  "$" + String(electronicsCategory.productDetails[row1].orginalprice)
            vc.des = electronicsCategory.productDetails[row1].shortDescription
            vc.pp = electronicsCategory.productDetails[row1].orginalprice
            if electronicsCategory.productDetails[row1].stocklabel == "In stock"
            {
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else
            {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let alert = sb.instantiateViewController(identifier: "outofstcokPopupViewController")
                
                alert.modalPresentationStyle = .overCurrentContext
                present(alert, animated: true,completion: nil)
            }
        }
        else if collectionView == buttomleftCV
        {
            let row1 = indexPath.row
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            vc.imgName = manualCategory.productDetails[row1].imgNames
            vc.name1 = manualCategory.productDetails[row1].name
            vc.price =  "$" + String(manualCategory.productDetails[row1].orginalprice)
            vc.des = manualCategory.productDetails[row1].shortDescription
            vc.pp = manualCategory.productDetails[row1].orginalprice
            if manualCategory.productDetails[row1].stocklabel == "In stock"
            {
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else
            {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let alert = sb.instantiateViewController(identifier: "outofstcokPopupViewController")
                
                alert.modalPresentationStyle = .overCurrentContext
                present(alert, animated: true,completion: nil)
            }
            
        }
       else if collectionView == slidingcollectionview
        {
           let vc = self.storyboard?.instantiateViewController(withIdentifier: "offersViewController") as! offersViewController
           vc.imgName = slidingimage[indexPath.row]
           self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            // if selected a cell before then it will work
            if let preCell = previouscell as? homeCollectionViewCell
            {
                preCell.uiviewforcell.backgroundColor = .bgcolor
                preCell.transform = .identity
            }
            
            let cell = collectionView.cellForItem(at: indexPath) as! homeCollectionViewCell
            cell.uiviewforcell.backgroundColor = .white
            cell.transform = CGAffineTransform(scaleX: 1.0, y: 1.1)
            previouscell = cell
            
            let indeeeeex = indexPath.row
            let selectitem = celllist[indeeeeex]
            tablename = selectitem.name2
            tableimg = selectitem.name3
            tablecellindex = indeeeeex
           // print(tablecellindex!)
            tableview.reloadData()
            
        }
    }
}

extension homeViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablename.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tabelcell = self.tableview.dequeueReusableCell(withIdentifier: "homeTableViewCell", for: indexPath) as!
        homeTableViewCell
        tabelcell.uilabel.text = tablename[indexPath.row]
        tabelcell.uiimg.image = UIImage(named: tableimg[indexPath.row])
        
        return tabelcell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let hight = self.tableview.frame.height
        return hight
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let vc = storyboard?.instantiateViewController(withIdentifier: "productshowViewController") as! productshowViewController
        let categoryCell = CategoryCell.catogorycelllist[tablecellindex ?? 0]
        vc.tempProductlist = categoryCell.productsitemslist[row]
            self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

extension homeViewController
{
    func layerforview()
    {
        // CALayer
        
        self.topview.layer.cornerRadius = 15
        self.topview.layer.shadowColor = UIColor.black.cgColor
        self.topview.layer.shadowOffset = .zero
        self.topview.layer.shadowRadius = 3
        self.topview.layer.shadowOpacity = 0.5
        
        self.buttomview.layer.shadowColor = UIColor.black.cgColor
        self.buttomview.layer.shadowOffset = .zero
        self.buttomview.layer.shadowRadius = 3
        self.buttomview.layer.shadowOpacity = 0.5


        self.customview.layer.cornerRadius = 15
        self.customview.layer.shadowColor = UIColor.black.cgColor
        self.customview.layer.shadowOffset = .zero
        self.customview.layer.shadowRadius = 3
        self.customview.layer.shadowOpacity = 0.5
        
        
        self.rightsideviewofbuttom2.layer.cornerRadius = 15
        self.rightsideviewofbuttom2.layer.shadowColor = UIColor.black.cgColor
        self.rightsideviewofbuttom2.layer.shadowOffset = .zero
        self.rightsideviewofbuttom2.layer.shadowRadius = 3
        self.rightsideviewofbuttom2.layer.shadowOpacity = 0.5
        
    }
}
