//
//  VIewTabVC.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 03/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class VIewTabVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
 let customeCellObjct : CustomCell = CustomCell()
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
        
        let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("ViewTabCell") as! CustomCell
       
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = UIColor.grayColor().CGColor

        
            customeCellObjct.createRoundImage(cell.ViewTabImageView)
            cell.ViewTabImageView.image = UIImage(named: "6.jpg")
            return cell
        
      }

}
