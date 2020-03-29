//
//  Sign Up ViewController.swift
//  EnglishForConstructionArena
//
//  Created by Macbook on 11/03/2020.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit
import Firebase

class Sign_Up_ViewController: UIViewController {
    
    @IBOutlet weak var signUpImage: UIImageView!
    
    @IBOutlet weak var enterName_tf: UITextField!
    @IBOutlet weak var enterEmail_tf: UITextField!
    @IBOutlet weak var createPassword_tf: UITextField!
    @IBOutlet weak var pleasetypeLocation_tf: UITextField!
    @IBOutlet weak var pleasetypeGender_tf: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let fbottomLine = CALayer()
        fbottomLine.frame = CGRect(origin: CGPoint(x: 0, y:enterName_tf.frame.height - 1), size: CGSize(width: enterName_tf.frame.width, height:  1))
        fbottomLine.backgroundColor = UIColor.black.cgColor
        enterName_tf.borderStyle = UITextField.BorderStyle.none
        enterName_tf.layer.addSublayer(fbottomLine)
        
        
        let sbottomLine = CALayer()
        
       sbottomLine.frame = CGRect(origin: CGPoint(x: 0, y:enterEmail_tf.frame.height - 1), size: CGSize(width: enterEmail_tf.frame.width, height:  1))
        sbottomLine.backgroundColor = UIColor.black.cgColor
        enterEmail_tf.borderStyle = UITextField.BorderStyle.none
        enterEmail_tf.layer.addSublayer(sbottomLine)
        
        
        let tbottomLine = CALayer()
        
        tbottomLine.frame = CGRect(origin: CGPoint(x: 0, y:createPassword_tf.frame.height - 1), size: CGSize(width: createPassword_tf.frame.width, height:  1))
        tbottomLine.backgroundColor = UIColor.black.cgColor
        createPassword_tf.borderStyle = UITextField.BorderStyle.none
        createPassword_tf.layer.addSublayer(tbottomLine)
        
        
        let fourbottomline = CALayer()
        
        fourbottomline.frame = CGRect(origin: CGPoint(x: 0, y:pleasetypeLocation_tf.frame.height - 1), size: CGSize(width: pleasetypeLocation_tf.frame.width, height:  1))
        fourbottomline.backgroundColor = UIColor.black.cgColor
        pleasetypeLocation_tf.borderStyle = UITextField.BorderStyle.none
        pleasetypeLocation_tf.layer.addSublayer(fourbottomline)
        
        
        let fivebottomline = CALayer()
        
     fivebottomline.frame = CGRect(origin: CGPoint(x: 0, y:pleasetypeGender_tf.frame.height - 1), size: CGSize(width: pleasetypeGender_tf.frame.width, height:  1))
        fivebottomline.backgroundColor = UIColor.black.cgColor
        pleasetypeGender_tf.borderStyle = UITextField.BorderStyle.none
        pleasetypeGender_tf.layer.addSublayer(fivebottomline)
        
    
    }

    @IBAction func signUpBtn(_ sender: Any) {
        
        
        let db = Firebase.Firestore.firestore()

        
        
        let emailOfSignUpView = enterEmail_tf.text?.trimmingCharacters(in: .whitespacesAndNewlines)
             let passwordofSignUp = createPassword_tf.text?.trimmingCharacters(in: .whitespacesAndNewlines)
             
             Auth.auth().createUser(withEmail: emailOfSignUpView!, password: passwordofSignUp!) { (user, error) in
                 
                 if  error != nil{
                     AlertControl.showAlert(self, title: "Something went wrong", message: "Please input all the values correctly")
                 }
                 else{
                    
                    db.collection("users").document(String((user?.user.uid)!)).setData(["firstName":self.enterName_tf.text!,"lastName":self.pleasetypeGender_tf.text!])
                    
                     self.performSegue(withIdentifier: "signUpToHome", sender: self)
                 }
                 
             }
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        performSegue(withIdentifier: "signuptologin", sender: nil)
    }
    
    
    
    
}
