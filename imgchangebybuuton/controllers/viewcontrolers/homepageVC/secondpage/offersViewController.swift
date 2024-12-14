//
//  offersViewController.swift
//  imgchangebybuuton
//
//  Created by shahadat on 2/10/24.
//

import UIKit

class offersViewController: UIViewController {

    
    @IBOutlet weak var uiimg: UIImageView!
    @IBOutlet weak var view2: UIView!
    
    var imgName : String?
    var tempProductlist : item02!
    
    var randomNumber = Int.random(in: 0...CategoryCell.catogorycelllist.count - 1)
    //CategoryCell.catogorycelllist[2].productsitemslist[1]
    var randomNumber2 : Int?
    
    @IBOutlet weak var collectionviewforshowitems: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiimg.image = UIImage(named: imgName!)

        randomNumber2 = Int.random(in: 0...CategoryCell.catogorycelllist[randomNumber].productsitemslist.count - 1)
        
        tempProductlist = CategoryCell.catogorycelllist[randomNumber].productsitemslist[randomNumber2 ?? 0]
        
        collectionviewforshowitems.delegate = self
        collectionviewforshowitems.dataSource = self
        collectionviewforshowitems.setCollectionViewLayout(UICollectionViewFlowLayout.init(), animated: true)
        collectionviewforshowitems.register(UINib(nibName: "buttomView1CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "buttomView1CollectionViewCell")
        collectionviewforshowitems.register(UINib(nibName: "buttomView2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "buttomView2CollectionViewCell")
        
        
        view2.layer.cornerRadius = 15
        view2.layer.shadowColor = UIColor.black.cgColor
        view2.layer.shadowOpacity = 0.5
        view2.layer.shadowOffset = .zero
        view2.layer.shadowRadius = 5.0
        
    }
    
}

extension offersViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (tempProductlist.productDetails.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row % 2 == 0
        {
            let cell = collectionviewforshowitems.dequeueReusableCell(withReuseIdentifier: "buttomView1CollectionViewCell", for: indexPath) as! buttomView1CollectionViewCell
            let imgName = tempProductlist.productDetails[indexPath.row].imgNames[2]
            cell.uiimg.image = UIImage(named: imgName)
            let Name = tempProductlist.productDetails[indexPath.row].name
            let originalprice = tempProductlist.productDetails[indexPath.row].orginalprice
            // let discountprice = tempProductlist?.productDetails[indexPath.row].discountprice
            let stcoklable = tempProductlist.productDetails[indexPath.row].stocklabel
            
            
            cell.name.text = Name
            cell.price.text = "$" + String(originalprice)
            cell.stock.text = stcoklable
            if stcoklable == "In stock"
            {
                cell.stock.textColor = .stockcolor
            }
            return cell
        }
        else
        {
            let cell = collectionviewforshowitems.dequeueReusableCell(withReuseIdentifier: "buttomView2CollectionViewCell", for: indexPath) as! buttomView2CollectionViewCell
            
            let imgName = tempProductlist.productDetails[indexPath.row].imgNames[2]
            cell.uiimg.image = UIImage(named: imgName)
            
            let Name = tempProductlist.productDetails[indexPath.row].name
            let originalprice = tempProductlist.productDetails[indexPath.row].orginalprice
            // let discountprice = tempProductlist?.productDetails[indexPath.row].discountprice
            let stcoklable = tempProductlist.productDetails[indexPath.row].stocklabel
            
            cell.name.text = Name
            cell.price.text = "$" + String(originalprice)
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
        vc.imgName = tempProductlist.productDetails[indexPath.row].imgNames
        vc.name1 = tempProductlist.productDetails[indexPath.row].name
        let Price = tempProductlist.productDetails[indexPath.row].orginalprice
        vc.price = "$" + String(Price)
        vc.pp = Price
        vc.des = tempProductlist.productDetails[indexPath.row].shortDescription
        
        if tempProductlist.productDetails[indexPath.row].stocklabel == "In stock"
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

extension offersViewController{
    
    func sizeOfitem () -> CGSize
    {
        let screenWidth = collectionviewforshowitems.frame.width
        let spacingbetweenItem = 10.0
        let spacingAtEdgges = 10.0
        let numberOFitemInEachRow = 2
        
        let totalSpacing = ( spacingAtEdgges * 2) + (Double((numberOFitemInEachRow - 1)) * spacingbetweenItem)
        let itemWidth = (screenWidth - totalSpacing ) / 2
        let itemheight = collectionviewforshowitems.frame.height / 1.7
        return CGSize(width: itemWidth, height: itemheight)
    }
    
}

