//
//  GameScene.swift
//  ColorsBlind
//
//  Created by Gokhan Bayir on 24.02.2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    var ceilWhite:SKSpriteNode!
    var ceilBlue:SKSpriteNode!
    var ceilRed:SKSpriteNode!
    var ceilPink:SKSpriteNode!
    
    var whitePosition:CGPoint!
    var bluePosition:CGPoint!
    var redPosition:CGPoint!
    var pinkPosition:CGPoint!
    
    
    var numArray:[Int] = []
    
    
    override func didMove(to view: SKView) {
        
        createWhite()
        createBlue()
        createRed()
        createPink()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.level()
        })
    
    }
    
    // MARK: - createThem
    func createWhite() {
        ceilWhite = childNode(withName: "ceilWhite") as? SKSpriteNode
        ceilWhite.position = CGPoint(x: ceilWhite.position.x, y: ceilWhite.position.y)
        whitePosition = ceilWhite.position
        ceilWhite.zPosition = 10
    }
    func createBlue() {
        ceilBlue = childNode(withName: "ceilBlue") as? SKSpriteNode
        ceilBlue.position = CGPoint(x: ceilBlue.position.x, y: ceilBlue.position.y)
        bluePosition = ceilBlue.position
        ceilBlue.zPosition = 1
    }
    func createRed() {
        ceilRed = childNode(withName: "ceilRed") as? SKSpriteNode
        ceilRed.position = CGPoint(x: ceilRed.position.x, y: ceilRed.position.y)
        redPosition = ceilRed.position
        ceilRed.zPosition = 1
    }
    func createPink() {
        ceilPink = childNode(withName: "ceilPink") as? SKSpriteNode
        ceilPink.position = CGPoint(x: ceilPink.position.x, y: ceilPink.position.y)
        pinkPosition = ceilPink.position
        ceilPink.zPosition = 1
    }
    
    // MARK: - playGame
    
    var howManyRepeatWhite:Int = 0
    
    func randomPositionFunc(i:CGPoint) -> CGPoint{
        
        var randomPosition:CGPoint!
        
        var randomInt:Int = Int.random(in: 1...4)
        /*if i == ceilWhite.position {
            for a in 0...howManyRepeatWhite{
                
                if (howManyRepeatWhite == a) {
                    
                    randomPosition = bluePosition
                    howManyRepeatWhite += 1
                }
                if (howManyRepeatWhite == a) {
                    
                    randomPosition = redPosition
                    howManyRepeatWhite += 1
                }
                if (howManyRepeatWhite == a) {
                    
                    randomPosition = bluePosition
                    howManyRepeatWhite += 1
                }
                if (howManyRepeatWhite == a) {
                    
                    randomPosition = pinkPosition
                    howManyRepeatWhite += 1
                }
            }
        }*/
        
        
        
        if(i == whitePosition){
         
         randomInt = Int.random(in: 2...4)
         if(randomInt == 2){
             randomPosition = bluePosition
         }
         if(randomInt == 3){
             randomPosition = redPosition
         }
         if(randomInt == 4){
             randomPosition =  pinkPosition
         }
        }
        if(i == bluePosition){
         randomPosition = whitePosition
         randomInt = Int.random(in: 3...4)
         if(randomInt == 1){
             randomPosition = bluePosition
         }
         if(randomInt == 3){
             randomPosition = redPosition
         }
         if(randomInt == 4){
             randomPosition =  pinkPosition
         }
        }
        if(i == redPosition){
         randomPosition =  pinkPosition
         randomInt = Int.random(in: 1...2)
         if(randomInt == 1){
             randomPosition = bluePosition
         }
         if(randomInt == 2){
             randomPosition = redPosition
         }
         if(randomInt == 4){
             randomPosition =  pinkPosition
         }

        }
        if(i == pinkPosition){
         randomPosition = redPosition
         randomInt = Int.random(in: 1...3)
         if(randomInt == 1){
             randomPosition = bluePosition
         }
         if(randomInt == 2){
             randomPosition = redPosition
         }
         if(randomInt == 3){
             randomPosition =  pinkPosition
         }

        }
    
        
        
      /*  if (i == ceilBlue.position) {
            
            if(i == whitePosition){
                
                randomPosition = bluePosition
            }
            if(i == bluePosition){
                randomPosition = whitePosition
               
            }
            if(i == redPosition){
                randomPosition =  pinkPosition
               
            }
            if(i == pinkPosition){
                randomPosition = redPosition
              
            }
        }
        
        if (i == ceilRed.position) {
            
            if(i == whitePosition){
                
                randomPosition = bluePosition
            }
            if(i == bluePosition){
                randomPosition = whitePosition
               
            }
            if(i == redPosition){
                randomPosition =  pinkPosition
               
            }
            if(i == pinkPosition){
                randomPosition = redPosition
              
            }
        }
        
        if (i == ceilPink.position) {
            
            if(i == whitePosition){
                
                randomPosition = bluePosition
            }
            if(i == bluePosition){
                randomPosition = whitePosition
               
            }
            if(i == redPosition){
                randomPosition =  pinkPosition
               
            }
            if(i == pinkPosition){
                randomPosition = redPosition
              
            }
        }*/
        
        
        /*if(randomInt == 1){
            randomPosition = bluePosition
            reserveNum = 2
        }
        if(randomInt == 2){
            randomPosition = whitePosition
            reserveNum = 3
        }
        if(randomInt == 3){
            randomPosition = pinkPosition
            reserveNum = 2
        }
        if(randomInt == 4){
            randomPosition =  redPosition
            reserveNum = 1
        }*/
        
        return randomPosition
        
        
    }
    
    func level(){
        
        let playWhite = SKAction.run(playGame)
        let waitToPlay = SKAction.wait(forDuration: 0.5)
        let playSeq = SKAction.sequence([playWhite,waitToPlay])
        let repatPlay = SKAction.repeat(playSeq, count: 5)
        self.run(repatPlay)
    }
    
    
    func playGame(){
        
        let whiteIn = SKAction.fadeIn(withDuration: 0.5)
        let whitePosition = SKAction.move(to: randomPositionFunc(i: ceilWhite.position), duration: 0.01)
        let whiteOut = SKAction.fadeOut(withDuration: 0.5)
        let whiteSeq = SKAction.sequence([whiteIn,whiteOut, whitePosition])
        ceilWhite.run(whiteSeq)
        
       /* let blueIn = SKAction.fadeIn(withDuration: 0.5)
        let bluePosition = SKAction.move(to: randomPositionFunc(i: ceilBlue.position), duration: 0.01)
        let blueOut = SKAction.fadeOut(withDuration: 0.5)
        let blueSeq = SKAction.sequence([blueIn,blueOut, bluePosition])
        let blueRepeat = SKAction.repeat(blueSeq, count: 5)
        ceilBlue.run(blueRepeat)
        
       
        let redIn = SKAction.fadeIn(withDuration: 0.5)
        let redPosition = SKAction.move(to: randomPositionFunc(i: ceilRed.position), duration: 0.01)
        let redOut = SKAction.fadeOut(withDuration: 0.5)
        let redSeq = SKAction.sequence([redIn,redOut, redPosition])
        let redRepeat = SKAction.repeat(redSeq, count: 5)
        ceilRed.run(redRepeat)
        
        let pinkIn = SKAction.fadeIn(withDuration: 0.5)
        let pinkPosition = SKAction.move(to: randomPositionFunc(i: ceilPink.position), duration: 0.01)
        let pinkOut = SKAction.fadeOut(withDuration: 0.5)
        let pinkSeq = SKAction.sequence([pinkIn,pinkOut, pinkPosition])
        let pinkRepeat = SKAction.repeat(pinkSeq, count: 5)
        ceilPink.run(pinkRepeat)*/
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let whiteIn = SKAction.fadeIn(withDuration: 0.5)
        ceilWhite.run(whiteIn)
        
        let blueIn = SKAction.fadeIn(withDuration: 0.5)
        ceilBlue.run(blueIn)
        
        let redIn = SKAction.fadeIn(withDuration: 0.5)
        ceilRed.run(redIn)
        
        let pinkIn = SKAction.fadeIn(withDuration: 0.5)
        ceilPink.run(pinkIn)
        
       
    }
    
    
 
}



/*    if(i == whitePosition){
 
 randomInt = Int.random(in: 2...4)
 if(randomInt == 2){
     randomPosition = bluePosition
 }
 if(randomInt == 3){
     randomPosition = redPosition
 }
 if(randomInt == 4){
     randomPosition =  pinkPosition
 }
}
if(i == bluePosition){
 randomPosition = whitePosition
 randomInt = Int.random(in: 3...4)
 if(randomInt == 1){
     randomPosition = bluePosition
 }
 if(randomInt == 3){
     randomPosition = redPosition
 }
 if(randomInt == 4){
     randomPosition =  pinkPosition
 }
}
if(i == redPosition){
 randomPosition =  pinkPosition
 randomInt = Int.random(in: 1...2)
 if(randomInt == 1){
     randomPosition = bluePosition
 }
 if(randomInt == 2){
     randomPosition = redPosition
 }
 if(randomInt == 4){
     randomPosition =  pinkPosition
 }

}
if(i == pinkPosition){
 randomPosition = redPosition
 randomInt = Int.random(in: 1...3)
 if(randomInt == 1){
     randomPosition = bluePosition
 }
 if(randomInt == 2){
     randomPosition = redPosition
 }
 if(randomInt == 3){
     randomPosition =  pinkPosition
 }

}*/
