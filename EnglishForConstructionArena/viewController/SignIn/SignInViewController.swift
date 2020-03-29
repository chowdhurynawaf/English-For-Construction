//
//  SignInViewController.swift
//  EnglishForConstructionArena
//
//  Created by Macbook on 10/03/2020.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit


class signInViewController: UIViewController {
    
    @IBOutlet weak var signinImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    @IBAction func connectFacebookBtn(_ sender: Any) {
        
        
        
        
        
        let loginManager = LoginManager()
                  
                  loginManager.logIn(permissions: ["public_profile","email"], from: self) { (result, error) in
                      
                      
                      if let error = error{
                          print("failed to login : " , error.localizedDescription)
                          
                          return
                      }
                      
                      
      
                    
                    if AccessToken.current != nil{
                        
                        self.performSegue(withIdentifier: "fbToHome", sender: self)
                    }
          
                  }
                
        
        
        
        
        
        
        
        
        
        
    }
    
    @IBAction func connectGoogleBtn(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        
      
    }
    

    @IBAction func loginEmailBtn(_ sender: Any) {
        
        
        performSegue(withIdentifier: "signintologin", sender: nil)
    }
}
