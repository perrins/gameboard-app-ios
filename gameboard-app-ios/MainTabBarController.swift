//
//  MainTabBarController.swift
//  gameboard-app-ios
//
//  Created by Matthew Perrins on 25/11/2015.
//  Copyright © 2015 Matthew Perrins. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var viewControllers: [UIViewController] = self.viewControllers! as [UIViewController];

        // ADDING SEARCH TO TAB BAR
        var storyboard : UIStoryboard = UIStoryboard(name:"Search", bundle: nil)
        
        let search : UINavigationController = storyboard.instantiateViewControllerWithIdentifier("SearchNav") as! UINavigationController    
        
        // Create new Tab Bar Item for Search based on Search Story Board
        let searchIcon = UITabBarItem(title: "Search", image:UIImage(named: "ios7-search-strong.png"), selectedImage:UIImage(named: "ios7-search-strong.png"))

        // Add the Item to the Navigation Controller
        search.tabBarItem = searchIcon
        
        viewControllers.insert(search, atIndex: 1)
        
        // ADDING MEMBERS
        storyboard = UIStoryboard(name:"Members", bundle: nil)
        
        let members : UINavigationController = storyboard.instantiateViewControllerWithIdentifier("MembersNav") as! UINavigationController
        
        // Create new Tab Bar Item for Search based on Search Story Board
        let membersIcon = UITabBarItem(title: "Members", image:UIImage(named: "person-stalker.png"), selectedImage:UIImage(named: "person-stalker.png"))
        
        // Add the Item to the Navigation Controller
        members.tabBarItem = membersIcon
        
        viewControllers.insert(members, atIndex: 1)
        
        // ADDING YOURVIDEOS
        storyboard = UIStoryboard(name:"YourVideos", bundle: nil)
        
        let yourvideos : UINavigationController = storyboard.instantiateViewControllerWithIdentifier("YourVideosNav") as! UINavigationController
        
        // Create new Tab Bar Item for Search based on Search Story Board
        let yourVideosIcon = UITabBarItem(title: "Your Videos", image:UIImage(named: "videocamera.png"), selectedImage:UIImage(named: "videocamera.png"))
        
        // Add the Item to the Navigation Controller
        yourvideos.tabBarItem = yourVideosIcon
        
        viewControllers.insert(yourvideos, atIndex: 1)
        
        self.viewControllers = viewControllers
               
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        //This method will be called when user changes tab.
        if item.tag == 0 {
            
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
