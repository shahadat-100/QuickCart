//
//  singupvc.swift
//  imgchangebybuuton
//
//  Created by shahadat on 8/10/24.
//

import UIKit
import FirebaseAuth


class singupvc: UIViewController {
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var password2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.delegate = self
        email.delegate = self
        password.delegate = self
        password2.delegate = self
        
    }
    
    @IBAction func singup1(_ sender: UIButton) {
        
        guard let name = name.text,let email = email.text,let password = password.text, let password2 = password2.text,!name.isEmpty,!email.isEmpty,!password.isEmpty,!password2.isEmpty,password==password2 else
        {
            showErrorAlert()
            return
        }
        
        if !isValidEmail(email)
        {
            showLoginErrorAlert(title:"Invalid email format.")
        }
        
        if password.count < 8
        {
            self.showLoginErrorAlert(title: "Password must be at least 8 characters long.")
            
        }
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password)
        { result , error in
            
            if let maybeError = error as NSError?
            {
                if let authErrorCode = AuthErrorCode.init(rawValue: maybeError.code)
                {
                    if authErrorCode == .emailAlreadyInUse
                    {
                        self.showLoginErrorAlert(title: "email is already in use.")
                    }
                    else
                    {
                        self.showLoginErrorAlert(title: "Login Failed: An error occurred. Please try again later.")
                    }
                }
            }
            
            guard let result = result else
            {
                print("Got an error Creating user!")
                return
            }
            
            let user = result.user
            print("created user: \(user)")
            
            // insert user data in database (to do) ....
            //{
            
           
            
            
            //}
            
            
            do
            {
                try FirebaseAuth.Auth.auth().signOut()
                FirebaseDatabaseManager.shared.insertUser(with: User(name: name, email: email))
                self.navigationController?.popViewController(animated: true)
            }
            catch let signOutError {
                print("Error signing out: ", signOutError)
            }
            
            
            
        }
        
    }
    
    @IBAction func singup2(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
}

extension singupvc {
    
    private func showErrorAlert()
    {
        let alert = UIAlertController(title: "Please Singup First!", message: "One or More Fields are Empty.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showLoginErrorAlert(title:String)
    {
        let alert = UIAlertController(title:title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okey", style: .cancel))
        self.present(alert, animated: true)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailPattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", emailPattern).evaluate(with: email)
    }
}


extension singupvc:UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
       
        if textField == name
        {
            email.becomeFirstResponder()
        }
        else if textField == email
        {
            password.becomeFirstResponder()
        }
        else if textField == password
        {
            password2.becomeFirstResponder()
        }
        else if textField == password2
        {
            password2.resignFirstResponder()
        }
        
        return true
    }
}
