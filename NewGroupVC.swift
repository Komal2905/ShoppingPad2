//
//  NewGroupVC.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 03/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class NewGroupVC: UIViewController {

    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var groupDiscriptionTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        groupImageView.layer.borderWidth = 1.0
        groupImageView.layer.masksToBounds = false
        groupImageView.layer.borderColor = UIColor.whiteColor().CGColor
        
        groupImageView.layer.cornerRadius =  groupImageView.frame.size.height/2
        groupImageView.clipsToBounds = true
        groupImageView.contentMode = .ScaleAspectFill
        groupImageView.image = UIImage(named: "6.jpg")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
