//
//  products.swift
//  imgchangebybuuton
//
//  Created by shahadat on 1/10/24.
//
import Foundation

struct item
{
    let name1:String
    let name2:[String]
    let name3: [String]
}

struct orderitem{
    
    var name:String
    var price:Double
    var imgName:String
    var date : String
}


let celllist: [item] = [
    item(name1: "Fashion", name2: [
        "Unlock the elegance of your perfect shirt.",
        "Discover the flawless fit of your ideal pant.",
        "Reveal the style of your premium footwear."
    ], name3: [
        "shirtImageName",
        "pantImageName",
        "shoeImageName"
    ]),
    
    item(name1: "Groceries", name2: [
        "Fresh and ripe fruits to boost your day.",
        "Farm-fresh vegetables to nourish your body.",
    ], name3: [
        "fruitsImageName",
        "vegetablesImageName",
    ]),

    item(name1: "Electronics", name2: [
        "Stay connected with the latest smartphones.",
        "High-performance laptops and PCs for every need.",
    ], name3: [
        "smartphoneImageName",
        "laptopPcImageName",
    ]),
    item(name1: "Books", name2: [
        "A diverse selection of books for every reader.",
    ], name3: [
        "booksImageName",
    ])
]


var loginData = UserDefaults.standard
