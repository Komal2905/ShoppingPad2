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
    let customeCellObjct : CustomCell = CustomCell()
    override func viewDidLoad() {
        super.viewDidLoad()

        customeCellObjct.createRoundImage(groupImageView)

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
