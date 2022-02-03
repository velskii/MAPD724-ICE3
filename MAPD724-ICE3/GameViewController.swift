//
//  GameViewController.swift
//  MAPD724-ICE3
//
//  FeiliangZhou 301216989
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var LivesLabel: UILabel!
    
    override func viewDidLoad()
        {
            super.viewDidLoad()
            
            if let view = self.view as! SKView?
            {
                // Load the SKScene from 'GameScene.sks'
                if let scene = SKScene(fileNamed: "GameScene")
                {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view.presentScene(scene)
                }
                
                view.ignoresSiblingOrder = true
            }
            
            // Initialize the Lives and Score
            CollisionManager.gameViewController = self
            ScoreManager.Score = 0
            ScoreManager.Lives = 5
            updateLivesLabel()
            updateScoreLabel()
        }

        override var shouldAutorotate: Bool {
            return true
        }

        override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return .allButUpsideDown
            } else {
                return .all
            }
        }

        override var prefersStatusBarHidden: Bool {
            return true
        }
        
        func updateScoreLabel() -> Void
        {
            print("update score label ....")
            ScoreLabel.text = "Score: \(ScoreManager.Score)"
        }
        
        func updateLivesLabel() -> Void
        {
            print("update lives label ....")
            LivesLabel.text = "Lives: \(ScoreManager.Lives)"
        }

}
    
    
