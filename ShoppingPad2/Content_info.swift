//
//  Content_info.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 17/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

public class Content_info: UIViewController
{
    
    @IBOutlet weak var contentTittleLable: UILabel!
    
    var mediaCount : String?
    var particpantName : String?
    var participantView : String?
    // For Database Path
    var databasePath = String()
    var path : String?
    public func createTable() -> String
    {
        
        databasePath = Model().createDatabase("ShoppingPad.db")
        path = databasePath
        print (path!)
        print("inside create table" , databasePath)
        let shoppingPad = FMDatabase(path: databasePath as String)
        print("path ", shoppingPad)
        
        if shoppingPad.open()
        {
            
            let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTENT (ID INTEGER PRIMARY KEY AUTOINCREMENT, TITLE TEXT, MEDIACOUNT INTEGER)"
            let sql_stmt1 = "CREATE TABLE IF NOT EXISTS PARTICIPANT (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, VIEW INTEGER)"
            if !shoppingPad.executeStatements(sql_stmt)
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
            }
            
            if !shoppingPad.executeStatements(sql_stmt1)
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
            }
            shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        return databasePath
    }
    
    //Insert Data in DB the data
    func insertDataInTable(dataPath : String) {
        //databasePath = Model().createDatabase("ShoppingPad.db")
        let shoppingPad = FMDatabase(path : dataPath)
     
        var status = Bool()
        print ("datapath User ",dataPath)
        if shoppingPad.open()
        {
            
            let insertQuery = "INSERT INTO CONTENT(TITLE,MEDIACOUNT) VALUES('pqr',922)"
           // let insertQuery1 = "INSERT INTO PARTICIPANT(NAME,VIEW) VALUES('KOMAL',20)"
            let result = shoppingPad.executeUpdate(insertQuery, withArgumentsInArray: nil)
           // let result1 = shoppingPad.executeUpdate(insertQuery1, withArgumentsInArray: nil)
            
            if !result
            {
                status = true
                print("Error: \(shoppingPad.lastErrorMessage())")
                
            }
            else
            {
                status = false
            }
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        print("value of bool = ",status)
        
    }
    
    
    
    
    func setContentTableValue(dataPath : String)
    {
        let shoppingPad = FMDatabase(path : dataPath)
        
        if shoppingPad.open()
        {
            //let querySQL = "SELECT * FROM Content WHERE id = '\((name.text)!)'"
            
            let querySQL = "SELECT * FROM Content"
            
            let results:FMResultSet? = shoppingPad.executeQuery(querySQL,
                withArgumentsInArray: nil)
            
            if results?.next() == true
            {
                let contentTitle : String =  (results?.stringForColumn("TITLE"))!
                print("CONTENT table ", results?.stringForColumn("TITLE"))
                let dbMediaCount : String =  (results?.stringForColumn("MEDIACOUNT"))!
                print("Content Title", contentTitle)
                //Content_Info_VC().contentTitleLable.text = "R"
                 Content_Info_VC().contentTitle = contentTitle
                mediaCount = dbMediaCount
            }
            else
            {
                print("No data match")
            }
            
            
            // FETCHING DATA FROM PARTICIPANT TABLE
            
            let querySQL1 = "SELECT * FROM PARTICIPANT"
            
            let results1:FMResultSet? = shoppingPad.executeQuery(querySQL1,
                withArgumentsInArray: nil)
            print("Participant table data", results1)
            
            if let rs = shoppingPad.executeQuery("select * from PARTICIPANT", withArgumentsInArray: nil)
            {
                while rs.next()
                {
                    let participant_name = rs.objectForColumnName("NAME") as! String
                    let participant_view = rs.objectForColumnName("VIEW") as! Int
                    let participantView_s = String(participant_view)
                    print("A", participant_name)
                    particpantName = participant_name
                    participantView = participantView_s
                    
                }
                
            }
            
            print("RESULTSETT",results1?.stringForColumn("NAME"))
            shoppingPad.close()
            
            
        }
            
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
    }
    
    

   
//    var databasePath = String()
//    var path : String?
//    override func viewDidLoad()
//        {
//        
//            super.viewDidLoad()
//        
//            createTable()
//            //insertDataInTable(databasePath)
//            setContentTitle(databasePath)
//            // contentTittleLable.text = "S"
//
//        }
//  
//    
//    //create table
//    func createTable() -> String
//        {
//        
//        databasePath = Model().createDatabase("ShoppingPad.db")
//        path = databasePath
//        print (path!)
//        print("inside create table" , databasePath)
//        let shoppingPad = FMDatabase(path: databasePath as String)
//        print("path ", shoppingPad)
//        
//        if shoppingPad.open() {
//            
//            let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTENT (ID INTEGER PRIMARY KEY AUTOINCREMENT, TITLE TEXT)"
//            if !shoppingPad.executeStatements(sql_stmt) {
//                print("Error: \(shoppingPad.lastErrorMessage())")
//            }
//            shoppingPad.close()
//        } else {
//            print("Error: \(shoppingPad.lastErrorMessage())")
//        }
//        return databasePath
//    }
//    
//    //Insert Data in DB the data
//    func insertDataInTable(dataPath : String) {
//        
//        
//        print("enter into save data")
//        let shoppingPad = FMDatabase(path : dataPath)
//        var status = Bool()
//        print ("datapath User ", dataPath )
//        if shoppingPad.open()
//        {
//            
//            let insertQuery = "INSERT INTO CONTENT(ID,TITLE) VALUES(1,'A')"
//            
//            let result = shoppingPad.executeUpdate(insertQuery, withArgumentsInArray: nil)
//            if !result {
//                status = true
//                print("Error: \(shoppingPad.lastErrorMessage())")
//               
//            } else {
//                status = false
//                            }
//        }
//        else {
//            print("Error: \(shoppingPad.lastErrorMessage())")
//        }
//        print("value of bool = ",status)
//        
//    }
//    
//    
//    func setContentTitle(dataPath : String)
//    {
//        let shoppingPad = FMDatabase(path : dataPath)
//     
//        if shoppingPad.open()
//        {
//            //let querySQL = "SELECT * FROM Content WHERE id = '\((name.text)!)'"
//
//             let querySQL = "SELECT * FROM Content"
//
//                        let results:FMResultSet? = shoppingPad.executeQuery(querySQL,
//                            withArgumentsInArray: nil)
//            
//                        if results?.next() == true
//                        {
//                            let contentTitle : String =  (results?.stringForColumn("TITLE"))!
//                            print("Content Title", contentTitle)
//                            contentTittleLable.text = contentTitle
//                        }
//                        else
//                        {
//                           print("No data match")
//                        }
//            shoppingPad.close()
//        }
//
//        else
//        {
//                print("Error: \(shoppingPad.lastErrorMessage())")
//        }
//    }
//
//
//


}



