//
//  LoginViewController.swift
//  EnglishForConstructionArena
//
//  Created by Macbook on 10/03/2020.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginImage: UIImageView!
    
    @IBOutlet weak var enteremailAddress_tf: UITextField!
    
    @IBOutlet weak var enterPassword_tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let fbottomline = CALayer()
              
              fbottomline.frame = CGRect(origin: CGPoint(x: 0, y:enteremailAddress_tf.frame.height - 1), size: CGSize(width: enteremailAddress_tf.frame.width, height:  1))
              fbottomline.backgroundColor = UIColor.black.cgColor
              enteremailAddress_tf.borderStyle = UITextField.BorderStyle.none
             enteremailAddress_tf.layer.addSublayer(fbottomline)
        
        
        let sbottomline = CALayer()
              
              sbottomline.frame = CGRect(origin: CGPoint(x: 0, y:enterPassword_tf.frame.height - 1), size: CGSize(width: enterPassword_tf.frame.width, height:  1))
              sbottomline.backgroundColor = UIColor.black.cgColor
              enterPassword_tf.borderStyle = UITextField.BorderStyle.none
              enterPassword_tf.layer.addSublayer(sbottomline)
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        
        
        
        
        
        if let email = enteremailAddress_tf.text,let password = enterPassword_tf.text{
                  Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                      
                      if error != nil {
                          AlertControl.showAlert(self, title: "Something went wrong", message: "wrong username or password.please try again later")
                      }
                      else{
                          self.performSegue(withIdentifier: "loginToHomeSegue", sender: self)
                      }
                  }
                  
              }
        
        
        
        
        
        
        
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        performSegue(withIdentifier: "logintosignup", sender: nil)
    }
    

}
