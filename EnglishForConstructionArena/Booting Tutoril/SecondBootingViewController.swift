//
//  SecondBootingViewController.swift
//  EnglishForConstructionArena
//
//  Created by Macbook on 14/03/2020.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit

class SecondBootingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func continueBtn(_ sender: Any) {
        performSegue(withIdentifier: "secondtothird", sender: nil)
    }
    
}
