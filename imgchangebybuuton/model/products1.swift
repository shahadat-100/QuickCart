//
//  products1.swift
//  imgchangebybuuton
//
//  Created by shahadat on 13/12/24.
//

let slidingimage : [String] = [
    "s0","s1","s3","s4","s5","s6","s7","s8","s9"
]

var tablename : [String] = [
    "Unlock the elegance of your perfect shirt.",
    "Discover the flawless fit of your ideal pant.",
    "Reveal the style of your premium footwear."
]

var tableimg : [String]
= [
    "shirtImageName",
    "pantImageName",
    "shoeImageName"
]

struct data
{
   let name : String
   let imageName : String
}

let arr1 : [data] = [
    data(name: "General", imageName: "General"),
    data(name: "Privacy", imageName: "Privacy"),
    data(name: "Notification", imageName: "Notification"),
    data(name: "Security", imageName: "Security"),
    data(name: "App Info", imageName: "App Info")
]
