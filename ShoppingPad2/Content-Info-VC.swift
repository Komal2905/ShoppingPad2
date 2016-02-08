//
//  Content-Info-VC.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 03/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import MessageUI
class Content_Info_VC: UIViewController, UITableViewDataSource,UITableViewDelegate, MFMessageComposeViewControllerDelegate{

    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var participantTable: UITableView!
    
    @IBOutlet weak var contentTitleImageView: UIImageView!
    
    let customeCellObjct: CustomCell = CustomCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//let obj1 = CustomCell?()
        
        contentTitleImageView.layer.borderWidth = 1.0
        contentTitleImageView.layer.masksToBounds = false
        contentTitleImageView.layer.borderColor = UIColor.whiteColor().CGColor
        
        contentTitleImageView.layer.cornerRadius =   contentTitleImageView.frame.size.height/2
        contentTitleImageView.clipsToBounds = true
        contentTitleImageView.contentMode = .ScaleAspectFill
        contentTitleImageView.image = UIImage(named: "hd_nature_wallpaper.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
           //cell.textLabel?.text = "All media"
            cell.allMediaLabel.text = "All media"
            
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
    
    
  
    //let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("cell") as! CustomCell
    cell.layer.borderWidth = 1.0
    cell.layer.borderColor = UIColor.grayColor().CGColor
//    cell.profileImage.layer.borderWidth = 1.0
//    cell.profileImage.layer.masksToBounds = false
//    cell.profileImage.layer.borderColor = UIColor.whiteColor().CGColor
//    
//    cell.profileImage.layer.cornerRadius =   cell.profileImage.frame.size.height/2
//    cell.profileImage.clipsToBounds = true
//    cell.profileImage.contentMode = .ScaleAspectFill
       
    customeCellObjct.createRoundImage(cell.profileImage)
   // obj1.createRoundImage(cell.profileImage)
    cell.profileImage.image = UIImage(named: "hd_nature_wallpaper.jpg")
   return cell
    
}
    
     return cell
        
        
        
        
        
//        let cell : MuteCell = tableView.dequeueReusableCellWithIdentifier("muteCell") as! MuteCell
//        return cell
        
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
            //            let alert = UIAlertView(title: "ERROR", message: "cant send messgae through simulator", delegate: nil, cancelButtonTitle: "OK")
            //
            //            alert.show()
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
