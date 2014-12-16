//
//  ViewController.swift
//  iOSAnimationsLiveDemo
//
//  Created by Doncho Minkov on 12/14/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var circle: UIView!
    
    override init() {
        super.init()
        self.tabBarItem = UITabBarItem(title: "UIKit", image: nil, selectedImage: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBarItem = UITabBarItem(title: "UIKit", image: nil, selectedImage: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRectMake(0, self.view.frame.height/2 - 25, self.view.frame.width, 50))
        label.textAlignment = .Center
        label.text = "Pan around the screen"
        self.view.addSubview(label)
        
        self.circle = UIView(frame: CGRectMake(50, 50, 50, 50))
        self.circle.backgroundColor = UIColor.blackColor()
        self.circle.layer.cornerRadius = self.circle.frame.width / 2
        self.view.addSubview(self.circle)
        
//        self.animateRectBackground()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func animatedMoveToX(x: CGFloat, y: CGFloat){
        UIView.animateWithDuration(1,
            animations: { () -> Void in
                let frame = CGRectMake(x, y, 50, 50)
                self.circle.frame = frame
        })
    }
    
    var count = 0
    
    func animateRectBackground(){
        ++count
        
        UIView.animateWithDuration(5.0,
            delay: 1.0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                if(self.count % 2 == 0){
                    self.circle.backgroundColor = UIColor.redColor()
                    var x = self.view.frame.width
                    var y = self.view.frame.height
                    self.circle.frame = CGRectMake(x, y, 50, 50);
                }
                else{
                    self.circle.backgroundColor = UIColor.blueColor()
                    
                    self.circle.frame = CGRectMake(0, 0, 50, 50);
                }
        }) { (finished) -> Void in
            self.animateRectBackground()
        }
    }
    
    @IBAction func pan(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(self.view)
        animatedMoveToX(location.x, y: location.y)
    }
    
}

