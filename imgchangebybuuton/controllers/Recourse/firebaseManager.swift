//
//  firebaseManager.swift
//  imgchangebybuuton
//
//  Created by shahadat on 13/12/24.
//



import Foundation
import FirebaseDatabase
import FirebaseAuth

final class FirebaseDatabaseManager
{
    static let shared = FirebaseDatabaseManager()
    private var database_ref = Database.database().reference()
}

// MARK: - Account Managment
extension FirebaseDatabaseManager
{
    public func safeEmailAdress(_emailAddress:String) -> String
    {
        var safe_email: String
        
        safe_email = _emailAddress.replacingOccurrences(of: "@", with: "-")
        safe_email = safe_email.replacingOccurrences(of: ".", with: "-")
        
        return safe_email
    }
    
    public func insertUser(with user: User) {
        
        let safeEmail = safeEmailAdress(_emailAddress: user.email)
        let userRef = self.database_ref.child("Buyers_Data").child(safeEmail)
        
        // Check if the user already exists
        userRef.observeSingleEvent(of: .value) { snapshot in
            if snapshot.exists() {
                print("User data with this email already exists.")
            } else {
                // Insert new user data
                userRef.setValue([
                    "_Name": user.name
                ]) { error, _ in
                    if let error = error {
                        print("Error saving data to database: \(error)")
                    } else {
                        print("Data saved successfully in Database!")
                    }
                }
            }
        }
    }

    public func fetchUserName(with userEmailAddress: String, completion: @escaping (String?) -> Void ) {
        
        let safeEmail = safeEmailAdress(_emailAddress: userEmailAddress)
        let userRef = self.database_ref.child("Buyers_Data").child(safeEmail)
        
        userRef.observeSingleEvent(of: .value) { snapshot in
            // Check if the snapshot contains valid data
            guard let userData = snapshot.value as? [String: Any] else {
                print("User data not found")
                completion(nil)
                return
            }
            
            // Extract the user name
            guard let userName = userData["_Name"] as? String else {
                print("userName not found")
                completion(nil)
                return
            }
            
            // Return the userName
            completion(userName)
        }
    }
    
    public func updateBuyerDetails(
        with userEmailAddress: String,
        item: orderitem,
        price: Double,
        completion: @escaping (Bool) -> Void)
    {
        let safeEmail = safeEmailAdress(_emailAddress: userEmailAddress)
        let userRef = self.database_ref.child("Buyers_Data").child(safeEmail)
        
        userRef.observeSingleEvent(of: .value) { snapshot in
            var totalAmount: Double = 0
            var items: [[String: Any]] = []
            var name = "UnKnown"
            // Check if the buyer already exists in the database
            if let user = snapshot.value as? [String: Any] {
                totalAmount = user["totalAmount"] as? Double ?? 0
                items = user["items"] as? [[String: Any]] ?? []
                name = user["_Name"] as? String ?? "UnKnown"
            }
            
            // Update the total amount
            totalAmount += price
            
            // Add the new item to the list
            let newItem: [String: Any] = [
                "_name": item.name,
                "_price": price,
                "_imageName": item.imgName,
                "_date": item.date
            ]
            items.append(newItem)
            
            // Create the updated buyer data
            let updatedData: [String: Any] = [
                "totalAmount": totalAmount,
                "items": items,
                "_Name": name
            ]
            
            // Write the updated data back to Firebase
            userRef.setValue(updatedData) { error, _ in
                if let error = error {
                    print("Failed to update buyer details: \(error)")
                    completion(false)
                } else {
                    completion(true)
                }
            }
        }
    }

    
    public func FetchBuyerDetails(
        with userEmailAddress: String,
        completion: @escaping ([orderitem], Double) -> Void
    ) {
       
        let safeEmail = safeEmailAdress(_emailAddress: userEmailAddress)
        let userRef = self.database_ref.child("Buyers_Data").child(safeEmail)
        
       
        userRef.observeSingleEvent(of: .value) { snapshot in
           
            var totalAmount: Double = 0.0
            var itemlist: [orderitem] = []
            
            
            guard let user = snapshot.value as? [String: Any],
                  let items = user["items"] as? [[String: Any]],let _totalAmount = user["totalAmount"] as? Double else {
                
                completion([], 0.0)
                print("data missing")
                return
            }
            
            totalAmount =  _totalAmount
            
            
            for item in items {
               
                let name = item["_name"] as? String ?? "Unknown"
                let price = item["_price"] as? Double ?? 0.0
                let imgName = item["_imageName"] as? String ?? ""
                let date = item["_date"] as? String ?? ""
                
                
                let Item = orderitem(name: name, price: price, imgName: imgName, date: date)
                itemlist.append(Item)
            }
        
            completion(itemlist, totalAmount)
        }
    }

    
    
    public func deleteItem(
        for userEmailAddress: String,
        atIndex index: Int,
        completion: @escaping (Bool) -> Void
    ) {
       
        let safeEmail = safeEmailAdress(_emailAddress: userEmailAddress)
        let userRef = self.database_ref.child("Buyers_Data").child(safeEmail)
        
       
        userRef.observeSingleEvent(of: .value) { snapshot in
            guard var user = snapshot.value as? [String: Any],
                  var items = user["items"] as? [[String: Any]],
                  var totalAmount = user["totalAmount"] as? Double,
                  let name = user["_Name"] as? String  else {
                completion(false)
                return
            }
            
            
            guard index >= 0 && index < items.count else {
                print("Invalid index: \(index)")
                completion(false) // Index out of range.
                return
            }
            
            if let price = items[index]["_price"] as? Double {
                totalAmount -= price
            }

            items.remove(at: index)
            
            user["items"] = items
            user["totalAmount"] = totalAmount
            user["_Name"] = name
            
            userRef.setValue(user) { error, _ in
                if let error = error {
                    print("Failed to delete item: \(error.localizedDescription)")
                    completion(false)
                } else {
                    completion(true) 
                }
            }
        }
    }



    

}


