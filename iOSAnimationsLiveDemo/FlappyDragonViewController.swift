//
//  FlappyDragonViewController.swift
//  iOSAnimationsLiveDemo
//
//  Created by Doncho Minkov on 12/15/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

import UIKit

class FlappyDragonViewController: UIViewController {
    var dragon: FlappyDragonView!
    
    override init() {
        super.init()
        self.tabBarItem = UITabBarItem(title: "Dragon", image: nil, selectedImage: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBarItem = UITabBarItem(title: "Dragon", image: nil, selectedImage: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dragon = FlappyDragonView(frame: CGRectMake(100, 100, 200, 200))
        self.view.addSubview(self.dragon)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        self.dragon.animate()
    }

}
