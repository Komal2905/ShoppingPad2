//
//  Content_Views_MS.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 05/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import ContactsUI
import MessageUI
class Content_Views_MS: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate, UIGestureRecognizerDelegate, UISearchResultsUpdating, MFMessageComposeViewControllerDelegate{
    
    @IBAction func sendMessage(sender: AnyObject) {
    }
    @IBOutlet weak var myTableVIew: UITableView!
    var peopleName=["Participant name","Heena","Seema","Vijay","Rajiv","Akshay","Kareena"]
    var profilepic = ["hd_nature_wallpaper.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg"]
    
    var totalViews = ["20","30","12","2","9","28","4"]
    var filteredPeople = [String]()
    var contentTitle : String!
    var contentFlag = false
    
    
    var segue: UIStoryboardSegue!
    
    
    @IBOutlet weak var contentTitleLable: UILabel!
    @IBOutlet weak var groupPhotoImageView: UIImageView!

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var resultSearchController = UISearchController()
    
    let phoneNumber : String = "9878978"
    
    var imagess : UIImage!
    
    @IBAction func searchBarPressed(sender: AnyObject) {
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            myTableVIew.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // resultSearchController.showsScopeBar = true
        
        
        
        
        
        
        //        self.navigationItem.backBarButtonItem?.title = "ACV"
        //        // Do any additional setup after loading the view, typically from a nib.
        groupPhotoImageView.image = UIImage(named: "hd_nature_wallpaper.jpg")
        //
                // search Bar
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            myTableVIew.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        
        
        myTableVIew.reloadData()
        
//        if((contentFlag) == true)
//        {
//            contentTitleLable.text = contentTitle
//        }
//            
//        else
//        {
//            contentTitleLable.text = "Test"
//        }
        
        
    }
    
    
    func imageTapped(gesture: UIGestureRecognizer)
    {
        print("tapped")
        
        
        
    }
    
    @IBOutlet weak var sendMessage: UIButton!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("cell") as! CustomCell
        //var(PersonName)=peopleName[indexPath.row] // Un comment Thnis
        var PersonName = String()
        var profPic = profilepic[indexPath.row]
        var viewCount = totalViews[indexPath.row]
        cell.profileImage.layer.borderWidth = 1.0
        cell.profileImage.layer.masksToBounds = false
        cell.profileImage.layer.borderColor = UIColor.whiteColor().CGColor
        
        cell.profileImage.layer.cornerRadius =   cell.profileImage.frame.size.height/2
        cell.profileImage.clipsToBounds = true
        cell.profileImage.contentMode = .ScaleAspectFill
        
        cell.profileImage.image=UIImage(named :profPic )
        
        
        //        cell.participantName.text = PersonName  // Uncomment
        cell.viewsLable.text = String(viewCount) + " Views"
        
        
        if (self.resultSearchController.active) {
            cell.participantName.text = filteredPeople[indexPath.row]
            // imagess = cell.profileImage.image
            return cell
        }
        else {
            cell.participantName.text = peopleName[indexPath.row]
            //imagess = cell.profileImage.image
            return cell
        }
        
        
        
        
        // return cell  // un coment
        
        
        
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.resultSearchController.active) {
            
            return filteredPeople.count
        }
            
        else
        {
            return peopleName.count
        }
        
        
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete
        {
            peopleName.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        myTableVIew.deselectRowAtIndexPath(indexPath, animated: true)
        print("select ROw",indexPath.row)
        //let cell = self.tableView.cellForRowAtIndexPath(indexPath)
        
        let cell : CustomCell = self.tableView.cellForRowAtIndexPath(indexPath) as! CustomCell
        
        imagess = cell.profileImage.image
        
        
        
        
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        filteredPeople.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (peopleName as NSArray).filteredArrayUsingPredicate(searchPredicate)
        filteredPeople = array as! [String]
        
        myTableVIew.reloadData()
    }
    
    func backClearTitle()
    {
        let backItem = UIBarButtonItem()
        backItem.title = "Edit Content"
        navigationItem.backBarButtonItem = backItem
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if(segue.identifier == "contactContentInfo")
        {
            //backClearTitle()
            
            
            let destinationVC = segue.destinationViewController as! ContactContentView1
            destinationVC.proImg = UIImage(named: "1.jpg")
        }
        
        
        contentTitleLable.text = contentTitle
    }
    
    
    
    // Sending Message
    
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
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    
    // For Swipe down
    //
    //    override func viewDidAppear(animated: Bool) {
    //        func setup() {
    //            var swipeDown = UISwipeGestureRecognizer(target: self, action: "down:")
    //            swipeDown.direction = UISwipeGestureRecognizerDirection.Down
    //            var swipeUp = UISwipeGestureRecognizer(target: self, action: "up:")
    //            swipeUp.direction = UISwipeGestureRecognizerDirection.Up
    //
    //            self.view.addGestureRecognizer(swipeDown)
    //            self.view.addGestureRecognizer(swipeUp)
    //
    //            searchBar = UISearchBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 40))
    //            searchBar.backgroundColor = UIColor.redColor()
    //            self.view.addSubview(searchBar)
    //        }
    //    }
    //    
    //    func down(sender: UIGestureRecognizer) {
    //        print("down")
    //        //show bar
    //        UIView.animateWithDuration(1.0, animations: { () -> Void in
    //            self.searchBar.frame = CGRectMake(0, 64, self.view.frame.width, 40)
    //            }, completion: { (Bool) -> Void in
    //        })
    //    }
    //    func up(sender: UIGestureRecognizer) {
    //        print("up")
    //        UIView.animateWithDuration(1.0, animations: { () -> Void in
    //            self.searchBar.frame = CGRectMake(0, 0, self.view.frame.width, 40)
    //            }, completion: { (Bool) -> Void in
    //        })
    //    }
    
    
}
