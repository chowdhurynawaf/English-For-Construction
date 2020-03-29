//
//  FirstBootingViewController.swift
//  EnglishForConstructionArena
//
//  Created by Macbook on 14/03/2020.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit

class FirstBootingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
      performSegue(withIdentifier: "firsttosecond", sender: nil)
    }
    
}
