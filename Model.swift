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

class Model
    
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
