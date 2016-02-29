//
//  ContentService.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 29/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ContentService : NSObject
{
    override init()
    {
        print("You are in Service")
    }

    
    
    func restCall()
    {
        
        
        let postEndpoint: String =  "http://52.90.50.117:3004/user/get"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: postEndpoint)!
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            do {
                if let userString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                    // Print what we got from the call
                let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
                    // Update the label
                    self.performSelectorOnMainThread("getDataFormREST:", withObject: jsonDictionary, waitUntilDone: false)
                    
                }
            } catch {
                print("bad things happened")
            }
        }).resume()
        
    }
    func getDataFormREST(resultArray: NSArray)
    {
        //        let resultDictionary = resultArray[(searchDetails)!-1] as! NSDictionary
        let resultDictionary = resultArray[0] as! NSDictionary
        let fullNameDictionary = resultDictionary["name"] as! NSDictionary
        let fullname = fullNameDictionary["fullname"] as! String
        
        let id = resultDictionary["id"] as! String
        let OTP = resultDictionary["OTP"] as! Int
        let isActive = resultDictionary["isActive"] as! Int
        let createdAt = resultDictionary["createdAt"] as! String
        let deviceId = resultDictionary["device_id"] as! Int
        let updatedAt = resultDictionary["updatedAt"] as! String
        let profilePic = resultDictionary["profilePic"] as! String
               //        self.deviceId.text = String(format : "%d",deviceId)
        //        self.name.text = fullname
        
       print("ID\'\(id)\' fullname \(fullname)'OTP\(OTP)\' isActive '\(isActive)\' createdAt '\(createdAt)\'")
    }
    

    
}
