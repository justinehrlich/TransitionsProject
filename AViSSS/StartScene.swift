//
//  StartScene.swift
//  AViSSS
//
//  Created by  on 7/22/14.
//  Copyright (c) 2015 AViSSS. All rights reserved.
//

import SceneKit
import SpriteKit

//This is the scene loaded before script is read...
//Should show: available scenarios to run, settings, and previous scores 
class StartScene : SCNScene {
    
    override init(){
       super.init()
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
}
