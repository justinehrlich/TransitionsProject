//
//  StartMenuOverlay.swift
//  AViSSS
//  Copyright (c) 2015 AViSSS. All rights reserved.
//

import SpriteKit


class StartMenuOverlay: SKScene{
    
    var scenarioManager = ScenarioManager()
    var buttons = [SKShapeNode]()
    var scenarioList = [String]()
    
    override init(size: CGSize) {
        super.init(size: size)
        self.size = size
        anchorPoint = CGPointMake(0.5, 0.5)
        var background = SKSpriteNode(imageNamed: "background.jpeg")
        background.size = size
        background.zPosition = -5
        background.name = "background"
        self.addChild(background)
        self.backgroundColor = SKColor.brownColor()
        NSLog("Size \(self.frame.size)")
        
        var logo = SKSpriteNode(imageNamed: "logo.png")
        logo.zPosition = 1
        logo.position = CGPointMake(225, 250)
        logo.name = "logo"
        self.addChild(logo)
        
        var intro = SKSpriteNode(imageNamed: "intro.png")
        intro.zPosition = 1
        intro.position = CGPointMake(225, -250)
        intro.name = "intro"
        self.addChild(intro)
        
        
        setupButtons()
        NSLog("menu init finished")
    }
    func setupButtons(){
        
        //get list of scenarios
        scenarioList = scenarioManager.scriptManager.getScenarioList()
        NSLog("ScenarioList- \(scenarioList)")
        var x:CGFloat = -490
        var y:CGFloat = 220
        
        for scenario in scenarioList{
            NSLog("buildingButton")
            //var button = SKShapeNode(path: CGPathCreateWithRoundedRect(CGRectMake(x, y,  193, 135), 8, 8, nil))
            
            var button = SKShapeNode()
            button.position=CGPointMake(x, y)
            var pathPos = CGPathCreateMutable()
            CGPathAddRoundedRect(pathPos, nil, CGRectMake(0, 0, 193, 125),8,8)
            button.path = pathPos
            

            
            button.fillColor = UIColor(white: 1, alpha: 1)
            button.fillTexture = SKTexture(imageNamed: "\(scenario).png")
            //button.fillTexture = SKTexture(imageNamed: "hallwayScenario.png")
            button.strokeColor = SKColor.blackColor()
            button.lineWidth = 2
            button.zPosition = 1
            button.name = "scenario"
            NSLog("button created- frame \(button.frame)")
            self.addChild(button)
            
            buttons.append(button)
            
            //Move coordinates down the column, and over a row if needed
            y -= 135
            if (y < -350) {
                y = 220
                x += 210
            }
            
        }
        
        NSLog("buttonsListMade- \(buttons)")
        
    }
    
    func setTheScenarioManager(sm: ScenarioManager){
        scenarioManager = sm
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSLog("Start Menu Touched!")
        let touchLocation = (touches as! Set<UITouch>).first!.locationInNode(self)
        var index = 0
        
        for button in buttons{
            NSLog("testing button touch \(button.frame, touchLocation)")
            if CGRectContainsPoint(button.frame, touchLocation){
                NSLog("\(scenarioList[index]) Touched")
                
                scenarioManager.scenarioNames = scenarioList
                scenarioManager.currentScenarioIndex = index
                scenarioManager.refreshRunningScene("\(scenarioList[index])")
                //break
            }
            index++
        }
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
