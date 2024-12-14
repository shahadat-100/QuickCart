//
//  productshowViewController.swift
//  imgchangebybuuton
//
//  Created by shahadat on 1/10/24.
//

import UIKit

class productshowViewController: UIViewController {

    var tempProductlist : item02?
    
    @IBOutlet weak var hedarlvl: UILabel!
    @IBOutlet weak var buttomcollectionview: UICollectionView!
    
    @IBOutlet weak var buttomsecondview: UIView!
    @IBOutlet weak var butomthirdview: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        layerdesing()
        hedarlvl.text = tempProductlist?.categoryName
        
        
        self.buttomcollectionview.delegate = self
        self.buttomcollectionview.dataSource = self
        self.buttomcollectionview.setCollectionViewLayout(UICollectionViewFlowLayout.init(), animated: true)
        self.buttomcollectionview.register(UINib(nibName: "buttomView1CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "buttomView1CollectionViewCell")
        self.buttomcollectionview.register(UINib(nibName: "buttomView2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "buttomView2CollectionViewCell")
        
        
        
    }
    

}


extension productshowViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == buttomcollectionview
        {
            return (tempProductlist?.productDetails.count)!
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if indexPath.row % 2 == 0
            {
                let cell = buttomcollectionview.dequeueReusableCell(withReuseIdentifier: "buttomView1CollectionViewCell", for: indexPath) as! buttomView1CollectionViewCell
                let imgName = tempProductlist?.productDetails[indexPath.row].imgNames[2]
                cell.uiimg.image = UIImage(named: imgName!)
                let Name = tempProductlist?.productDetails[indexPath.row].name
                let originalprice = tempProductlist?.productDetails[indexPath.row].orginalprice
               // let discountprice = tempProductlist?.productDetails[indexPath.row].discountprice
                let stcoklable = tempProductlist?.productDetails[indexPath.row].stocklabel
              
                
                cell.name.text = Name
                cell.price.text = "$" + String(originalprice!)
                cell.stock.text = stcoklable
                if stcoklable == "In stock"
                {
                    cell.stock.textColor = .stockcolor
                }
                return cell
            }
            else
            {
                let cell = buttomcollectionview.dequeueReusableCell(withReuseIdentifier: "buttomView2CollectionViewCell", for: indexPath) as! buttomView2CollectionViewCell
                
                let imgName = tempProductlist?.productDetails[indexPath.row].imgNames[2]
                cell.uiimg.image = UIImage(named: imgName!)
                
                let Name = tempProductlist?.productDetails[indexPath.row].name
                let originalprice = tempProductlist?.productDetails[indexPath.row].orginalprice
               // let discountprice = tempProductlist?.productDetails[indexPath.row].discountprice
                let stcoklable = tempProductlist?.productDetails[indexPath.row].stocklabel
                
                cell.name.text = Name
                cell.price.text = "$" + String(originalprice!)
                cell.stock.text = stcoklable
                if stcoklable == "In stock"
                {
                    cell.stock.textColor = .stockcolor
                }
                return cell
            }
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return sizeOfitem()

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
     
            return  UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
            let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            vc.imgName = tempProductlist?.productDetails[indexPath.row].imgNames
            vc.name1 = tempProductlist?.productDetails[indexPath.row].name
            let Price = tempProductlist?.productDetails[indexPath.row].orginalprice
            vc.price = "$" + String(Price!)
            vc.pp = Price!
            vc.des = tempProductlist?.productDetails[indexPath.row].shortDescription
            if tempProductlist?.productDetails[indexPath.row].stocklabel == "In stock"
            {
                navigationController?.pushViewController(vc, animated: true)
            }
            else
            {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let alert = sb.instantiateViewController(identifier: "outofstcokPopupViewController")
                
                alert.modalPresentationStyle = .overCurrentContext
                present(alert, animated: true,completion: nil)
            }
    }
}


extension productshowViewController{
  
    func sizeOfitem () -> CGSize
    {
        let screenWidth = buttomcollectionview.frame.width
        let spacingbetweenItem = 10.0
        let spacingAtEdgges = 10.0
        let numberOFitemInEachRow = 2
        
        let totalSpacing = ( spacingAtEdgges * 2) + (Double((numberOFitemInEachRow - 1)) * spacingbetweenItem)
        let itemWidth = (screenWidth - totalSpacing ) / 2
        let itemheight = buttomcollectionview.frame.height / 1.7
        return CGSize(width: itemWidth, height: itemheight)
    }
    
    func layerdesing()
    {
        butomthirdview.layer.cornerRadius = 15
        // butomthirdview.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        butomthirdview.layer.shadowColor = UIColor.black.cgColor
        butomthirdview.layer.shadowOpacity = 0.5
        butomthirdview.layer.shadowOffset = .zero
        butomthirdview.layer.shadowRadius = 5.0
    }
}



