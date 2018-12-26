//
//  LoginViewController.swift
//  PariwasataYogyakarta
//
//  Created by Cahyanto Setya Budi on 12/26/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = false
//    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        if email.isEmpty || password.isEmpty {
            showMessageAlert(title: "Error", message: "Email and password can't be empty")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (userResult, error) in
            if let error = error {
                self.showMessageAlert(title: "Error", message: error.localizedDescription)
                return
            }
            
            self.performSegue(withIdentifier: "homeFromLogin", sender: nil)
            return
        }
    }
    
    func showMessageAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
