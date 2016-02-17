//
//  LoginDM.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 10/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

//class LoginDM: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//}


class LoginDM
{
    var name : String!
    var age : Int!
    init(age : Int)
    {
      //  self.name = name
        self.age = age
        let sObj : LoginS = LoginS()
        sObj.put(age)
    }
   // let sObj : LoginS = LoginS()
    
    func ageModel(age : Int)
    {
        
    }
    func printUserName(){
        NSLog("In Data Model NAME :\(self.name) AGE :\(self.age) ")
    }
}