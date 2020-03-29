//
//  AppDelegate.swift
//  EnglishForConstructionArena
//
//  Created by Shahid Sabir on 8/3/20.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth
import FBSDKCoreKit


private var authListener: AuthStateDidChangeListenerHandle?



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,GIDSignInDelegate {


    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        FirebaseApp.configure()
        isAppAlreadyLaunchedOnce()
        

        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
   
//
//    @available(iOS 9.0, *)
//    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
//      -> Bool {
//      return GIDSignIn.sharedInstance().handle(url)
//    }
    
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      // ...
      if let error = error {
        // ...
        return
      }

      guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,accessToken: authentication.accessToken)
        
        
        
        
        
        
        if authentication.accessToken != nil{
            
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
              if let error = error {
                // ...
                return
              }
              // User is signed in
                
            
                self.window = UIWindow(frame: UIScreen.main.bounds)

                let storyboard = UIStoryboard(name: "homeStoryboard", bundle: nil)

                 let initialViewController = storyboard.instantiateViewController(withIdentifier: "home")

                 self.window?.rootViewController = initialViewController
                 self.window?.makeKeyAndVisible()
              // ...
            }
           
        }
        
      // ...
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    func isAppAlreadyLaunchedOnce(){
        let defaults = UserDefaults.standard

        if let isAppAlreadyLaunchedOnce = defaults.string(forKey: "isAppAlreadyLaunchedOnce"){
            print("App already launched : \(isAppAlreadyLaunchedOnce)")
            
            
            
            if Auth.auth().currentUser != nil || AccessToken.current != nil  {
                
                self.window = UIWindow(frame: UIScreen.main.bounds)
                
                let storyboard = UIStoryboard(name: "homeStoryboard", bundle: nil)
                
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "home")
                
                self.window?.rootViewController = initialViewController
                self.window?.makeKeyAndVisible()
            }else{
                
                self.window = UIWindow(frame: UIScreen.main.bounds)
                
                let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
                
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "Sing_In_ViewController")
                
                self.window?.rootViewController = initialViewController
                self.window?.makeKeyAndVisible()
                
            }
                
            }
            
        else{
            
            
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            
            self.window = UIWindow(frame: UIScreen.main.bounds)
            let storyboard = UIStoryboard(name: "FirstBooting", bundle: nil)
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "FirstBootingViewController")
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
            
            
        }
    }
    
    
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    let handledFB = FBSDKCoreKit.ApplicationDelegate.shared.application(app, open: url, options: options)
    let handledGoogle = GIDSignIn.sharedInstance().handle(url)
    return handledFB || handledGoogle
}
    

}

