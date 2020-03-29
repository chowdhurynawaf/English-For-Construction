//
//  homeViewController.swift
//  EnglishForHotelManagement
//
//  Created by sdmgap3 on 2/25/20.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseAuth
private var authListener: AuthStateDidChangeListenerHandle?


class homeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var viewdesign2: UIView!
    @IBOutlet weak var viewdesign: UIView!
    @IBOutlet weak var viewdesing3: UIView!
    
    @IBOutlet weak var imageview: UIImageView!
    var tag = ["TEST","Awards & Stats","SETTINGS"]
    var icon = ["Vector-2","flaticon1565352165-svg-2","Group"]
    var titleL = ["Plat Quiz","Track Progress","Your Profile"]

    @IBOutlet weak var dateformate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //checkIfUserIsSignedIn()
//
//        let user = Auth.auth().currentUser
//        if user?.uid == nil {
//        //Show Login Screen
//
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
//            // this line shows the fullScreen modalpresentstyle
//            vc!.modalPresentationStyle = .fullScreen
//            self.present(vc!, animated: false)
//
//        } else {
//        //Show content
//            let homevc = self.storyboard?.instantiateViewController(withIdentifier: "home")
//                       // this line shows the fullScreen modalpresentstyle
//                       homevc!.modalPresentationStyle = .fullScreen
//                       self.present(homevc!, animated: false)
//        }
       
//        viewdesign.layer.cornerRadius = 15
//        viewdesign2.layer.cornerRadius = 15
//        imageview.layer.cornerRadius = 50
        // Do any additional setup after loading the view.
        
        var currentDate = Date()
        let formatter = DateFormatter()
        print(currentDate.asString())
        
        
        let date = datee()
        
        print(date)
        dateformate.text = date
        
    }
    

    func datee() ->String{
        
        let date = Calendar(identifier: .gregorian)
        let formatter = DateFormatter()
        formatter.calendar = date
        formatter.dateFormat = "E d MMM"
        
        let today = Date()
        let dataString = formatter.string(from: today)
        
        return dataString
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tag.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myhomeCell", for: indexPath)as! homeTableViewCell
        cell.tagLB.text = tag[indexPath.row]
        cell.titleLB.text = titleL[indexPath.row]
        cell.iconLB.image = UIImage(named: icon[indexPath.row] + ".png")
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    

}



private func checkIfUserIsSignedIn() {
    
    
    

    
    authListener = Auth.auth().addStateDidChangeListener { (auth, user) in

            if let user = user {
                // User is signed in
                // let the user in?
                let vc = homeViewController()
                let storyboard = UIStoryboard(name: "homeStoryboard", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "home") as UIViewController

                vc.present(controller, animated: true, completion: nil)
                
                

               
            } else {
                // No user
                
                let loginVc = LoginViewController()
                let storyboard = UIStoryboard(name: "Login", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as UIViewController

                loginVc.present(controller, animated: true, completion: nil)
            }
        }
    }



extension Date{
    
    func asString() -> String{
        
        let dateformetter = DateFormatter()
        dateformetter.dateFormat = "E d MMM"
        return dateformetter.string(from: self)
        
    }
    

//    Auth.auth().addStateDidChangeListener { (auth, user) in
//        if user != nil {
//            // user is signed in
//            // go to feature controller
//
//
//
////
////            let homevc = self.storyboard.instantiateViewController(withIdentifier: "home")
////                                  // this line shows the fullScreen modalpresentstyle
////                                  homevc!.modalPresentationStyle = .fullScreen
////                                  self.present(homevc!, animated: false)
////
//
//
//
//
//
//
//        } else {
//             // user is not signed in
//             // go to login controller
//
//
////              let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
////                         // this line shows the fullScreen modalpresentstyle
////                         vc!.modalPresentationStyle = .fullScreen
////                         self.present(vc!, animated: false)
//
//
//
//
//
//        }
//    }
    
    
}

