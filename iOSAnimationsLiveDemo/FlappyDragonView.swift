//
//  FlappyDragonView.swift
//  iOSAnimationsLiveDemo
//
//  Created by Doncho Minkov on 12/15/14.
//  Copyright (c) 2014 Telerik Academy. All rights reserved.
//

import UIKit

class FlappyDragonView: UIView {
    var currentDragonImageIndex: Int!
    var dragonImages: [UIImage]!
    var dragonImageView: UIImageView!
    
    override init() {
        super.init()
        self.initDragonImages()
    }
    
    override init(frame: CGRect) {
        self.dragonImageView = UIImageView(frame: frame)
        super.init(frame: frame)
        
        self.addSubview(self.dragonImageView)
        self.initDragonImages()
        
        self.dragonImageView.animationImages = self.dragonImages
        self.dragonImageView.animationRepeatCount = 10000
        self.dragonImageView.animationDuration = 1
        self.dragonImageView.startAnimating()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initDragonImages()
    }
    
    private func initDragonImages(){
        self.dragonImages = []
        self.currentDragonImageIndex = 0
        for i in 0...11{
            let namedImage = "dragon_0\(i).png"
            let image = UIImage(named: namedImage)
            if(image != nil){
                self.dragonImages.append(image!)
            }
        }
        
    }
}
