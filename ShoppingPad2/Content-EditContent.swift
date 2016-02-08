//
//  Content-EditContent.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 04/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import Contacts

class Content_EditContent: UIViewController {

    @IBOutlet weak var editImageView: UIImageView!
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var editDiscriptionTextView: UITextView!
    
    
    @IBOutlet weak var media1ImageView: UIImageView!
    
    @IBOutlet weak var media2ImageView: UIImageView!
    @IBOutlet weak var media2Title: UITextField!
    @IBOutlet weak var media1Title: UITextField!
    
    
    let customeCellObjct: CustomCell = CustomCell()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
// Setting border for TextField
        let titleTextborder = CALayer()
        let width = CGFloat(1.0)
        titleTextborder.frame = CGRect(x: 0, y: editTextField.frame.size.height-width, width: editTextField.frame.size.width, height: editTextField.frame.size.height)
        titleTextborder.borderWidth = width
        editTextField.layer.borderColor = UIColor.grayColor().CGColor
        editTextField.layer.addSublayer(titleTextborder)
        editTextField.layer.masksToBounds = true
        
        let titleTextborder1 = CALayer()
    
        titleTextborder1.frame = CGRect(x: 0, y: media1Title.frame.size.height-width, width: media1Title.frame.size.width, height: media1Title.frame.size.height)
        titleTextborder1.borderWidth = width
        media1Title.layer.borderColor = UIColor.grayColor().CGColor
        media1Title.layer.addSublayer(titleTextborder1)
        media1Title.layer.masksToBounds = true
       
        let titleTextborder2 = CALayer()

        titleTextborder2.frame = CGRect(x: 0, y: editDiscriptionTextView.frame.size.height-width, width: editDiscriptionTextView.frame.size.width, height: editDiscriptionTextView.frame.size.height)
        titleTextborder2.borderWidth = width
        editDiscriptionTextView.layer.borderColor = UIColor.grayColor().CGColor
        editDiscriptionTextView.layer.addSublayer(titleTextborder2)
        editDiscriptionTextView.layer.masksToBounds = true
        
        
        let titleTextborder3 = CALayer()
        
        titleTextborder3.frame = CGRect(x: 0, y: media2Title.frame.size.height-width, width: media2Title.frame.size.width, height: media2Title.frame.size.height)
        titleTextborder3.borderWidth = width
        media2Title.layer.borderColor = UIColor.grayColor().CGColor
        media2Title.layer.addSublayer(titleTextborder3)
        media2Title.layer.masksToBounds = true
        
        
        
// setting Round ImageView


        
        
            customeCellObjct.createRoundImage(editImageView)
            customeCellObjct.createRoundImage(media1ImageView)
            customeCellObjct.createRoundImage(media2ImageView)
        

    
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
