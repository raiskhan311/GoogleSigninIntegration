//
//  ViewController.swift
//  Google_Sign_In
//
//  Created by APPLE on 19/07/17.
//  Copyright © 2017 rsku. All rights reserved.
//

import UIKit
import GoogleSignIn
import Google

class ViewController: UIViewController, GIDSignInUIDelegate,GIDSignInDelegate {

    @IBOutlet weak var lbl_name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a ni
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil{
            print(error ?? "some error")
            return
        }
        lbl_name.text = user.profile.email
        print(user.profile.email)
        print(user.profile.imageURL(withDimension: 400))
        print(user.userID)
        print(user.authentication.idToken)
    }

    @IBAction func btn_logingoogle(_ sender: Any) {
        var error:NSError?
        
        GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil{
            print(error ?? "some error")
            return
        }
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        GIDSignIn.sharedInstance().signIn()
//        GIDSignIn.sharedInstance().signInSilently()
//        let googlesigninbutton = GIDSignInButton()
//        googlesigninbutton.center = view.center
//        view.addSubview(googlesigninbutton)
    }
}

