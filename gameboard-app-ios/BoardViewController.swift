//
//  ViewController.swift
//  StretchyHeaders
//
//  Created by Matthew Perrins on 21/10/2015.
//  Copyright © 2015 Matthew Perrins. All rights reserved.
//

import UIKit

class BoardViewController: UITableViewController {
    
    private let kTableHeaderHeight: CGFloat = 250.0
    
    var headerView: UIView!
    
    let items = [
        BoardItem(rank:1,category: .World, summary: "Climate change protests, divestments meet fossil fuels realities"),
        BoardItem(rank:2,category: .Europe, summary: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
        BoardItem(rank:3,category: .MiddleEast, summary: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
        BoardItem(rank:4,category: .Africa, summary: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
        BoardItem(rank:5,category: .AsiaPacific, summary: "Despite UN ruling, Japan seeks backing for whale hunting"),
        BoardItem(rank:6,category: .Americas, summary: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
        BoardItem(rank:7,category: .World, summary: "South Africa in $40 billion deal for Russian nuclear reactors"),
        BoardItem(rank:8,category: .Europe, summary: "'One million babies' created by EU student exchanges"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
        
        /*
        let headers = [
        "cache-control": "no-cache",
        "postman-token": "8eb90fac-eb2c-1937-2055-29761d999926"
        ]
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3002/gameboard-cloud/v1/apps/d885d542-0c0d-4b51-b095-e4d4fe65d56c/genres")!,
        cachePolicy: .UseProtocolCachePolicy,
        timeoutInterval: 10.0)
        request.HTTPMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
        print(error)
        } else {
        let httpResponse = response as? NSHTTPURLResponse
        print(httpResponse)
        }
        })
        
        dataTask.resume()
        */
        
        // Get Handle to the Genres API and lets execute it and get some data back
        let genres = SwaggerClientAPI.GameboardAPI.genresGet()
        
        //genres.execute( { (response: Response<[Genre]>?, erorr:ErrorType?) in
        
        //    print(response);
        
        //})
        
        print(genres);
        
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        headerView.frame = headerRect
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell  {
            
            let item = items[indexPath.row]
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! BoardItemCell
            cell.boardItem = item
            
            return cell    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        return items.count
    }
    
}

