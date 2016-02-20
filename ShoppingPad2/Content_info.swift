//
//  Content_info.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 17/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

public class Content_info//: UIView
{

    
    @IBOutlet weak var contentTittleLable: UILabel!
    
    var mediaCount : String?
    var particpantName : String?
    var participantView : String?
    var contentTitle = String?()
    // For Database Path
    var databasePath = String()
    var path : String?
    
    var results = FMResultSet()
    var participantResult = FMResultSet()
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
    func insertDataInTable(dataPath : String)
    {
       
        let shoppingPad = FMDatabase(path : dataPath)
     
        var status = Bool()
        print ("datapath User ",dataPath)
        if shoppingPad.open()
        {
            let insertQuery = "INSERT INTO CONTENT(TITLE,MEDIACOUNT) VALUES('pqr',922)"
            let result = shoppingPad.executeUpdate(insertQuery, withArgumentsInArray: nil)
         
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
    
    func getContentTableValue(dataPath : String) -> FMResultSet
    {
        let shoppingPad = FMDatabase(path : dataPath)
        
        if shoppingPad.open()
        {
            let querySQL = "SELECT * FROM Content"

            results = shoppingPad.executeQuery(querySQL,
                withArgumentsInArray: nil)
            if results.next() == true
            {
                contentTitle = (results.stringForColumn("TITLE"))!
                print("CONTENT table ", results.stringForColumn("TITLE"))
                let dbMediaCount : String =  (results.stringForColumn("MEDIACOUNT"))!
                print("Content Title", contentTitle)
                mediaCount = dbMediaCount
            }
            else
            {
                print("No data match in Content table")
            }
            
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        
        return results
    }
    
 func getParticipantName(dataPath : String) ->FMResultSet
 {
    let shoppingPad = FMDatabase(path : dataPath)
    
    if shoppingPad.open()
    {
        let querySQL = "SELECT * FROM PARTICIPANT"
        
        results = shoppingPad.executeQuery(querySQL,
            withArgumentsInArray: nil)
        if results.next() == true
        {
            particpantName = (results.stringForColumn("NAME"))!
            print("PARTICIPANT table ", results.stringForColumn("NAME"))
//            let dbMediaCount : String =  (results.stringForColumn("MEDIACOUNT"))!
//            print("Content Title", contentTitle)
//            mediaCount = dbMediaCount
        }
        else
        {
            print("No data match in Participant table")
        }
        
    }
    else
    {
        print("Error: \(shoppingPad.lastErrorMessage())")
    }
    
    return results
   

}

}

