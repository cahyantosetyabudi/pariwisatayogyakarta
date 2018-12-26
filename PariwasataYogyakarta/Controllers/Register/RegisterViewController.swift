//
//  RegisterViewController.swift
//  PariwasataYogyakarta
//
//  Created by Cahyanto Setya Budi on 12/26/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var lockIconImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lockIconImageView.tintColor = UIColor.lightGray
    }
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        guard let name = fullNameTextField.text, let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text else { return }
        if email.isEmpty || password.isEmpty || name.isEmpty || confirmPassword.isEmpty {
            showMessageAlert(title: "Error", message: "All field can't be empty")
            return
        }
        
        if password != confirmPassword {
            showMessageAlert(title: "Error", message: "Password and confirm password doesn't match")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (userResult, error) in
            guard let email = userResult?.email, error == nil else {
                self.showMessageAlert(title: "Error", message: error!.localizedDescription)
                return
            }
            self.performSegue(withIdentifier: "homeFromRegister", sender: nil)
            return
        }
    }
    
    func showMessageAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
