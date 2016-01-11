//
//  ViewController2.swift
//  Lom
//
//  Created by Etienne Jézéquel on 21/06/2015.
//  Copyright © 2015 Etienne Jézéquel. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    //1 : LOL
    //2 : Easy
    //3 : Normal
    //4 : Hard
    var level: Int!
    var score: [String:Float]!
    @IBOutlet weak var levelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLevel()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateLevel(){
        levelLabel.text = "Actual Level : \(level)"
    }
    
    @IBAction func level0(sender: UIButton) {
        level = 0
        updateLevel()
    }
    
    @IBAction func level1(sender: UIButton) {
        level = 1
        updateLevel()
    }

    @IBAction func level2(sender: UIButton) {
        level = 2
        updateLevel()
    }
    
    @IBAction func level3(sender: UIButton) {
        level = 3
        updateLevel()
    }
    
    @IBAction func level4(sender: UIButton) {
        level = 4
        updateLevel()
    }
    
     //MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
            let svc = segue.destinationViewController as! ViewController;
            svc.level = self.level
        }

}
