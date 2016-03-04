//
//  Model.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 17/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import CoreData
import Foundation


private let model = Model()
var databasePath = String()
public class Model
{
    
// For singleton class
        static let sharedInstance: Model = {
        let instance = Model()
        return instance
        }()
    
    
// Creating Database on directory
    func createDatabase(nameOfTheDataBase: String  ) ->String
    {
        let databasePath = "/Users/BridgeLabz/Documents/komal/IOS/SPTEST/ShoppingPad2/ShoppingPad2/ShoppingPad.sqlite"
        let DB = FMDatabase(path: databasePath as String)
        print("path ", DB)
        if DB == nil
        {
        print("Error: \(DB.lastErrorMessage())")
        }
        
        return databasePath
    }
    
    
    
    
    func createTable(name : String)
    {
        
        databasePath = createDatabase("ShoppingPad.sqlite")
        
        let shoppingPad = FMDatabase(path: databasePath as String)
        if(shoppingPad.open())
        {
            if(shoppingPad.tableExists(name))
            {
                print("table Exist Named :",(name))
                shoppingPad.close()
            }
            else
            {
                if(name == "Contents")
                {
                    
                    let createContentTable = "CREATE TABLE  \(name) (contentid INT NOT NULL,contenttype VARCHAR(45) NULL,title INT NULL,decription VARCHAR NULL,display_name VARCHAR(45) NULL,url VARCHAR(45) NULL,imageLink VARCHAR(45) NULL,contentLink VARCHAR(45) NULL,syncDateTime DATETIME(45) NULL,created_at DATETIME(45) NULL,modified_at DATETIME(45) NULL,PRIMARY KEY (Contentid))"
                    
                    if !shoppingPad.executeStatements(createContentTable)
                    {
                        print("Error: \(shoppingPad.lastErrorMessage())")
                    }
                    else
                    {
                        print("Created table contents")
                    }
                }
                if(name == "UserContentView")
                {
                    
                    let createUserContentView = " CREATE TABLE \(name)(userContentId INT NOT NULL,userAdminId INT NULL,contetId INT NULL,userId INT NULL,firstName VARCHAR(45) NULL,lastName VARCHAR(45) NULL,email VARCHAR(45) NULL,displayProfile VARCHAR(45) NULL,lastViewedDateTime DATETIME(45) NULL,numberOfViews INT NULL,PRIMARY KEY (UserContentId))"
                    
                    if !shoppingPad.executeStatements(createUserContentView)
                    {
                        print("Error: \(shoppingPad.lastErrorMessage())")
                    }
                }
                
                if(name == "UserContentViewDetails")
                {
                    
                    let createUserContentViewDetails = "CREATE TABLE \(name)(userContentViewId INT NOT NULL,userContentId INT NULL,dateTime DATETIME(45) NULL,timeSpent VARCHAR(45) NULL,deviceType VARCHAR(45) NULL,deviceOS VARCHAR(45) NULL,network VARCHAR(45) NULL,PRIMARY KEY (userContentViewId))"
                    
                    if !shoppingPad.executeStatements(createUserContentViewDetails)
                    {
                        print("Error: \(shoppingPad.lastErrorMessage())")
                    }
                }
                
            }
            
        shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
            
        }
    }
    
    
    
    
    
 // check table is Empty or Not
    func isEmptyTable(name:String)->Bool
    {
        let model = Model()
        databasePath = model.createDatabase("ShoppingPad.sqlite")
        
        let shoppingPad = FMDatabase(path: databasePath as String)
        var isEmpty = Bool()
        
        if(shoppingPad.open())
        {
            let checkEmpty = shoppingPad.executeQuery("SELECT COUNT(*) FROM \(name)", withArgumentsInArray: [])
            if checkEmpty.next()
            {
                let count = checkEmpty.intForColumnIndex(0)
                if count > 0
                {
                    shoppingPad.close()
                    isEmpty = false
                }
                else
                {
                    shoppingPad.close()
                    isEmpty = true
                }
            }
            else
            {
                print("Database error", name)
            }
        shoppingPad.close()
        }

        return isEmpty
    }

}










//class Model : NSObject
//{
//
//    
//    func createDatabase() -> FMDatabase
//    {
//        var dbStatus : Bool = Bool()
//        var databasePath = NSString()
//        let filemgr = NSFileManager.defaultManager()
//        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
//        var shoppingPadDB = FMDatabase()
//        
//        //var shoppingPadDB = FMDatabase()
//        print("DirPath ",dirPaths)
//        
//        //let docsDir = dirPaths[0] as! NSString // String
//        var docsDir : NSString { return dirPaths[0] }
//        databasePath = docsDir.stringByAppendingPathComponent("ShoppingPad.db")
//        print("DatabasePath", databasePath)
//        
//        if !filemgr.fileExistsAtPath(databasePath as String)
//        {
//            
//            shoppingPadDB = FMDatabase(path: databasePath as String)
//            print("path ", shoppingPadDB)
//            //            if shoppingPadDB == nil
//            //            {
//            //              print("Error: \(shoppingPadDB.lastErrorMessage())")
//            //            }
//            
//            if shoppingPadDB.open() {
//                
//                dbStatus = true
//                
//                print("Created DB")
//             
//                shoppingPadDB.close()
//            }
//            else
//            {
//                print("Error: \(shoppingPadDB.lastErrorMessage())")
//                dbStatus = false
//                
//            }
//            
//        }
//        return shoppingPadDB
//    }
//}
//
