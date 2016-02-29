//
//  UserRestCall.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 28/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class UserRestCall: UIViewController {
    
    
    @IBOutlet weak var id: UILabel!

    @IBOutlet weak var OTP: UILabel!
    @IBOutlet weak var isActive: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var deviceId: UILabel!
    @IBOutlet weak var logitude: UILabel!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var updatedAt: UILabel!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    

    
    @IBAction func show(sender: AnyObject)
    {
        restCall()
    }
      @IBAction func post(sender: AnyObject)
    {
        postDataToURL()
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
                    print("user string",userString)
                    
                    
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
        print("profile pic",profilePic)
        let decodedData = NSData(base64EncodedString: profilePic, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
      
        self.id.text = id
        self.isActive.text = String(format : "%d",isActive)
        self.createdAt.text = createdAt
        self.updatedAt.text = updatedAt
        self.OTP.text =  String(format : "%d",OTP)
        self.deviceId.text = String(format : "%d",deviceId)
        self.name.text = fullname
//        self.profilePic.image = UIImage(data: decodedData!)

        
    }
    
    func postDataToURL()
    {
        
        // Setup the session to make REST POST call
        let postEndpoint: String = "http://www.posttestserver.com/post.php"
//        let postEndpoint: String = "https://grokswift.com/simple-rest-with-swift/"
//        let postEndpoint: String = "http://hmkcode.appspot.com/post-json/index.html"
        let url = NSURL(string: postEndpoint)!
        print("URL",url)
        let session = NSURLSession.sharedSession()

        let postParams : NSDictionary = ["name":"A","country": "B","twitter":"@D"]
        print("Dictionary",postParams)
        
//       let postParams = "[{\"name\":\"Hello\",\"country\":\"Hello\",\"twitter\":\"Hello\"}]"

//        let postParams: NSDictionary = ["title": "Frist Psot", "body": "I iz fisrt", "userId": 1]
        // Create the request
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(postParams, options: NSJSONWritingOptions())
            print(postParams)
        } catch {
            print("bad things happened")
        }
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithRequest(request, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            if let postString = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
                // Print what we got from the call
                print("POST: " + postString)
                self.performSelectorOnMainThread("updatePostLabel:", withObject: postString, waitUntilDone: false)
            }
            
        }).resume()
        

        
//        let JSONObject: [String : AnyObject] = [
//            "name" :"A",
//            "address" : "A",
//            "phone": "A"
//        ]
//        
//        if NSJSONSerialization.isValidJSONObject(JSONObject)
//        {
//            var request: NSMutableURLRequest = NSMutableURLRequest()
//            let url = "http://tendinsights.com/user"
//            
//            var err: NSError?
//            
//            request.URL = NSURL(string: url)
//            request.HTTPMethod = "POST"
//            request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//                    do
//                    {
//                        request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(JSONObject, options: NSJSONWritingOptions())
//                        print(JSONObject)
//                    } catch
//                    {
//                        print("bad things happened")
//                    }
//            
//            
//            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) {(response, data, error) -> Void in
//                if error != nil
//                {
//                    
//                    print("error")
//                    
//                } else
//                {
//                    
//                    print(response) 
//                    
//                }
//            
//        
//            }
//        }
    }
    //
    func updatePostLabel(text: String)
    {
        print("TEXT0",text)
        self.postLabel.text = "POST : " + text
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

