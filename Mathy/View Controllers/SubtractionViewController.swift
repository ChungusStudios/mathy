//
//  SubtractionViewController.swift
//  Mathy 2.9
//
//  Created by Sherman Lui on 29/1/2019.
//  Copyright © 2019 Agent Orange Studio. All rights reserved.
//

import UIKit

class SubtractionViewController: UIViewController {
    
    @IBAction func btnSubBackToHome2(_ sender: UIButton) {
    print("Sub Back Button Pressed")
        self.performSegue(withIdentifier: "BackToHomeSegue2", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Subtraction")
   
    }
}
