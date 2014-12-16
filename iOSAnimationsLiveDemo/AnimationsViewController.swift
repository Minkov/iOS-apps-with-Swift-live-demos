//
//  AnimationsControllerViewController.swift
//  iOSAnimationsLiveDemo
//
//  Created by Doncho Minkov on 12/14/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

import UIKit

class AnimationsViewController: UIViewController {
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collion: UICollisionBehavior!
    
    override init() {
        super.init()
        self.tabBarItem = UITabBarItem(title: "UIKit", image: nil, selectedImage: nil)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBarItem = UITabBarItem(title: "UI Dynamics", image: nil, selectedImage: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRectMake(0, self.view.frame.height/2 - 25, self.view.frame.width, 50))
        label.textAlignment = .Center
        label.text = "Pan around the screen"
        self.view.addSubview(label)
        
        self.animator = UIDynamicAnimator(referenceView: self.view)
        self.gravity = UIGravityBehavior()
        self.gravity.angle = CGFloat( 1.5 * M_PI)
        self.animator.addBehavior(gravity)
        
        self.collion  = UICollisionBehavior()
        self.collion.translatesReferenceBoundsIntoBoundary = true
        //        self.collion.addBoundaryWithIdentifier("right", fromPoint: CGPointMake(500, 0), toPoint: CGPointMake(100, 500))
        //
        //        self.collion.addBoundaryWithIdentifier("left", fromPoint: CGPointMake(0, 0), toPoint: CGPointMake(500, 500))
        
        self.animator.addBehavior(collion)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func pan(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(self.view)
        self.createFallingRect(location.x, y: location.y)
    }
    
    //    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    //        var touch: UITouch! = touches.anyObject() as? UITouch
    //        var location = touch.locationInView(self.view)
    //        self.createFallingRect(location.x, y: location.y)
    //    }
    
    func createFallingRect(x: CGFloat, y: CGFloat){
        var rect = UIView(frame: CGRectMake(x, y, 15, 15))
        rect.backgroundColor = UIColor.greenColor()
        self.view.addSubview(rect)
        self.gravity.addItem(rect)
        self.collion.addItem(rect)
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
