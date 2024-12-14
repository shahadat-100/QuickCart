//
//  products2.swift
//  imgchangebybuuton
//
//  Created by shahadat on 1/10/24.
//



import Foundation


// Define item1 structure with imgNames as an array of strings
struct item01 {
    var imgNames: [String] // Array of image names
    var name: String
    var discountprice: Double
    var orginalprice: Double
    var stocklabel: String
    var shortDescription: String
}

// Define item2 structure for category
struct item02 {
    var categoryName: String
    var productDetails: [item01]
}

struct item3 {
    var productsitemslist:[item02]
}

struct item4
{
    var catogorycelllist:[item3]
}

// Create a manual category with 8 items and up to 30% discount
let manualCategory = item02(
    categoryName: "Manual Category",
    productDetails: [
        item01(imgNames: ["redshirt", "blueshirt", "originalshirt"], name: "Elegant Stylish Shirt", discountprice: 14.0, orginalprice: 20.0, stocklabel: "In stock", shortDescription: "A comfortable and stylish shirt."),
        item01(imgNames: ["redpants", "bluepants", "originalpants"], name: "Chic Jeans Pants", discountprice: 21.0, orginalprice: 30.0, stocklabel: "Out of stock", shortDescription: "Durable and comfortable pants."),
        item01(imgNames: ["redshoe", "blueshoe", "originalshoe"], name: "Trendy Sneakers", discountprice: 35.0, orginalprice: 50.0, stocklabel: "In stock", shortDescription: "Stylish and comfortable shoes."),
        item01(imgNames: ["redjacket", "bluejacket", "originaljacket"], name: "Sophisticated Jacket", discountprice: 49.0, orginalprice: 70.0, stocklabel: "In stock", shortDescription: "Warm and stylish jacket."),
        item01(imgNames: ["redhat", "bluehat", "originalhat"], name: "Fashionable Hat", discountprice: 12.6, orginalprice: 18.0, stocklabel: "In stock", shortDescription: "A fashionable and comfortable hat."),
        item01(imgNames: ["redsock", "bluesock", "originalsock"], name: "Cozy Socks", discountprice: 7.0, orginalprice: 10.0, stocklabel: "In stock", shortDescription: "Soft and durable socks."),
        item01(imgNames: ["redwatch", "bluewatch", "originalwatch"], name: "Luxury Watch", discountprice: 105.0, orginalprice: 150.0, stocklabel: "Out of stock", shortDescription: "A stylish and high-quality watch."),
        item01(imgNames: ["redbelt", "bluebelt", "originalbelt"], name: "Classic Belt", discountprice: 17.5, orginalprice: 25.0, stocklabel: "In stock", shortDescription: "A strong and stylish belt.")
    ]
)


let electronicsCategory = item02(
    categoryName: "Electronics & Appliances",
    productDetails: [
        item01(imgNames: ["mobile1", "mobile2", "mobile3"], name: "iPhone 14 Pro", discountprice: 999.0, orginalprice: 1099.0, stocklabel: "Out of stock", shortDescription: "The latest iPhone with powerful performance and a stunning display."),
        item01(imgNames: ["tablet1", "tablet2", "tablet3"], name: "Samsung Galaxy Tab S8", discountprice: 649.0, orginalprice: 699.0, stocklabel: "In stock", shortDescription: "Versatile tablet with a high-resolution display and S Pen."),
        item01(imgNames: ["laptop1", "laptop2", "laptop3"], name: "Dell XPS 15", discountprice: 1799.0, orginalprice: 1999.0, stocklabel: "In stock", shortDescription: "High-performance laptop perfect for creators and professionals."),
        item01(imgNames: ["blender1", "blender2", "blender3"], name: "Vitamix 750", discountprice: 599.0, orginalprice: 649.0, stocklabel: "In stock", shortDescription: "Professional-grade blender for smoothies, soups, and more."),
        item01(imgNames: ["tv1", "tv2", "tv3"], name: "LG C1 Series 65", discountprice: 1999.0, orginalprice: 2499.0, stocklabel: "In stock", shortDescription: "Stunning 4K OLED TV with exceptional picture quality."),
        item01(imgNames: ["headphones1", "headphones2", "headphones3"], name: "Sony WH-1000XM4", discountprice: 348.0, orginalprice: 399.0, stocklabel: "In stock", shortDescription: "Industry-leading noise-canceling headphones with exceptional sound quality."),
        item01(imgNames: ["fan1", "fan2", "fan3"], name: "LG Purifier Fan", discountprice: 349.0, orginalprice: 399.0, stocklabel: "In stock", shortDescription: "A sleek fan that purifies the air while providing a cool breeze."),
        item01(imgNames: ["router1", "router2", "router3"], name: "Tenda X2", discountprice: 249.0, orginalprice: 299.0, stocklabel: "Out of stock", shortDescription: "Fast and reliable WiFi for all your devices."),
        item01(imgNames: ["camera1", "camera2", "camera3"], name: "Canon EOS M50 Mark II", discountprice: 599.0, orginalprice: 699.0, stocklabel: "In stock", shortDescription: "Versatile mirrorless camera for photography and vlogging."),
        item01(imgNames: ["microwave1", "microwave2", "microwave3"], name: " Microwave Xs", discountprice: 149.0, orginalprice: 199.0, stocklabel: "In stock", shortDescription: "Compact microwave with smart cooking settings."),
    ]
)

/// main Category
let FashionCategory = item3(productsitemslist: [item02(
    categoryName: "Shirts",
    productDetails: [
        item01(imgNames: ["redshirt1", "blueshirt1", "originalshirt1"], name: "Elegant Stylish Shirt", discountprice: 14.0, orginalprice: 20.0, stocklabel: "In stock", shortDescription: "A comfortable and stylish shirt perfect for any occasion."),
        item01(imgNames: ["redshirt2", "blueshirt2", "originalshirt2"], name: "Casual Fit Shirt", discountprice: 16.0, orginalprice: 22.0, stocklabel: "In stock", shortDescription: "Casual and breathable, ideal for warm days."),
        item01(imgNames: ["redshirt3", "blueshirt3", "originalshirt3"], name: "Classic White Shirt", discountprice: 18.0, orginalprice: 25.0, stocklabel: "In stock", shortDescription: "A timeless classic that pairs well with anything."),
        item01(imgNames: ["redshirt4", "blueshirt4", "originalshirt4"], name: "Business Casual Shirt", discountprice: 20.0, orginalprice: 30.0, stocklabel: "In stock", shortDescription: "Perfect for the office or dinner dates."),
        item01(imgNames: ["redshirt5", "blueshirt5", "originalshirt5"], name: "Patterned Shirt", discountprice: 22.0, orginalprice: 28.0, stocklabel: "Out of stock", shortDescription: "A stylish patterned shirt to make a statement."),
        item01(imgNames: ["redshirt6", "blueshirt6", "originalshirt6"], name: "Long Sleeve Shirt", discountprice: 25.0, orginalprice: 35.0, stocklabel: "In stock", shortDescription: "Perfect for layering during the cooler months."),
        item01(imgNames: ["redshirt7", "blueshirt7", "originalshirt7"], name: "Denim Shirt", discountprice: 30.0, orginalprice: 40.0, stocklabel: "Out of stock", shortDescription: "Versatile denim shirt for a casual look."),
        item01(imgNames: ["redshirt8", "blueshirt8", "originalshirt8"], name: "Flannel Shirt", discountprice: 15.0, orginalprice: 20.0, stocklabel: "Out of stock", shortDescription: "Soft and warm, perfect for chilly evenings.")
    ]
),item02(
    categoryName: "Pants",
    productDetails: [
        item01(imgNames: ["redpants1", "bluepants1", "originalpants1"], name: "Casual Chino Pants", discountprice: 25.0, orginalprice: 35.0, stocklabel: "In stock", shortDescription: "Comfortable chinos for everyday wear."),
        item01(imgNames: ["redpants2", "bluepants2", "originalpants2"], name: "Slim Fit Jeans", discountprice: 30.0, orginalprice: 45.0, stocklabel: "In stock", shortDescription: "Stylish slim fit jeans that enhance your silhouette."),
        item01(imgNames: ["redpants3", "bluepants3", "originalpants3"], name: "Relaxed Fit Cargo Pants", discountprice: 28.0, orginalprice: 40.0, stocklabel: "In stock", shortDescription: "Durable cargo pants with plenty of pockets for convenience."),
        item01(imgNames: ["redpants4", "bluepants4", "originalpants4"], name: "Tailored Trousers", discountprice: 32.0, orginalprice: 50.0, stocklabel: "Out of stock", shortDescription: "Sophisticated tailored trousers for formal occasions."),
        item01(imgNames: ["redpants5", "bluepants5", "originalpants5"], name: "Athletic Fit Joggers", discountprice: 20.0, orginalprice: 30.0, stocklabel: "Out of stock", shortDescription: "Comfortable joggers designed for active lifestyles."),
        item01(imgNames: ["redpants6", "bluepants6", "originalpants6"], name: "Wide Leg Pants", discountprice: 22.0, orginalprice: 32.0, stocklabel: "In stock", shortDescription: "Trendy wide leg pants for a relaxed fit."),
        item01(imgNames: ["redpants7", "bluepants7", "originalpants7"], name: "Linen Summer Pants", discountprice: 26.0, orginalprice: 38.0, stocklabel: "Out of stock", shortDescription: "Lightweight linen pants perfect for summer outings."),
        item01(imgNames: ["redpants8", "bluepants8", "originalpants8"], name: "Classic Black Trousers", discountprice: 35.0, orginalprice: 50.0, stocklabel: "In stock", shortDescription: "Essential black trousers that are a wardrobe staple.")
    ]
),item02(
    categoryName: "Shoes",
    productDetails: [
        item01(imgNames: ["redshoe1", "blueshoe1", "originalshoe1"], name: "Nike Air Max 270", discountprice: 45.0, orginalprice: 60.0, stocklabel: "In stock", shortDescription: "Stylish sneakers with a lightweight design."),
        item01(imgNames: ["redshoe2", "blueshoe2", "originalshoe2"], name: "Nike Air Force 1", discountprice: 55.0, orginalprice: 80.0, stocklabel: "In stock", shortDescription: "Classic leather sneakers that never go out of style."),
        item01(imgNames: ["redshoe3", "blueshoe3", "originalshoe3"], name: "Nike React Infinity Run", discountprice: 60.0, orginalprice: 90.0, stocklabel: "In stock", shortDescription: "Comfortable running shoes for a smooth ride."),
        item01(imgNames: ["redshoe4", "blueshoe4", "originalshoe4"], name: "Nike ZoomX Vaporfly", discountprice: 30.0, orginalprice: 45.0, stocklabel: "In stock", shortDescription: "High-performance shoes for serious runners."),
        item01(imgNames: ["redshoe5", "blueshoe5", "originalshoe5"], name: "Nike Blazer Mid", discountprice: 70.0, orginalprice: 100.0, stocklabel: "Out of stock", shortDescription: "Retro-inspired basketball shoes for everyday wear."),
        item01(imgNames: ["redshoe6", "blueshoe6", "originalshoe6"], name: "Nike Air Presto", discountprice: 25.0, orginalprice: 35.0, stocklabel: "Out of stock", shortDescription: "Versatile and comfortable for any occasion."),
        item01(imgNames: ["redshoe7", "blueshoe7", "originalshoe7"], name: "Nike Air Huarache", discountprice: 85.0, orginalprice: 120.0, stocklabel: "Out of stock", shortDescription: "Stylish and supportive shoes for casual wear."),
        item01(imgNames: ["redshoe8", "blueshoe8", "originalshoe8"], name: "Nike Dunk Low", discountprice: 50.0, orginalprice: 70.0, stocklabel: "In stock", shortDescription: "Iconic low-top sneakers with a classic look.")
    ]
),])

let Groceries = item3(productsitemslist: [item02(
    categoryName: "Fruits",
    productDetails: [
        item01(imgNames: ["originalapple", "originalapple", "originalapple"], name: "Fresh Red Apples", discountprice: 1.50, orginalprice: 2.00, stocklabel: "In stock", shortDescription: "Crisp and sweet red apples, perfect for snacking."),
        item01(imgNames: ["originalbanana", "originalbanana", "originalbanana"], name: "Ripe Bananas", discountprice: 0.75, orginalprice: 1.00, stocklabel: "In stock", shortDescription: "Sweet and creamy bananas, a healthy on-the-go snack."),
        item01(imgNames: ["originalorange", "originalorange", "originalorange"], name: "Juicy Oranges", discountprice: 1.00, orginalprice: 1.50, stocklabel: "In stock", shortDescription: "Citrusy and refreshing, perfect for juices or snacks."),
        item01(imgNames: ["originalgrapes", "originalgrapes", "originalgrapes"], name: "Seedless Grapes", discountprice: 2.00, orginalprice: 2.50, stocklabel: "Out of stock", shortDescription: "Sweet and juicy seedless grapes, ideal for snacking."),
        item01(imgNames: ["originalstrawberry", "originalstrawberry", "originalstrawberry"], name: "Fresh Strawberries", discountprice: 3.00, orginalprice: 4.00, stocklabel: "In stock", shortDescription: "Delicious and ripe strawberries, great for desserts."),
        item01(imgNames: ["originalpineapple", "originalpineapple", "originalpineapple"], name: "Pineapple Slices", discountprice: 2.50, orginalprice: 3.50, stocklabel: "In stock", shortDescription: "Sweet and tangy pineapple slices, perfect for smoothies."),
        item01(imgNames: ["originalblueberry", "originalblueberry", "originalblueberry"], name: "Blueberries", discountprice: 3.50, orginalprice: 4.50, stocklabel: "Out of stock", shortDescription: "Tiny and tasty blueberries, packed with antioxidants."),
        item01(imgNames: ["originalwatermelon", "originalwatermelon", "originalwatermelon"], name: "Watermelon Wedges", discountprice: 5.00, orginalprice: 6.00, stocklabel: "In stock", shortDescription: "Refreshing watermelon wedges, perfect for summer picnics.")
    ]
),item02(
    categoryName: "Vegetables",
    productDetails: [
        item01(imgNames: ["carrot", "carrot", "carrot"], name: "Fresh Carrots", discountprice: 1.00, orginalprice: 1.50, stocklabel: "Out of stock", shortDescription: "Crisp and sweet carrots, perfect for snacking or cooking."),
        item01(imgNames: ["broccoli", "broccoli", "broccoli"], name: "Organic Broccoli", discountprice: 1.75, orginalprice: 2.25, stocklabel: "In stock", shortDescription: "Nutritious and vibrant green broccoli, great for stir-fries."),
        item01(imgNames: ["tomato", "tomato", "tomato"], name: "Ripe Tomatoes", discountprice: 2.00, orginalprice: 2.50, stocklabel: "Out of stock", shortDescription: "Juicy and flavorful tomatoes, ideal for salads and sauces."),
        item01(imgNames: ["spinach", "spinach", "spinach"], name: "Fresh Spinach", discountprice: 1.50, orginalprice: 2.00, stocklabel: "In stock", shortDescription: "Tender and nutritious spinach, perfect for salads and smoothies."),
        item01(imgNames: ["potato", "potato", "potato"], name: "Organic Potatoes", discountprice: 1.00, orginalprice: 1.20, stocklabel: "In stock", shortDescription: "Versatile potatoes for baking, boiling, or frying."),
        item01(imgNames: ["cucumber", "cucumber", "cucumber"], name: "Crunchy Cucumbers", discountprice: 0.75, orginalprice: 1.00, stocklabel: "In stock", shortDescription: "Cool and refreshing cucumbers, great for salads."),
        item01(imgNames: ["bellpepper", "bellpepper", "bellpepper"], name: "Bell Peppers", discountprice: 1.50, orginalprice: 2.00, stocklabel: "Out of stock", shortDescription: "Colorful and crunchy bell peppers, perfect for stir-fries."),
        item01(imgNames: ["onion", "onion", "onion"], name: "Yellow Onions", discountprice: 0.60, orginalprice: 0.80, stocklabel: "Out of stock", shortDescription: "A staple in every kitchen, perfect for flavoring dishes.")
    ]
)])

let Electronics = item3(productsitemslist: [item02(
    categoryName: "Smartphones",
    productDetails: [
        item01(imgNames: ["iphone13", "iphone13pro", "originaliphone13"], name: "iPhone 13 Pro", discountprice: 999.00, orginalprice: 1099.00, stocklabel: "Out of stock", shortDescription: "Sleek and powerful with an advanced camera system and A15 chip."),
        item01(imgNames: ["samsungs21", "samsungs21ultra", "originalsamsungs21"], name: "Samsung Galaxy S21 Ultra", discountprice: 850.00, orginalprice: 1000.00, stocklabel: "In stock", shortDescription: "High-performance flagship with an impressive 108MP camera."),
        item01(imgNames: ["pixel6", "pixel6pro", "originalpixel6"], name: "Google Pixel 6 Pro", discountprice: 899.00, orginalprice: 999.00, stocklabel: "In stock", shortDescription: "Experience the best of Android with outstanding photography capabilities."),
        item01(imgNames: ["oneplus9", "oneplus9pro", "originaloneplus9"], name: "OnePlus 9 Pro", discountprice: 799.00, orginalprice: 969.00, stocklabel: "In stock", shortDescription: "Fast and smooth performance with a stunning display and Hasselblad camera."),
        item01(imgNames: ["xiaomi11", "xiaomi11ultra", "originalxiaomi11"], name: "Xiaomi Mi 11 Ultra", discountprice: 749.00, orginalprice: 899.00, stocklabel: "Out of stock", shortDescription: "Flagship killer with a brilliant display and versatile camera setup."),
        item01(imgNames: ["huaweiP40", "huaweiP40pro", "originalhuaweiP40"], name: "Huawei P40 Pro", discountprice: 899.00, orginalprice: 1099.00, stocklabel: "In stock", shortDescription: "Exceptional camera capabilities with stunning design and 5G connectivity."),
        item01(imgNames: ["motorolaedge", "motorolaedgeplus", "originalmotorolaedge"], name: "Motorola Edge+", discountprice: 699.00, orginalprice: 799.00, stocklabel: "In stock", shortDescription: "Edge-to-edge display and powerful performance for all your needs."),
        item01(imgNames: ["nokiaX20", "nokiaX30", "originalnokiaX20"], name: "Nokia X20", discountprice: 499.00, orginalprice: 599.00, stocklabel: "Out of stock", shortDescription: "Reliable performance with a focus on sustainability and durability.")
    ]
),item02(
    categoryName: "Laptops",
    productDetails: [
        item01(imgNames: ["macbookpro", "macbookpro16", "originalmacbookpro"], name: "MacBook Pro 16", discountprice: 2399.00, orginalprice: 2499.00, stocklabel: "Out of stock", shortDescription: "Powerful performance with M1 chip, perfect for creatives."),
        item01(imgNames: ["dellxps", "dellxps13", "originaldellxps"], name: "Dell XPS 13", discountprice: 999.00, orginalprice: 1199.00, stocklabel: "Out of stock", shortDescription: "Sleek design with InfinityEdge display and great performance."),
        item01(imgNames: ["hpenvy", "hpenvy14", "originalhp"], name: "HP Envy 14", discountprice: 1199.00, orginalprice: 1399.00, stocklabel: "In stock", shortDescription: "Versatile laptop with powerful specs and a stunning display."),
        item01(imgNames: ["lenovothinkpad", "lenovothinkpad14", "originallenovo"], name: "Lenovo ThinkPad X1", discountprice: 1599.00, orginalprice: 1799.00, stocklabel: "In stock", shortDescription: "Legendary durability and performance, perfect for business."),
        item01(imgNames: ["asusrog", "asusrogzephyrus", "originalasus"], name: "ASUS ROG Zephyrus G14", discountprice: 1499.00, orginalprice: 1799.00, stocklabel: "In stock", shortDescription: "High-performance gaming laptop with stunning visuals."),
        item01(imgNames: ["acerpredator", "acerpredatorhelios", "originalacer"], name: "Acer Predator Helios 300", discountprice: 1299.00, orginalprice: 1499.00, stocklabel: "In stock", shortDescription: "Powerful gaming laptop with excellent cooling system."),
        item01(imgNames: ["msisummit", "msisummite14", "originalmsi"], name: "MSI Summit E14", discountprice: 1299.00, orginalprice: 1499.00, stocklabel: "Out of stock", shortDescription: "Lightweight laptop with exceptional battery life for professionals."),
        item01(imgNames: ["toshibaclick", "toshibaclick10", "originaltoshiba"], name: "Toshiba Dynabook", discountprice: 799.00, orginalprice: 999.00, stocklabel: "In stock", shortDescription: "Affordable laptop with reliable performance for everyday tasks.")
    ]
)])

let bookMedia = item3(productsitemslist: [item02(
    categoryName: "Books",
    productDetails: [
        item01(imgNames: ["book1cover", "book1cover", "book1cover"], name: "The Great Gatsby", discountprice: 10.99, orginalprice: 14.99, stocklabel: "In stock", shortDescription: "A classic novel exploring themes of wealth and love in the Jazz Age."),
        item01(imgNames: ["book2cover", "book2cover", "book2cover"], name: "1984", discountprice: 8.99, orginalprice: 12.99, stocklabel: "In stock", shortDescription: "A dystopian novel about totalitarianism and surveillance."),
        item01(imgNames: ["book3cover", "book3cover", "book3cover"], name: "To Kill a Mockingbird", discountprice: 11.99, orginalprice: 15.99, stocklabel: "In stock", shortDescription: "A novel dealing with serious issues of race and injustice in the Deep South."),
        item01(imgNames: ["book4cover", "book4cover", "book4cover"], name: "Pride and Prejudice", discountprice: 9.99, orginalprice: 13.99, stocklabel: "In stock", shortDescription: "A romantic novel about the complexities of love and social class."),
        item01(imgNames: ["book5cover", "book5cover", "book5cover"], name: "The Catcher in the Rye", discountprice: 12.99, orginalprice: 16.99, stocklabel: "In stock", shortDescription: "A novel about teenage angst and alienation."),
        item01(imgNames: ["book6cover", "book6cover", "book6cover"], name: "Brave New World", discountprice: 10.49, orginalprice: 14.49, stocklabel: "Out of stock", shortDescription: "A dystopian novel about a technologically advanced future society."),
        item01(imgNames: ["book7cover", "book7cover", "book7cover"], name: "Moby Dick", discountprice: 13.99, orginalprice: 17.99, stocklabel: "Out of stock", shortDescription: "A novel about the obsessive quest of Captain Ahab to hunt the white whale."),
        item01(imgNames: ["book8cover", "book8cover", "book8cover"], name: "The Alchemist", discountprice: 15.99, orginalprice: 19.99, stocklabel: "In stock", shortDescription: "A philosophical novel about a young shepherd’s journey to discover his personal legend.")
    ]
)])

let CategoryCell = item4(catogorycelllist: [FashionCategory,Groceries,Electronics,bookMedia])
