//
//  ViewController.swift
//  Reaction
//
//  Created by Shannon Armon on 7/1/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    @IBOutlet weak var goButton: CircleButton!

    @IBOutlet weak var topScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.topScoreLabel.alpha = 0
        
        goButton.alpha = 0
        goButton.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            
            self.goButton.alpha = 1
            self.goButton.transform = CGAffineTransformMakeScale(1.0, 1.0)
            
        })
        
        GKLocalPlayer.localPlayer().authenticateHandler = { (ViewController, error) -> Void in
            
            if ViewController != nil {
            
                self.presentViewController(ViewController, animated: true, completion: nil)
                
            } else {
                
                    println(GKLocalPlayer.localPlayer().authenticated)
            
                self.loadSore()
            }

        }////////////////GAME CENTER//////////////
    }

    
    override func viewWillAppear(animated: Bool) {
        self.loadSore()
        
    }
    
    func loadSore(){
        
        if GKLocalPlayer.localPlayer().authenticated == false { return }
    
        GKLeaderboard.loadLeaderboardsWithCompletionHandler { (leaderboards, error) -> Void in
            
            for leaderboard in leaderboards as! [GKLeaderboard] {
                
                if leaderboard.identifier == "circles_touched" {
                
                leaderboard.loadScoresWithCompletionHandler({ (scores, error) -> Void in
                    
                    self.topScoreLabel.text = "\(leaderboard.localPlayerScore.value)"
                    
                    UIView.animateWithDuration(1.4, animations: { () -> Void in
                        
                        self.topScoreLabel.alpha = 1
                    })
                    
                    })
                
                }
            
            }
        }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goButton(sender: UIButton) {
        
       if let gameVC = storyboard?.instantiateViewControllerWithIdentifier("GameVC") as?
            GameViewController{
        
                navigationController?.viewControllers = [gameVC]
        
        }
    }
}



///////// PUT IN VIEW DID LOAD FOR A ANIMATED CIRCLE
//        var button = CircleButton()
//        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        button.center = view.center
//
////        button.fillColor = UIColor.whiteColor()
////        button.backgroundColor = UIColor.whiteColor()
//
//        view.addSubview(button)
//
//        UIView.animateWithDuration(1.0, animations: { () -> Void in
//
//            button.frame.size.width = 200
//            button.frame.size.height = 200
//            button.center = self.view.center
//        })
