//
//  GroupVC.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 04/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class GroupVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
var contactGroup = ["All Contact", "Coworker","Family","Friend","ICE","United Group"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("groupCell") as UITableViewCell!
        cell.textLabel?.text = contactGroup[indexPath.row]
        return cell
        
    }
    /*
    // MARK: - Navigation
    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
