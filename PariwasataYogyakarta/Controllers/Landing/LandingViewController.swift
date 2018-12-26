//
//  LandingViewController.swift
//  PariwasataYogyakarta
//
//  Created by Cahyanto Setya Budi on 12/26/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Config navigation controller
        let titleAttribut = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 143/255, green: 196/255, blue: 230/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = titleAttribut
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}
