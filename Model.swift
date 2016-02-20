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

class Model : NSObject
    
{
    func createDatabase(nameOfTheDataBase: String  ) ->String
    {
        
//        let filemgr = NSFileManager.defaultManager()
//        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
//            .UserDomainMask, true)
//        let docsDir = dirPaths[0] as! NSString
//        let databasePath = docsDir.stringByAppendingPathComponent(
//            nameOfTheDataBase)
        
        let databasePath = "/Users/BridgeLabz/Documents/komal/IOS/SPTEST/ShoppingPad2/ShoppingPad.db"
        //if !filemgr.fileExistsAtPath(databasePath as String) {
        //  if !(databasePath as String) {

            let DB = FMDatabase(path: databasePath as String)
            print("path ", DB)
            if DB == nil {
                print("Error: \(DB.lastErrorMessage())")
                
          //  }
            
            
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
