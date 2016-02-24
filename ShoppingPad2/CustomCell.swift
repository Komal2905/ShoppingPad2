//
//  CustomCell.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 03/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell{
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var participantName: UILabel!
    @IBOutlet weak var viewsLable: UILabel!
    @IBOutlet weak var status: UILabel!
    
    
    @IBOutlet weak var dateLable: UILabel!
    
    // For COntactConetntcView
    @IBOutlet weak var actionLable: UILabel!
    @IBOutlet weak var openedLabel: UILabel!
    @IBOutlet weak var ViewTabImageView: UIImageView!
    
    // For ViewTab 
    
    // For viewContact
    @IBOutlet weak var accesoryTypeDetailsLable: UILabel!
    
    @IBOutlet weak var cellLable1: UILabel!
    @IBOutlet weak var cellLable2: UILabel!
    
    
    
    
    // for shareMS
    @IBOutlet weak var phoneNoTypeLabel: UILabel!
    
    @IBOutlet weak var contactProfileIM: UIImageView!
    
    @IBOutlet weak var contactNameLabel: UILabel!
    
    @IBOutlet weak var contactdetailsLabel: UILabel!
    @IBAction func sendMessage(sender: AnyObject) {
    }
    
  func createRoundImage(test: UIImageView)
  {
    
    test.layer.borderWidth = 1.0
    test.layer.masksToBounds = false
    test.layer.borderColor = UIColor.grayColor().CGColor
    
    test.layer.cornerRadius =  test.frame.size.height/2
    test.clipsToBounds = true
    test.contentMode = .ScaleAspectFill
    
    
    
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}