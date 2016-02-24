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
    
   
    // For Database Path
    var databasePath = String()
    var path : String?
    var urlForImage : String?
    var testing : String?
    var nameArray : [AnyObject] = []
    var viewArray : [AnyObject] = []
    var statusArray : [AnyObject] = []
    var v_DateArray : [AnyObject] = []
    var holeArrayofParticipant : [AnyObject] = []
    var results = FMResultSet()
    var participantResult = FMResultSet()
    public func createTable() -> String
    {
        
        databasePath = Model().createDatabase("ShoppingPad2.db")
        path = databasePath
        print (path!)
        print("inside create table" , databasePath)
        let shoppingPad = FMDatabase(path: databasePath as String)
        print("path ", shoppingPad)
        
        if shoppingPad.open()
        {
            
            let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTENT (ID INTEGER PRIMARY KEY AUTOINCREMENT, TITLE TEXT, MEDIACOUNT INTEGER)"
            let sql_stmt1 = "CREATE TABLE IF NOT EXISTS PARTICIPANT (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME VARCHAR(50),VIEW INTEGER, STATUS VARCHAR(50), V_DATE DATETIME(10) NULL)"
            
            let sql_stmt2 = "CREATE TABLE IF NOT EXISTS IMAGEINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, TITLE TEXT, URL TEXT)"
            if !shoppingPad.executeStatements(sql_stmt)
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
            }
            
            if !shoppingPad.executeStatements(sql_stmt1)
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
            }
         
            if !shoppingPad.executeStatements(sql_stmt2)
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
            let myImage = UIImage(named: "7.jpg")
            let imageData: NSData = UIImagePNGRepresentation(myImage!)!
            let insertQuery1 = "INSERT INTO IMAGEINFO(TITLE,URL) VALUES('MyImage','\((imageData))')"
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
            let result1 = shoppingPad.executeUpdate(insertQuery1, withArgumentsInArray: nil)
            if !result1
            {
                status = true
                print("Error: \(shoppingPad.lastErrorMessage())")
                
            }
            else
            {
                print("Data save in ImageInfo")
            }
           shoppingPad.close()
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
             return results
            }
            else
            {
                print("No data match in Content table")
            }
          shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        
        return results
    }
    

   
//func getParticipantName(dataPath : String) -> FMResultSet
    func getParticipantName(dataPath : String) ->[AnyObject]{
    let shoppingPad = FMDatabase(path : dataPath)
    if shoppingPad.open()
    {
        let querySQL = "SELECT * FROM PARTICIPANT"
        results = shoppingPad.executeQuery(querySQL,
            withArgumentsInArray: nil)

        while (results.next())
          {
            
            if let nameString = results.stringForColumn("NAME")
            {
                
                nameArray.append(nameString)
            }
            if let viewString = results.stringForColumn("VIEW")
            {
                
                viewArray.append(viewString)
            }
            if let statusString = results.stringForColumn("STATUS")
            {
                
                statusArray.append(statusString)
            }
            if let v_DateString = results.stringForColumn("V_DATE")
            {
                
                v_DateArray.append(v_DateString)
            }

         }
        holeArrayofParticipant.append(nameArray)
        holeArrayofParticipant.append(viewArray)
        holeArrayofParticipant.append(statusArray)
        holeArrayofParticipant.append(v_DateArray)

        print("Hole Array",holeArrayofParticipant)
       shoppingPad.close()
    }
    else
    {
        print("Error: \(shoppingPad.lastErrorMessage())")
     }
  return holeArrayofParticipant
}
    
    var data = NSData()
    func getImageUrl(dataPath : String) ->FMResultSet    {
        let shoppingPad = FMDatabase(path : dataPath)
        
        if shoppingPad.open()
        {
            let querySQL = "SELECT * FROM IMAGEINFO"
            
            results = shoppingPad.executeQuery(querySQL,
                withArgumentsInArray: nil)
            if results.next() == true
            {
                urlForImage = (results.stringForColumn("URL"))!
                data = urlForImage!.dataUsingEncoding(NSUTF8StringEncoding)!
               
            }
            else
            {
                print("No data match in IMAGEINFO table")
            }
            results.close()
            shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        
        return results
         }
 

}

