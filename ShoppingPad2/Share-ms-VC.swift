//
//  Share-ms-VC.swift
//  ShoppingPad2
//
//  Created by Vidya Ramamurthy on 05/02/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class Share_ms_VC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating{
   
    var myContactList = ["Meena", "Eve", "Thomas", "Kedar", "Heena","BridgeLabz","Adam"]
    
    //var resultSearchController = UISearchController()
    
    @IBOutlet weak var tableView: UITableView!

   
    @IBOutlet weak var searchbar: UISearchBar!
    
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    
    
   
    var searchActive : Bool = false
      var filtered:[String] = []
    //var filteredResult = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

      // searchbar.delegate = self
        
        
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        // Reload the table
        self.tableView.reloadData()
       
    }

    
    
    
    
//    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        searchActive = true;
//    }
//    
//    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
//        searchActive = false;
//    }
//    
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        searchActive = false;
//    }
//    
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        searchActive = false;
//    }
//    
//    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
//        
//        filtered = myContactList.filter({ (text) -> Bool in
//            let tmp: NSString = text
//            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
//            return range.location != NSNotFound
//        })
//        if(filtered.count == 0){
//            searchActive = false;
//        } else {
//            searchActive = true;
//        }
//        self.tableView?.reloadData()
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        
        if (self.resultSearchController.active) {
            return self.filteredTableData.count
        }
        else
        {
            return myContactList.count
        }
       
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("shareMSell")! as UITableViewCell
        let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("shareMSell") as! CustomCell
    

        if (self.resultSearchController.active) {
            cell.contactNameLabel.text  = filteredTableData[indexPath.row]
            
            return cell
        }
        
        
         else
      {
        
        cell.phoneNoTypeLabel.text = "Mobile"
            cell.contactProfileIM.image = UIImage(named: "1.jpg")
            cell.contactNameLabel.text = myContactList[indexPath.row]
            cell.contactdetailsLabel.text = "Hi"

           // return cell
        }
        return cell

    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        filteredTableData.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (myContactList as NSArray).filteredArrayUsingPredicate(searchPredicate)
        filteredTableData = array as! [String]
        
        self.tableView.reloadData()
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
