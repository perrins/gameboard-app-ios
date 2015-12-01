//
//  CandyTableViewController.swift
//  CandySearch
//
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class MemberTableViewController : UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var candies = [Member]()
    
    var filteredCandies = [Member]()
    
    override func viewDidLoad() {
        // Sample Data for candyArray
        self.candies = [Member(category:"Chocolate", name:"chocolate Bar"),
            Member(category:"Chocolate", name:"chocolate Chip"),
            Member(category:"Chocolate", name:"dark chocolate"),
            Member(category:"Hard", name:"lollipop"),
            Member(category:"Hard", name:"candy cane"),
            Member(category:"Hard", name:"jaw breaker"),
            Member(category:"Other", name:"caramel"),
            Member(category:"Other", name:"sour chew"),
            Member(category:"Other", name:"gummi bear")]
        
        // Reload the table
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredCandies.count
        } else {
            return self.candies.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        var candy : Member
        // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
        if tableView == self.searchDisplayController!.searchResultsTableView {
            candy = filteredCandies[indexPath.row]
        } else {
            candy = candies[indexPath.row]
        }
        
        // Configure the cell
        cell.textLabel!.text = candy.name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        self.filteredCandies = self.candies.filter({( candy : Member) -> Bool in
            let categoryMatch = (scope == "All") || (candy.category == scope)
            let stringMatch = candy.name.rangeOfString(searchText)
            return categoryMatch && (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
        let scopes = self.searchDisplayController!.searchBar.scopeButtonTitles! as [String]
        let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
        self.filterContentForSearchText(searchString!, scope: selectedScope)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!,
        shouldReloadTableForSearchScope searchOption: Int) -> Bool {
            let scope = self.searchDisplayController!.searchBar.scopeButtonTitles! as [String]
            self.filterContentForSearchText(self.searchDisplayController!.searchBar.text!, scope: scope[searchOption])
            return true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("candyDetail", sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "searchDetail" {
            
            let candyDetailViewController = segue.destinationViewController as UIViewController
            
            if sender as! UITableView == self.searchDisplayController!.searchResultsTableView {
                
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow!
                let destinationTitle = self.filteredCandies[indexPath.row].name
                candyDetailViewController.title = destinationTitle
                
                
                
            } else {
                let indexPath = self.tableView.indexPathForSelectedRow!
                let destinationTitle = self.candies[indexPath.row].name
                candyDetailViewController.title = destinationTitle
            }
            
        }
    }
}