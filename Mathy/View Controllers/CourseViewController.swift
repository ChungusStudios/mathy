//
//  CourseViewController.swift
//  Mathy 2.9
//
//  Created by Sherman Lui on 24/1/2019.
//  Copyright © 2019 Agent Orange Studio. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController {


    @IBAction func btnSwichToAlgView(_ sender: UIButton) {
    print("Algebraic Button Pressed")
     self.performSegue(withIdentifier: "AlgebraicViewSegue", sender: self)
    }
   
    @IBAction func BtnSwitchToSubView(_ sender: UIButton) {
        print("Sub Button Pressed")
        self.performSegue(withIdentifier: "SubtractionViewSegue", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    print("Cource")
    }


}

