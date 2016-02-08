//
//  ContactContentView1.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 05/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ContactContentView1: UIViewController , UITableViewDataSource, UITableViewDelegate {
    var proImg : UIImage!
    
    @IBOutlet weak var abcTemp: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        abcTemp.layer.borderWidth = 1.0
        abcTemp.layer.masksToBounds = false
        abcTemp.layer.borderColor = UIColor.whiteColor().CGColor
        abcTemp.layer.cornerRadius = abcTemp.frame.size.width/2
        abcTemp.clipsToBounds = true
        abcTemp.image = proImg    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // changed to CustomeCell when used CustomeCell
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.grayColor().CGColor
        
        
        return cell
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        //        if(segue.identifier == "contactContentAction1")
        //        {
        //
        //               //let destinationVC  = segue.destinationViewController as! ViewController
        //
        //                     //    destinationVC.proImg = UIImage(named: "1.jpg")
        //        }
        
        if(segue.identifier == "contactContentAction")
        {
            //backClearTitle()
            
            
            let destinationVC = segue.destinationViewController as! ContactContentActionVC
            
            destinationVC.proImg = UIImage(named: "1.jpg")
        }
        
    }

}
