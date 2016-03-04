//
//  Content-Info-VC.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 03/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//
// Now this is chnages for git


import UIKit
import MessageUI

class Content_Info_VC: UIViewController, UITableViewDataSource,UITableViewDelegate,MFMessageComposeViewControllerDelegate
    {

    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var participantTable: UITableView!
    @IBOutlet weak var contentTitleImageView: UIImageView!
    @IBOutlet weak var contentTitleLable: UILabel!
    
    let customeCellObjct: CustomCell = CustomCell()
    let content: Content = Content()
    let user : User = User()
    let media : Media = Media()
    
    var someArray = [String]()
    var mediaCount : String?
    var contentTitle : String?
    var contentImageName : String?
    var particpantName : [AnyObject] = []
    var participantView :[AnyObject] = []
    var participantStatus :[AnyObject] = []
    var participantDate : [AnyObject] = []
    var participant : [AnyObject] = []

    var resultImageArray : [AnyObject] = []
    
    
    var p_name : String?
    var p_lastOpen : String?
    var p_viewCount : String?
    
    
    var urlOfImage : NSData?
    var testing : String?
    var partStringArray : [String] = []
// For Database Path
    var databasePath = String()
    var databasePath1 = "/Users/BridgeLabz/Documents/komal/IOS/SPTEST/ShoppingPad2/ShoppingPad2/ShoppingPad.sqlite"
    var content_info = "http://52.90.50.117:3046/api/v1/content_info"
    var user_content_view = "http://52.90.50.117:3046/api/v1/user_content_view"
    var databasePath2 = String()
   
    var path : String?
    var data: NSData? = nil
    var imageData : NSData?
    var imageDataString : String?
    var resultsOfContent = FMResultSet()
    var resultOfParticipant = FMResultSet()
    var resultOfImageInfo = FMResultSet()
    var testdB = FMDatabase()
    
    var contentInfo = FMResultSet()
    var userContent = FMResultSet()
    
    var isContentTableEmpty = Bool()
    var isUserContentViewEmpty = Bool()
    var valueInserted = Bool()
    var contentJsonArray : NSArray?
    var userContentJsonArray : NSArray?
    var dbInuse = Bool()

// get Json form REST
    func getJasonResultContent(resultJson : NSArray)
    {
        contentJsonArray = resultJson
        valueInserted = content.setContentInfo("/Users/BridgeLabz/Documents/komal/IOS/SPTEST/ShoppingPad2/ShoppingPad2/ShoppingPad.sqlite", jsonObject: contentJsonArray!)
    }
    
    func getJasonResultUserContent(resultJson : NSArray)
    {
        userContentJsonArray = resultJson
        valueInserted = content.setUserContentView("/Users/BridgeLabz/Documents/komal/IOS/SPTEST/ShoppingPad2/ShoppingPad2/ShoppingPad.sqlite", jsonObject: userContentJsonArray!)
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        customeCellObjct.createRoundImage(contentTitleImageView)
        
// Database Creation
// Create All Table
//        databasePath = content.create()

//        databasePath1 = user.create()
//        databasePath2 = media.create()
        content.createTable("Contents")
        content.createTable("UserContentView")
        content.createTable("UserContentViewDetails")
        isContentTableEmpty = content.isEmptyTable("Contents")
// --** UNCOMMENT FOR CONTENT INFO
        if(isContentTableEmpty)
        {
            // Call Service
            let service : ContentService = ContentService()
            service.get(content_info)
            
        }
        
        else
        {
            contentInfo = content.getContentInfo(databasePath1,tableName : "Contents")
            print("COntentInfoHERE",contentInfo)
            contentTitle = (contentInfo.stringForColumn("display_name"))!
            contentTitleLable.text = contentTitle
            let testURL = (contentInfo.stringForColumn("imageLink"))!
            let url = NSURL(string: testURL)
            print("URL",testURL)
         
        }
//
        
 // Check UserCOntentView Table
        isUserContentViewEmpty = content.isEmptyTable("UserContentView")
        if(isUserContentViewEmpty)
        {
            // Call Service
            let service : ContentService = ContentService()
            service.get(user_content_view)
            
        }
            
        else
        {
            userContent = content.getUserContent(databasePath1,tableName : "UserContentView")
            print("UserContentoHERE",userContent)
            p_name = (userContent.stringForColumn("firstName"))!
            print("P_name",p_name)
            p_viewCount = (userContent.stringForColumn("numberOfViews"))!
            p_lastOpen = (userContent.stringForColumn("lastViewedDateTime"))!
        }

       
        
// Insert Into Table
//        content.insert(databasePath)
//        user.insert(databasePath1)
//        media.insert(databasePath2)
        
        
// delete from table
//        content.delete(databasePath)
//        media.delete(databasePath2)
//        user.delete(databasePath1)
        
//        contentInfoModel.insertDataInTable(databasePath)
        
// Instatiante Content-- UNCOmmnet
//        resultsOfContent = content.getContent(databasePath)
//        contentTitle = (resultsOfContent.stringForColumn("TITLE"))!
//        contentImageName = (resultsOfContent.stringForColumn("background_image_path"))!
//        contentTitleImageView.image = UIImage(named: contentImageName!)
//        contentTitleLable.text = contentTitle // UNCOmmnet

//        mediaCount = (resultsOfContent.stringForColumn("MEDIACOUNT"))!

        
// Instatiante Participant table -- Uncomment
//        participant = content.getParticipantName(databasePath)
//        particpantName = participant[0] as! [AnyObject]
//        participantView = participant[1] as! [AnyObject]
//        participantStatus = participant[2] as! [AnyObject]
//        participantDate = participant[3] as! [AnyObject]
 

// Instatiante ImageInfo
//        contentInfoModel.getImageInfo(databasePath)
//        resultOfImageInfo = contentInfoModel.getImageUrl(databasePath)
//        imageDataString = (resultOfImageInfo.stringForColumn("URL"))
//        contentInfoModel.insertImageData(databasePath)

//        resultImageArray = content.getImageInfo(databasePath) as! [UIImage]
   }
    
   
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    
 // Creating 2 table and set its numberofrows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var count:Int?

        if tableView == tableView1
        {
            count = 3
        }
        else
        {
            count = 1
        }
        
        return count!
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if tableView == tableView1
        {
            if indexPath.row == 0
            {
                let cell : MediaViewCell = tableView.dequeueReusableCellWithIdentifier("mediaCell") as! MediaViewCell
         
                cell.allMediaLabel.text = "All media"
//            cell.mediaCountLable.text = mediaCount
                return cell
            
            }
            
            if indexPath.row == 1
            {
                let cell : CustomNotificationCell = tableView.dequeueReusableCellWithIdentifier("customeNotCell") as! CustomNotificationCell
            
                return cell
            
            }

            else
            {
                let cell : MuteCell = tableView.dequeueReusableCellWithIdentifier("muteCell") as! MuteCell
                return cell
            }
    
    
        }
        
        let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("cell") as! CustomCell
// For Participant Table
        if tableView == participantTable
        {
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = UIColor.grayColor().CGColor
            customeCellObjct.createRoundImage(cell.profileImage)
// UNCommnet
            
            cell.participantName.text = p_name
            cell.viewsLable.text = p_viewCount
            cell.status.text = "Opened"
            cell.dateLable.text = p_lastOpen
//            cell.participantName.text = particpantName[indexPath.row] as? String
//            cell.viewsLable.text = participantView[indexPath.row] as? String
//            cell.status.text = participantStatus[indexPath.row] as? String
//            cell.dateLable.text = participantDate[indexPath.row] as? String
            return cell
        }
    
     return cell
        
     }
    
    
    
 // send messgae ot participant
    @IBAction func sendText(sender: UIButton)
    {
        if (MFMessageComposeViewController.canSendText())
        {
            let controller = MFMessageComposeViewController()
            controller.body = "Message Body"
            controller.recipients = ["9" , "8"]
            controller.messageComposeDelegate = self
            self.presentViewController(controller, animated: true, completion: nil)
        }
            
        else
        {
            print("cant send a msg")
            
            let alertController = UIAlertController(title: "Error", message: "Simulator Cant send Msg", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            
            
        }
    }
    
    
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult)
    {
        //... handle sms screen actions
        self.dismissViewControllerAnimated(true, completion: nil)
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
                    print("IP string",userString)
                    
                    
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
        
        
        
    }
    

    
    
}
