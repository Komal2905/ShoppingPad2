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
class Content_Info_VC: UIViewController, UITableViewDataSource,UITableViewDelegate, MFMessageComposeViewControllerDelegate{

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
  
    override func viewDidLoad()
    {
        super.viewDidLoad()

        customeCellObjct.createRoundImage(contentTitleImageView)
        contentTitleImageView.image = UIImage(named: "hd_nature_wallpaper.jpg")
// Database Creation
       databasePath = contentInfoModel.createTable()
        print("inside contentinfovc" , databasePath)
      // contentInfoModel.insertDataInTable(databasePath)
       contentInfoModel.setContentTableValue(databasePath)
        contentTitleLable.text = contentTitle

//        createTable()
//        insertDataInTable(databasePath)
//        setContentTableValue(databasePath)
        
        
    }
    
// Uncomment Following
    func createTable() -> String
    {
        
        databasePath = Model().createDatabase("ShoppingPad.db")
        path = databasePath
        print (path!)
        print("inside create table" , databasePath)
        let shoppingPad = FMDatabase(path: databasePath as String)
        print("path ", shoppingPad)
        
        if shoppingPad.open()
        {
            
            let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTENT (ID INTEGER PRIMARY KEY AUTOINCREMENT, TITLE TEXT, MEDIACOUNT INTEGER)"
            let sql_stmt1 = "CREATE TABLE IF NOT EXISTS PARTICIPANT (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, VIEW INTEGER)"
            if !shoppingPad.executeStatements(sql_stmt)
            {
                print("Error: \(shoppingPad.lastErrorMessage())")
            }
            
            if !shoppingPad.executeStatements(sql_stmt1)
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
    func insertDataInTable(dataPath : String) {
        
        let shoppingPad = FMDatabase(path : dataPath)
        var status = Bool()
        print ("datapath User ", dataPath )
        if shoppingPad.open()
        {
            
            let insertQuery = "INSERT INTO CONTENT(TITLE,MEDIACOUNT) VALUES('sofa',7)"
            let insertQuery1 = "INSERT INTO PARTICIPANT(NAME,VIEW) VALUES('KOMAL',20)"
            let result = shoppingPad.executeUpdate(insertQuery, withArgumentsInArray: nil)
            let result1 = shoppingPad.executeUpdate(insertQuery1, withArgumentsInArray: nil)

            if !result
            {
                status = true
                print("Error: \(shoppingPad.lastErrorMessage())")
                
            }
            else
            {
                status = false
            }
        }
        else
        {
            print("Error: \(shoppingPad.lastErrorMessage())")
        }
        print("value of bool = ",status)
        
    }
    
    
    
    
//    func setContentTableValue(dataPath : String)
//    {
//        let shoppingPad = FMDatabase(path : dataPath)
//        
//        if shoppingPad.open()
//        {
//            //let querySQL = "SELECT * FROM Content WHERE id = '\((name.text)!)'"
//            
//            let querySQL = "SELECT * FROM Content"
//            
//            let results:FMResultSet? = shoppingPad.executeQuery(querySQL,
//                withArgumentsInArray: nil)
//            
//            if results?.next() == true
//            {
//                let contentTitle : String =  (results?.stringForColumn("TITLE"))!
//                print("CONTENT table ", results?.stringForColumn("TITLE"))
//                let dbMediaCount : String =  (results?.stringForColumn("MEDIACOUNT"))!
//                print("Content Title", contentTitle)
//                contentTitleLable.text = contentTitle
//                mediaCount = dbMediaCount
//            }
//            else
//            {
//                print("No data match")
//            }
//            
//            
//    // FETCHING DATA FROM PARTICIPANT TABLE
//            
//            let querySQL1 = "SELECT * FROM PARTICIPANT"
//            
//            let results1:FMResultSet? = shoppingPad.executeQuery(querySQL1,
//                withArgumentsInArray: nil)
//            print("Participant table data", results1)
//            
//            if let rs = shoppingPad.executeQuery("select * from PARTICIPANT", withArgumentsInArray: nil)
//            {
//                 while rs.next()
//                  {
//                    let participant_name = rs.objectForColumnName("NAME") as! String
//                    let participant_view = rs.objectForColumnName("VIEW") as! Int
//                    let participantView_s = String(participant_view)
//                    print("A", participant_name)
//                    particpantName = participant_name
//                    participantView = participantView_s
//
//                  }
//                
//            }
//            
//
//    
//    
//    
////            if results1?.next() == true
////
////            {
////                let participant_name : String =  (results1?.stringForColumn("NAME"))!
////                let participant_view : String =  (results1?.stringForColumn("VIEW"))!
////                print("Participant table NAME column ",results1?.stringForColumn("NAME"))
////               // particpantName.append((results1?.stringForColumn("NAME"))!)
////                
////                print("Array of participant", particpantName)
////                print("Content Title", participant_name)
////                particpantName = participant_name
////                participantView = participant_view
////               
////                
////            }
////            else
////            {
////                print("No data match")
////            }
//            
//                
////            
//            print("RESULTSETT",results1?.stringForColumn("NAME"))
//            shoppingPad.close()
//
//
//        }
//            
//        else
//        {
//            print("Error: \(shoppingPad.lastErrorMessage())")
//        }
//    }
//    
//    


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
    
    
  
    //let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("cell") as! CustomCell
    cell.layer.borderWidth = 1.0
    cell.layer.borderColor = UIColor.grayColor().CGColor

       
    customeCellObjct.createRoundImage(cell.profileImage)
   // obj1.createRoundImage(cell.profileImage)
    cell.profileImage.image = UIImage(named: "hd_nature_wallpaper.jpg")
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
