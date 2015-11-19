//
//  LoginViewController.swift
//  StretchyHeaders
//
//  Created by Matthew Perrins on 11/11/2015.
//  Copyright © 2015 Matthew Perrins. All rights reserved.
//

import UIKit
import AVFoundation

class LoginViewController: UIViewController {

    @IBOutlet weak var backImg: UIImageView!
    
    @IBAction func googleLogin(sender: UIButton) {
        
        print("button selected")
        

        self.stop = true;
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("Navigation") as UIViewController
        self.presentViewController(nextViewController, animated:true, completion:nil)
        
        
    }
    
    let titles = [ "Action","Platform","Racing","Classic","War","Future"]
    
    var stop = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imgView = UIImageView(frame: self.view.frame) //imgView to display background
        imgView!.contentMode = .ScaleAspectFill
        self.view.insertSubview(imgView!, atIndex: 0)  //imgview add above the background of main view
        
        animateImage(1)

        
    }
    
    var imgCount = 1
    var imgView:UIImageView?  //class variable to display you bg image
    
    func animateImage(no:Int)
    {
        var imgNumber:Int = no
        let name:String = "\(imgNumber).jpg"
        
        imgView!.alpha = 1.0
        imgView!.image = UIImage(named:name);
        
        UIView.animateWithDuration(5.0, delay: 0.0, options:UIViewAnimationOptions.CurveEaseIn, animations: {() in
            self.imgView!.alpha = 0.4;
            },
            completion: {(Bool) in
                imgNumber++;
                if imgNumber>7  //only for 4 image
                {
                    imgNumber = 1
                }
                self.animateImage(imgNumber);
        })
    }
    
    
    
        // Blur the Current Image
        /*
        let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = backImg.bounds
        backImg.addSubview(blurView)
        */

        /*
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut, animations: {

            start += 0.1
            print("start animation")
            self.backImg.frame = CGRectMake(start,start, (iSize?.width)! + 0.1, (iSize?.height)! + 0.1)
            
            // Caculate a Zoom effect from the center of the image, keep it slow
            
            
            }, completion: { finished in
            
                self.backImg.frame.origin.x = 0
                self.backImg.frame.origin.y = 0
                
                // Change the image
                let str = String(self.imgCount)+".jpg";
                
                print(str)
                print (self.titles[self.imgCount-1])
                
                self.backImg.image = UIImage(named: str);
                self.imgCount++
                
                // Play the next animation
                self.animateBackgroundImage()
                
            }
        )
        */

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
