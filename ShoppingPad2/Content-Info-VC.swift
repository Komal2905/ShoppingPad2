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
class Content_Info_VC: UIViewController, UITableViewDataSource,UITableViewDelegate,     MFMessageComposeViewControllerDelegate
{

    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var participantTable: UITableView!
    @IBOutlet weak var contentTitleImageView: UIImageView!
    @IBOutlet weak var contentTitleLable: UILabel!
    let customeCellObjct: CustomCell = CustomCell()
    let contentInfoModel: Content_info = Content_info()

    var mediaCount : String?
    var particpantName : String?
    var participantView : String?
    var contentTitle : String?
    
// For Database Path
    var databasePath = String()
    var path : String?
    var resultsOfContent = FMResultSet()
    var resultOfParticipant = FMResultSet()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        customeCellObjct.createRoundImage(contentTitleImageView)
        contentTitleImageView.image = UIImage(named: "hd_nature_wallpaper.jpg")
// Database Creation
        
        databasePath = contentInfoModel.createTable()
//      contentInfoModel.insertDataInTable(databasePath)

        
        resultsOfContent = contentInfoModel.getContentTableValue(databasePath)
        contentTitle = (resultsOfContent.stringForColumn("TITLE"))!
        mediaCount = (resultsOfContent.stringForColumn("MEDIACOUNT"))!
        contentTitleLable.text = contentTitle
  
        resultOfParticipant = contentInfoModel.getParticipantName(databasePath)
        particpantName = (resultOfParticipant.stringForColumn("NAME"))
        participantView = (resultOfParticipant.stringForColumn("VIEW"))
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        
        if tableView == tableView1
        {
            count = 3
            
        }
       else
        {
           count = 6
        }
        
        return count!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
if tableView == tableView1
{
         if indexPath.row == 0
         {
            let cell : MediaViewCell = tableView.dequeueReusableCellWithIdentifier("mediaCell") as! MediaViewCell
         
            cell.allMediaLabel.text = "All media"
            cell.mediaCountLable.text = mediaCount
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
if tableView == participantTable
{
    cell.layer.borderWidth = 1.0
    cell.layer.borderColor = UIColor.grayColor().CGColor
    customeCellObjct.createRoundImage(cell.profileImage)
    cell.profileImage.image = UIImage(named: "1.jpg")
    cell.participantName.text = particpantName
    cell.viewsLable.text = participantView
    return cell
    
}
    
     return cell
        
     }
    
    
    
    @IBAction func sendText(sender: UIButton) {
        if (MFMessageComposeViewController.canSendText()) {
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
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
