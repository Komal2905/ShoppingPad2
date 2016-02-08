//
//  ContactContentActionVC.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 05/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ContactContentActionVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var profilepicImageView: UIImageView!
    var proImg : UIImage!
     let customeCellObjct: CustomCell = CustomCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        

        customeCellObjct.createRoundImage(profilepicImageView)
        profilepicImageView.image = proImg
        
    }
    
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
    
    
    
    
}
