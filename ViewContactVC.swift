//
//  ViewContactVC.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 04/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ViewContactVC: UIViewController, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var menuPicker: UIPickerView!
    let options = ["Send Message","Clear Chat","Email Chat"]
    var currentSelectedIndex = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        menuPicker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentSelectedIndex = row + 1
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("viewContactCell") as! CustomCell
        if indexPath.row == 0
        {
            //let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("viewContactCell") as! CustomCell
            cell.textLabel?.text = "BridgeLabz"
            
            return cell
            
        }
      
        if indexPath.row == 1
        {
            let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("viewContactCell1") as! CustomCell
            cell.textLabel?.text = "All Media"
           // cell.accesoryTypeDetailsLable.text = "2"
            return cell
            
        }
        if indexPath.row == 2
        {
            let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("viewContactCell2") as! CustomCell
            cell.textLabel?.text = "Starred message"
            //cell.accesoryTypeDetailsLable.text = "none"
            
            return cell
            
        }
        if indexPath.row == 3
        {
            let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("viewContactCell3") as! CustomCell
            cell.textLabel?.text = "Send Read receipt"
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            return cell
            
        }
        
        if indexPath.row == 4
        {
            let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("viewContactCell4") as! CustomCell
            cell.textLabel?.text = "Mobile"
            cell.detailTextLabel?.text = "9090909098"
            cell.accessoryType = UITableViewCellAccessoryType.None
            return cell
            
        }

        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
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
