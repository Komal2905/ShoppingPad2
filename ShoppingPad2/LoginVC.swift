//
//  LoginVC.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 10/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
// This is VIew COntroler 

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var infoButtonPressed: UIButton!
    @IBOutlet weak var userAge: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func loginButtonPressed(sender: AnyObject) {
        
//        let obj: LoginDM = LoginDM(name: userName.text!, age : userAge.text!)
//        obj.printUserName()
        //print("Text Age", userName.text!)
       var uAge:Int? = Int(userAge.text!)
        //print("Age", uAge)
        let logCon = LoginCon()
        logCon.checkAge(uAge!)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
}
