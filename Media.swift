//
//  Media.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 26/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class Media
{

    var databasePath = String()
    var path : String?
    public func create() -> String
    {
        databasePath = Model().createDatabase("ShoppingPad.sqlite")
        path = databasePath
        print (path!)
        print("inside create table" , databasePath)
        let shoppingPad = FMDatabase(path: databasePath as String)
        print("path ", shoppingPad)
        
        if shoppingPad.open()
        {
           let createMediaTable = "CREATE TABLE IF NOT EXISTS Media (id INT(10) NOT NULL,title VARCHAR(45) NULL,URL VARCHAR(45) NULL,created_at DATETIME(10) NULL,modified_at DATETIME(10) NULL,content_id INT(10) NOT NULL,type VARCHAR(45) NULL,description VARCHAR(200) NULL,PRIMARY KEY (id))"
            
            if !shoppingPad.executeStatements(createMediaTable)
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
            }
            else
            {
                print("Media TABLE Created")
            }
            
            shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        return databasePath
    }
    
    func insert(dataPath : String)
    {
        let shoppingPad = FMDatabase(path : dataPath)
        if shoppingPad.open()
        {
            let insertQuery = "INSERT INTO Media(ID,TITLE,content_id) VALUES(1,'Content_media',1)"
            let result = shoppingPad.executeUpdate(insertQuery, withArgumentsInArray: nil)
            if !result
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
                
            }
            else
            {
                print("Inserted in Media Table")
            }
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
            let deleteQuery = " delete  FROM Media where Id = 1"
            let result = shoppingPad.executeUpdate(deleteQuery, withArgumentsInArray: nil)
            if !result
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
                
            }
            else
            {
                print("Deleted from Media Table")
            }
            shoppingPad.close()
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        
    }

    
    
    
   
}
