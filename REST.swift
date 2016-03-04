//
//  REST.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 01/03/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import Foundation

var infoObject = [AnyObject]()
var testArray = NSArray()

class REST : NSObject
{
    func get()
    {
        let postEndpoint: String =  "http://52.90.50.117:3046/api/v1/content_info"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: postEndpoint)!
        var contentJsonArray : NSArray?

    // Make the POST call and handle it in a completion handler
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else
            {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            do
            {
                if let contentString = NSString(data:data!, encoding: NSUTF8StringEncoding)
                {
                    // Print what we got from the call
                    print("Inside Response")
                    contentJsonArray = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSArray
                    
                    print("jsonArray here", contentJsonArray)
                    Content_Info_VC().getJasonResult(contentJsonArray!)
                    // Update the label
//                    dispatch_async(dispatch_get_main_queue())
//                        { () -> Void in
//                        self.getDataFormREST(jsonArray!)
//                        }
                    
                }
            }
                
            catch
            {
                print("bad things happened")
            }

        }).resume()
    

    }

    func getDataFormREST(resultArray: NSArray) //-> NSArray
    {
        //        let resultDictionary = resultArray[(searchDetails)!-1] as! NSDictionary
        testArray = resultArray
        print("TESTArray ON ",testArray)
//        return testArray
//        let resultDictionary = resultArray[0] as! NSDictionary
//
////        let fullNameDictionary = resultDictionary["name"] as! NSDictionary
////        let fullname = fullNameDictionary["fullname"] as! String
//        
//        let content_id = resultDictionary["content_id"] as! Int
//        let modified_at = resultDictionary["modified_at"] as! String
//        let created_at = resultDictionary["created_at"] as! String
//        let syncDateTime = resultDictionary["syncDateTime"] as! String
//        let decription = resultDictionary["decription"] as! String
//        let contentLink = resultDictionary["contentLink"] as! String
//        let imagesLink = resultDictionary["imagesLink"] as! String
//        let display_name = resultDictionary["display_name"] as! String
//        let url = resultDictionary["url"] as! String
//        let title = resultDictionary["title"] as! Int
//        let contentType = resultDictionary["contentType"] as! String
//        infoObject.append(content_id)
//        infoObject.append(modified_at)
//        infoObject.append(syncDateTime)
//        infoObject.append(decription)
//        infoObject.append(contentLink)
//        infoObject.append(display_name)
//        infoObject.append(title)
//        print("INFO",infoObject)
        
//=======

    }
    
    
    var jsonDict : NSArray?
    
    func getData(url: NSURL, completion: (data: NSData)->()) {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url) { (data, response, error) in

            if error == nil {
                completion(data: data!)
            }
        }
        task.resume()
    }
    func apiHandler() -> NSArray
    {
        getData(NSURL(string: "http://52.90.50.117:3046/api/v1/content_info")!) { (data) in
            do {
                if let jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSArray
                {
                    print("A",jsonDict)
                }
            }
            catch let error as NSError
            {
                print("API error: \(error.debugDescription)")
            }
        }
        return jsonDict!
    }
    

}
