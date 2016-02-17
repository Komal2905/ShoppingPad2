//
//  LoginCon.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 10/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class LoginCon {
    var RealAge : Int?
    
    func checkAge(age : Int)
    {
        
        RealAge = age
        if(age < 18)
        {
        print("You cant vote")
        }
        
            
        else
        {
            print("Able to vote")
            let obj: LoginDM = LoginDM(age: RealAge!)
            obj.printUserName()
            print("Object Type", obj.dynamicType)// checking type
            print("Object Type", RealAge.dynamicType)
        }
    }

    
    func getage()
    {
//        let obj: LoginDM = LoginDM(age: RealAge!)
//               obj.printUserName()
    }
}
