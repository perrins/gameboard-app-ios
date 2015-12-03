import UIKit

class YourVideosViewController: UIViewController {
    var categories = ["Action", "Platform", "Racing", "Minecraft", "Space"]
    
    
}

extension YourVideosViewController : UITableViewDelegate {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        assert(sender as? UICollectionViewCell != nil, "sender is not a collection view")
        
        if segue.identifier == "VideoDetail" {
            
            let detailVC: YourVideoViewController = segue.destinationViewController as! YourVideoViewController
            //detailVC.selectedImageName = cellImages[indexPath.row]
            //detailVC.selectedLabel = cellLabels[indexPath.row]
            
        }
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) {
            performSegueWithIdentifier("VideoDetail", sender: cell)
        } else {
            // Error indexPath is not on screen: this should never happen.
        }
    }

}

extension YourVideosViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CategoryRow
        return cell
    }
    
   }