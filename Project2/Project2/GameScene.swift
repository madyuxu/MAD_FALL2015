//
//  GameScene.swift
//  Project2
//
//  Created by Yuwei Xu on 10/22/15.
//  Copyright (c) 2015 Yuwei Xu. All rights reserved.
//

import SpriteKit
import AVFoundation


struct PhysicsCategory {
    static let Ghost : UInt32 = 1
    static let Pumpkin : UInt32 = 2
    static let Simpson : UInt32 = 3
}



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var audioPlayer = AVAudioPlayer()
    
    var sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sound", ofType: "mp3")!)
    
    
    var Score =  Int ()
    var Simpson = SKSpriteNode (imageNamed: "simpson.png")
    var ScoreLabel = UILabel ()
    
    //var ScoreLabel.text =
    
    
    override func didMoveToView(view: SKView) {
        physicsWorld.contactDelegate = self
        Simpson.position = CGPointMake(self.size.width/2, self.size.height/8)
        Simpson.physicsBody = SKPhysicsBody(rectangleOfSize: Simpson.size)
        Simpson.physicsBody?.affectedByGravity = false
        Simpson.physicsBody?.categoryBitMask = PhysicsCategory.Simpson
        Simpson.physicsBody?.contactTestBitMask = PhysicsCategory.Ghost
        Simpson.physicsBody?.dynamic = false
        
        
        var Timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("SpawnPumpkins"), userInfo: nil, repeats: true)
        var GhostTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: ("SpawnGhosts"), userInfo: nil, repeats: true)

        
        
     
        
        
        self.addChild(Simpson)
        ScoreLabel.text = "\(Score)"
        ScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 90, height: 30))
        ScoreLabel.backgroundColor = UIColor.blackColor()
        ScoreLabel.textColor = UIColor.whiteColor()
        self.view?.addSubview(ScoreLabel)
 
        
        audioPlayer = AVAudioPlayer (contentsOfURL: sound, error: nil)
        
        audioPlayer.prepareToPlay()
    }

    
    func CollisonWithPumpkin (Ghost: SKSpriteNode, Pumpkin: SKSpriteNode){
        Ghost.removeFromParent()
        Pumpkin.removeFromParent()
        Score++
        
    }
    func CollisonWithSimpson (Ghost: SKSpriteNode, Simpson: SKSpriteNode){
        Ghost.removeFromParent()
        Simpson.removeFromParent()
        self.view?.presentScene(SKScene(fileNamed: "EndScene"))
        audioPlayer.stop()
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        audioPlayer.play()
        
        var firstBody : SKPhysicsBody = contact.bodyA
        var secondBody : SKPhysicsBody = contact.bodyB
        
        if ((firstBody.categoryBitMask == PhysicsCategory.Ghost) && (secondBody.categoryBitMask == PhysicsCategory.Pumpkin) ||
            
            (firstBody.categoryBitMask == PhysicsCategory.Pumpkin) && (secondBody.categoryBitMask == PhysicsCategory.Ghost)) {
            
            CollisonWithPumpkin(firstBody.node as! SKSpriteNode, Pumpkin: secondBody.node as! SKSpriteNode)
            
        }
            if ((firstBody.categoryBitMask == PhysicsCategory.Ghost) && (secondBody.categoryBitMask == PhysicsCategory.Simpson) ||
                    
            (firstBody.categoryBitMask == PhysicsCategory.Simpson) && (secondBody.categoryBitMask == PhysicsCategory.Ghost)) {
                    
            CollisonWithSimpson(firstBody.node as! SKSpriteNode, Simpson: secondBody.node as! SKSpriteNode)
            
            
            
            
        }
    }
    
    func SpawnPumpkins() {
        var Pumpkin = SKSpriteNode (imageNamed: "pumpkin.png")
        Pumpkin.zPosition = -5
        Pumpkin.position = CGPointMake(Simpson.position.x, Simpson.position.y)
        let action = SKAction.moveToY(self.size.height + 30, duration: 1.0)
        let actionDone = SKAction.removeFromParent()
        Pumpkin.runAction(SKAction.sequence([action, actionDone]))
       
        
        Pumpkin.physicsBody = SKPhysicsBody(rectangleOfSize: Pumpkin.size)
        Pumpkin.physicsBody?.categoryBitMask = PhysicsCategory.Pumpkin
        Pumpkin.physicsBody?.contactTestBitMask = PhysicsCategory.Ghost
        Pumpkin.physicsBody?.affectedByGravity = false
        Pumpkin.physicsBody?.dynamic = false
        
        
        self.addChild (Pumpkin)
    }
    
    func SpawnGhosts(){
        var Ghost = SKSpriteNode (imageNamed: "ghost.png")
        var MinValue = self.size.width/8
        var MaxValue = self.size.width - 20
        var SpawnPoint = UInt32(MaxValue - MinValue)
        Ghost.position = CGPoint(x: CGFloat(arc4random_uniform(SpawnPoint)), y: self.size.height)
        Ghost.physicsBody = SKPhysicsBody(rectangleOfSize: Ghost.size)
        Ghost.physicsBody?.categoryBitMask = PhysicsCategory.Ghost
        Ghost.physicsBody?.contactTestBitMask = PhysicsCategory.Pumpkin
        Ghost.physicsBody?.affectedByGravity = false
        Ghost.physicsBody?.dynamic = true
        
        
        let action = SKAction.moveToY(-70, duration: 3.0)
        let actionDone = SKAction.removeFromParent()
        Ghost.runAction(SKAction.sequence([action, actionDone]))
        Ghost.runAction(SKAction.repeatActionForever(action))
        
        self.addChild (Ghost)
        
        ScoreLabel.text = " Score: \(Score)"
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            Simpson.position.x = location.x

        
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            Simpson.position.x = location.x
   
            
        }

    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
