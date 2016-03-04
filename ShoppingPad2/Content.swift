//
//  Content_info.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 17/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

public class Content : Model
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
    var contentInfo = FMResultSet()
    var participantResult = FMResultSet()
    
// FOr ContentINFO
    var contentid : Int?
    var modified_at : String?
    var created_at : String?
    var syncDateTime: String?
    var decription :String?
    var contentLink : String?
    var imagesLink :String?
    var display_name : String?
    var url : String?
    var title : Int?
    var contentType : String?
    var isInserted : Bool?
    var contentArray = [AnyObject]()
    
    
// For UserContnetView
    
    var userContentId : Int?
    var userAdminId : Int?
    var contetId : Int?
    var userId : Int?
    var firstName : String?
    var lastName : String?
    var email : String?
    var displayProfile : String?
    var lastViewedDateTime: String?
    var numberOfViews : Int?
    var mobile : String?
    var userContentArray = [AnyObject]()

    
    public func getDBPath() -> String
    {
        let model = Model()
        databasePath = model.createDatabase("ShoppingPad.sqlite")
        return databasePath
    }
    
    
    
    
    public func create() -> String
    {
        let model = Model()
        databasePath = model.createDatabase("ShoppingPad.sqlite")
        path = databasePath
        print (path!)
        let shoppingPad = FMDatabase(path: databasePath as String)

 // If database is open create table
        if shoppingPad.open()
        {

            let createContentTable = "CREATE TABLE IF NOT EXISTS Content (id INT(10) NOT NULL,title VARCHAR(45)NULL,description VARCHAR NULL,type VARCHAR(45) NULL,background_image_path VARCHAR(50) NULL,owner_id INT(10) NULL,created_at DATETIME(10) NULL,modified_at DATETIME(10) NULL,participant_count INT(10) NULL,content_log_id INT(10) NOT NULL,PRIMARY KEY (id))"
            
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
   
    
    
// Insert Into Content Table with JSOn values
   
    func setContentInfo(dataPath : String, jsonObject : NSArray) -> Bool
    {
        let shoppingPad = FMDatabase(path : dataPath)
        let resultDictionary = jsonObject[0] as! NSDictionary
        
        contentid = resultDictionary["content_id"] as? Int
        modified_at = resultDictionary["modified_at"] as? String
        created_at = resultDictionary["created_at"] as? String
        syncDateTime = resultDictionary["syncDateTime"] as? String
        decription = resultDictionary["decription"] as? String
        contentLink = resultDictionary["contentLink"] as? String
        imagesLink = resultDictionary["imagesLink"] as? String
        display_name = resultDictionary["display_name"] as? String
        url = resultDictionary["url"] as? String
        title = resultDictionary["title"] as? Int
        contentType = resultDictionary["contentType"] as? String

        contentArray.append(contentid!)
        contentArray.append(contentType!)
        contentArray.append(title!)
        contentArray.append(decription!)
        contentArray.append(display_name!)
        contentArray.append(url!)
        contentArray.append(imagesLink!)
        contentArray.append(contentLink!)
        contentArray.append(syncDateTime!)
        contentArray.append(created_at!)
        contentArray.append(modified_at!)

        if shoppingPad.open()
        {
    
            let insertQuery = "INSERT INTO CONTENTS VALUES(?,?,?,?,?,?,?,?,?,?,?)"
            
            let result = shoppingPad.executeUpdate(insertQuery, withArgumentsInArray: contentArray)
            
            if !result
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
                isInserted = false
            }
            else
            {
                print("Inserted in Contents Table : Successfull")
                isInserted = true
            }
        shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
    return isInserted!
    }

    
    
    
    
    func getContentInfo(dataPath : String, tableName : String) -> FMResultSet
    {
        let shoppingPad = FMDatabase(path : dataPath)
        
        if shoppingPad.open()
        {
            let querySQL = "SELECT * FROM \(tableName)"
            
            contentInfo = shoppingPad.executeQuery(querySQL,
                withArgumentsInArray: nil)
            if contentInfo.next() == true
            {
                return contentInfo
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
        
        return contentInfo
    }
    
    
    
    
    
    func setUserContentView(dataPath : String, jsonObject : NSArray) -> Bool
    {
        let shoppingPad = FMDatabase(path : dataPath)
        let resultDictionary = jsonObject[0] as! NSDictionary
        
        userContentId = resultDictionary["userContentId"] as? Int
        userAdminId = resultDictionary["userAdminId"] as? Int
        contetId = resultDictionary["content_id"] as? Int
        userId = resultDictionary["userId"] as? Int
        firstName = resultDictionary["firstName"] as? String
        lastName = resultDictionary["lastName"] as? String
        email = resultDictionary["email"] as? String
        displayProfile = resultDictionary["displayProfile"] as? String
        lastViewedDateTime = resultDictionary["lastViewedDateTime"] as? String
        numberOfViews = resultDictionary["numberOfViews"] as? Int
        mobile = resultDictionary["mobile"] as? String
        
        userContentArray.append(userContentId!)
        userContentArray.append(userAdminId!)
        userContentArray.append(contetId!)
        userContentArray.append(userId!)
        userContentArray.append(firstName!)
        userContentArray.append(lastName!)
        userContentArray.append(email!)
        userContentArray.append(displayProfile!)
        userContentArray.append(lastViewedDateTime!)
        userContentArray.append(numberOfViews!)
        userContentArray.append(mobile!)
        
        if shoppingPad.open()
        {
            let insertQuery = "INSERT INTO UserContentView VALUES(?,?,?,?,?,?,?,?,?,?,?)"
            
            let result = shoppingPad.executeUpdate(insertQuery, withArgumentsInArray: userContentArray)
            
            if !result
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
                isInserted = false
            }
            else
            {
                print("Inserted in UserContnet Table : Successfull")
                isInserted = true
            }

        shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
            isInserted = true
        }
        return isInserted!
    }
    
    
    
    func getUserContent(dataPath : String, tableName : String) -> FMResultSet
    {
        let shoppingPad = FMDatabase(path : dataPath)
        
        if shoppingPad.open()
        {
            let querySQL = "SELECT * FROM \(tableName)"
            
            contentInfo = shoppingPad.executeQuery(querySQL,
                withArgumentsInArray: nil)
            if contentInfo.next() == true
            {
                return contentInfo
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
        
        return contentInfo
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




