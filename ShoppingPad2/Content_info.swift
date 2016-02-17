//
//  Content_info.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 17/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

//class Content_info: UIView {

  
class Content_info: UIViewController {
    var databasePath = NSString()
    var isDbCreated : Bool = Bool()
    var databasePath1 = FMDatabase()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let model : Model = Model()
        //      model.createDatabase()
        
        createContentTable()
        //setContentTitle()
        saveData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createContentTable()
    {
        let model : Model = Model()
        databasePath1 = model.createDatabase()
        if databasePath1.open()
        {
            
            let sql_stmt = "CREATE TABLE IF NOT EXISTS Content(ID INTEGER PRIMARY KEY AUTOINCREMENT, TITLE TEXT)"
            
            if !databasePath1.executeStatements(sql_stmt)
            {
                print("Error: \(databasePath1.lastErrorMessage())")
            }
            databasePath1.close()
        }
    }
    
    
//    func setContentTitle()
//    {
//        let model : Model = Model()
//        databasePath1 = model.createDatabase()
//        if databasePath1.open()
//        {
//            //let querySQL = "SELECT * FROM Content WHERE id = '\((name.text)!)'"
//            
//             let querySQL = "SELECT * FROM Content"
//            
//                        let results:FMResultSet? = databasePath1.executeQuery(querySQL,
//                            withArgumentsInArray: nil)
//            
//                        if results?.next() == true
//                        {
//                            let contentTitle : String =  (results?.stringForColumn("TITLE"))!
//                            print("Content Title", contentTitle)
//                        }
//                        else
//                        {
//                           print("No data match")
//                        }
//            databasePath1.close()
//        }
//
//        else
//        {
//                print("Error: \(databasePath1.lastErrorMessage())")
//        }
//    }
    
    
    
//    @IBAction func findContact(sender: AnyObject) {
//        
//        
//        let contactDB = FMDatabase(path: databasePath as String)
//        
//        if contactDB.open() {
//            let querySQL = "SELECT address, phone FROM CONTACTS WHERE name = '\((name.text)!)'"
//            
//            let results:FMResultSet? = contactDB.executeQuery(querySQL,
//                withArgumentsInArray: nil)
//            
//            if results?.next() == true {
//                let addressS : String =  (results?.stringForColumn("address"))!
//                let phoneS : String =  (results?.stringForColumn("phone"))!
//                address.text = addressS
//                phoneNo.text = phoneS
//                //address.text = results?.stringForColumn("address")
//                //phoneNo.text = results?.stringForColumn("phone")
//                status.text = "Record Found"
//            } else {
//                status.text = "Record not found"
//                address.text = ""
//                phoneNo.text = ""
//            }
//            contactDB.close()
//        } else {
//            print("Error: \(contactDB.lastErrorMessage())")
//        }
//    }
//
   
    
    
    
    
  //  @IBAction func saveData(sender: AnyObject) {
        
    func saveData()
        {
        let contactDB = FMDatabase(path : databasePath as String)
        
        
        if contactDB.open()
        {
           // print("NAme", (name.text)!)
            
            
           
            let insertQuery = "INSERT INTO Content(ID, TITLE) VALUES(1,'A')"
            let result = contactDB.executeUpdate(insertQuery, withArgumentsInArray: nil)
            if !result {
                //status.text = "Failed to add contact"
                print("Error: \(contactDB.lastErrorMessage())")
            } else {
                print("Added")
            }
        }
        else {
            print("Error: \(contactDB.lastErrorMessage())")
        }
        
    }
}

