//
//  User.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 26/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class User
{

    var databasePath = String()
    var path : String?
    public func create() -> String
    {
        databasePath = Model().createDatabase("ShoppingPad.sqlite")
        path = databasePath
        print (path!)
        print("inside create table" , databasePath)
        let shoppingPad = FMDatabase(path: databasePath as String)
        print("path ", shoppingPad)
        
        if shoppingPad.open()
        {
            let createUserTable = "CREATE TABLE IF NOT EXISTS User2 (id INT NOT NULL,name VARCHAR(50),mobile VARCHAR(12),email VARCHAR(100) NULL,otp VARCHAR(7),is_active INT(1),created_at DATETIME(10) NULL,modified_at DATETIME(10) NULL,PRIMARY KEY (id))"
            
            if !shoppingPad.executeStatements(createUserTable)
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
            }
            else
            {
                print("UserTbaleCreate")
            }
            
            shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        return databasePath
    }
    
    
    func insert(dataPath : String)
    {
        let shoppingPad = FMDatabase(path : dataPath)
        if shoppingPad.open()
        {
            let insertQuery = "INSERT INTO User(ID,NAME,MOBILE,EMAIL,OTP) VALUES(1,'Meena','09090909','meena@gmail.com','xyx')"
            let result = shoppingPad.executeUpdate(insertQuery, withArgumentsInArray: nil)
            if !result
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
                
            }
            else
            {
                print("Inserted in User Table")
            }
            shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        
    }
    
    func delete(dataPath : String)
    {
        let shoppingPad = FMDatabase(path : dataPath)
        if shoppingPad.open()
        {
            let deleteQuery = " delete  FROM User where Id = 1"
            let result = shoppingPad.executeUpdate(deleteQuery, withArgumentsInArray: nil)
            if !result
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
                
            }
            else
            {
                print("Deleted from User Table")
            }
            shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        
    }



}
