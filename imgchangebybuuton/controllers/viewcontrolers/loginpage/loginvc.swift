//
//  loginvc.swift
//  imgchangebybuuton
//
//  Created by shahadat on 8/10/24.
//

import UIKit
import FirebaseAuth

class loginvc: UIViewController {

    
    @IBOutlet weak var emailtextfild: UITextField!
    @IBOutlet weak var passwordfild: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        emailtextfild.delegate = self
        passwordfild.delegate = self
     
        
    }
    
  
   
    
    @IBAction func logintohome(_ sender: UIButton) {
    
        guard let email = emailtextfild.text,let pass =  passwordfild.text,!email.isEmpty,!pass.isEmpty else
        {
            showErrorAlert()
            return
        }
        
        if  !isValidEmail(email)
        {
            showLoginErrorAlert(title:  "Invalid email format.")
        }
    
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: pass)
        {
            result,error in
            
            guard error == nil else
            {
                self.showLoginErrorAlert(title: "Login Failed: An error occurred. Please try again.")
                return
            }
            
            self.navigationController?.dismiss(animated: true)
        
        }
        
    }
    

    @IBAction func gotosingUp(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "singupvc") as! singupvc
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension loginvc:UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailtextfild
        {
            passwordfild.becomeFirstResponder()
        }
        else if textField == passwordfild
        {
            passwordfild.resignFirstResponder()
        }
        return true
    }
}


extension loginvc
{
    private func showErrorAlert()
    {
        let alert = UIAlertController(title:"One or More Fields Are Empty", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okey", style: .cancel))
        self.present(alert, animated: true)
    }
    
    private func showLoginErrorAlert(title:String)
    {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okey", style: .cancel))
        self.present(alert, animated: true)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailPattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", emailPattern).evaluate(with: email)
    }
}
