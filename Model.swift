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
    //override func viewDidLoad() {
    // super.viewDidLoad()
    
    func createDatabase() -> FMDatabase
    {
        var dbStatus : Bool = Bool()
        var databasePath = NSString()
        let filemgr = NSFileManager.defaultManager()
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        var shoppingPadDB = FMDatabase()
        
        //var shoppingPadDB = FMDatabase()
        print("DirPath ",dirPaths)
        
        //let docsDir = dirPaths[0] as! NSString // String
        var docsDir : NSString { return dirPaths[0] }
        databasePath = docsDir.stringByAppendingPathComponent("ShoppingPad.db")
        print("DatabasePath", databasePath)
        
        if !filemgr.fileExistsAtPath(databasePath as String)
        {
            
            shoppingPadDB = FMDatabase(path: databasePath as String)
            print("path ", shoppingPadDB)
            //            if shoppingPadDB == nil
            //            {
            //              print("Error: \(shoppingPadDB.lastErrorMessage())")
            //            }
            
            if shoppingPadDB.open() {
                
                dbStatus = true
                
                print("Created DB")
                //                let sql_stmt = "CREATE TABLE IF NOT EXISTS home1 (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)"
                
                //           if !shoppingPadDB.executeStatements(sql_stmt)
                //           {
                //            print("Error: \(shoppingPadDB.lastErrorMessage())")
                //           }
                shoppingPadDB.close()
            }
            else
            {
                print("Error: \(shoppingPadDB.lastErrorMessage())")
                dbStatus = false
                
            }
            
        }
        return shoppingPadDB
    }
}

