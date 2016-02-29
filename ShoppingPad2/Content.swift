//
//  Content_info.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 17/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

public class Content//: UIView
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
    
    var imageArray : [AnyObject] = []
    var results = FMResultSet()
    var participantResult = FMResultSet()
    

    
    
    public func create() -> String
    {
        let model = Model()
        databasePath = model.createDatabase("ShoppingPad.sqlite")
        path = databasePath
        print (path!)
        let shoppingPad = FMDatabase(path: databasePath as String)
        print("path ", shoppingPad)
 // If database is open create table
        if shoppingPad.open()
        {
          

            let createContentTable = "CREATE TABLE IF NOT EXISTS Content (id INT(10) NOT NULL,title VARCHAR(45)NULL,description VARCHAR(200) NULL,type VARCHAR(45) NULL,background_image_path VARCHAR(50) NULL,owner_id INT(10) NULL,created_at DATETIME(10) NULL,modified_at DATETIME(10) NULL,participant_count INT(10) NULL,content_log_id INT(10) NOT NULL,PRIMARY KEY (id))"
            
            let createContent_LogTable = "CREATE TABLE IF NOT EXISTS Content_log (id INT(10) NOT NULL,content_id TINYINT(4) NULL,action_id TINYINT(4) NULL,created_at DATETIME(10) NULL,action_value VARCHAR(45) NULL,PRIMARY KEY (id))"
            

            let sql_stmt1 = "CREATE TABLE IF NOT EXISTS PARTICIPANT (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME VARCHAR(50),VIEW INTEGER, STATUS VARCHAR(50), V_DATE DATETIME(10) NULL)"
            
            let sql_stmt2 = "CREATE TABLE IF NOT EXISTS IMAGEINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, TITLE TEXT, URL TEXT)"
            
            if !shoppingPad.executeStatements(createContentTable)
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
            }
            if !shoppingPad.executeStatements(createContent_LogTable)
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
    
    
    func createTable(name : String)
    {
        let model = Model()
        databasePath = model.createDatabase("ShoppingPad.sqlite")
        
        let shoppingPad = FMDatabase(path: databasePath as String)
        if(shoppingPad.open())
        {
            if(shoppingPad.tableExists(name))
            {
                print("table Exist Named :",(name))
            }
            else
            {
            let createContentTable = "CREATE TABLE \(name) (contentId INT(10) NOT NULL,contentType VARCHAR(45)NULL,title VARCHAR(200) NULL,display_name VARCHAR(45) NULL,description VARCHAR(50) NULL,conetntTags VARCHAR(10) NULL,imageLink VARCHAR(50), contentLink VARCHAR(50), syncDateTime VARCHAR(50))"
                
                
                if !shoppingPad.executeStatements(createContentTable)
                {
                    print("Error: \(shoppingPad.lastErrorMessage())")
                }
        
            }
            
                shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
 
        }
    }
    
    
    func isEmptyTable(name:String)->Bool
    {
        let model = Model()
        databasePath = model.createDatabase("ShoppingPad.sqlite")
        
        let shoppingPad = FMDatabase(path: databasePath as String)
        var isEmpty = Bool()
        if(shoppingPad.open())
        {
        let checkEmpty = shoppingPad.executeQuery("SELECT COUNT(*) FROM Contents", withArgumentsInArray: [])
            if checkEmpty.next() {
                let count = checkEmpty.intForColumnIndex(0)
                if count > 0
                {
                    isEmpty = false
                } else
                {
                    isEmpty = true
                }
            } else
            {
                print("Database error")
            }
            
            shoppingPad.close()
        }
        return isEmpty
    }
    
    
//Insert Data in DB the data
    func insert(dataPath : String)
    {
        let shoppingPad = FMDatabase(path : dataPath)
        print ("datapath User ",dataPath)
        
        var data = NSData()
        let testImage = UIImage(named: "4.jpg")
        data = UIImagePNGRepresentation(testImage!)!
        let dataStr = data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)

        if shoppingPad.open()
        {
            let insertQuery = "INSERT INTO CONTENT(ID,TITLE,content_log_id, background_image_path) VALUES(2,'Bed',2,'/Users/BridgeLabz/Documents/komal/IOS/SPTEST/ShoppingPad2/1.jpg')"
            let myImage = UIImage(named: "7.jpg")
            let imageData: NSData = UIImagePNGRepresentation(myImage!)!
            let insertQuery1 = "INSERT INTO IMAGEINFO(TITLE,URL) VALUES('MyImage4','\((dataStr))')"
            let result = shoppingPad.executeUpdate(insertQuery, withArgumentsInArray: nil)
         
            if !result
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
                
            }
            else
            {
             print("Inserted in Content Table")
            }
//            let result1 = shoppingPad.executeUpdate(insertQuery1, withArgumentsInArray: nil)
//            if !result1
//            {
//                status = true
//                print("Error: \(shoppingPad.lastErrorMessage())")
//                
//            }
//            else
//            {
//                print("Data save in ImageInfo")
//            }
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
            let deleteQuery = " delete  FROM Content where Id = 2"
            let result = shoppingPad.executeUpdate(deleteQuery, withArgumentsInArray: nil)
            if !result
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
                
            }
            else
            {
                print("Deleted from Content Table")
            }
            shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        
    }

    
    
    
    
    func getContent(dataPath : String) -> FMResultSet
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
        print("Check close status", shoppingPad.close())
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        
        return results
    }

func getParticipantName(dataPath : String) ->[AnyObject]
{
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

    //   shoppingPad.close()
        }
      else
      {
        print("Error: \(shoppingPad.lastErrorMessage())")
       }
    return holeArrayofParticipant
    }
    
    
    
    func getImageInfo(dataPath : String) -> [AnyObject]
    {
        let shoppingPad = FMDatabase(path : dataPath)
        var imageDataString = String()
        if shoppingPad.open()
        {
            let querySQL = "SELECT * FROM IMAGEINFO"
            
            results = shoppingPad.executeQuery(querySQL,
                withArgumentsInArray: nil)
            while(results.next())
            {
                imageDataString = (results.stringForColumn("URL"))!
                
                //convert NSString back to NSdata
                let decodedData = NSData(base64EncodedString: imageDataString, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
                
                //convert NSdata back to the image
                let decodedimage = UIImage(data: decodedData!)
                imageArray.append(decodedimage!)
                print("imageArray",imageArray)
            }

            shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        
        return imageArray
    }


}




