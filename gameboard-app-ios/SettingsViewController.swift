//
//  SettingsViewController.swift
//  gameboard-app-ios
//
//  Created by Matthew Perrins on 24/11/2015.
//  Copyright © 2015 Matthew Perrins. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tabBarController
        
        // Do any additional setup after loading the view.
        self.tableView.backgroundColor = UIColor(red: 243.0/255, green: 243.0/255, blue: 243.0/255, alpha: 1)
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
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel!.textColor = UIColor(red: 151.0/255, green: 193.0/255, blue: 100.0/255, alpha: 1)
        let font = UIFont(name: "Montserrat", size: 18.0)
        //headerView.textLabel!.font = font!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch (indexPath.row)  {
            
          case 0:

            // Open MEMBERS Storyboard
            let storyboard = UIStoryboard(name: "Members", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("Members") as! UIViewController
            self.navigationController!.pushViewController(vc, animated: true)
            
            break;

            
            
            
          default:
            break;
        }
        
        //CODE TO BE RUN ON CELL TOUCH
    }

}
