//
//  ViewController3.swift
//  Lom
//
//  Created by Etienne Jézéquel on 25/06/2015.
//  Copyright © 2015 Etienne Jézéquel. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    var level: Int!
    var score: [String:Float]!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var score2: UILabel!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var score3: UILabel!
    @IBOutlet weak var score4: UILabel!
    @IBOutlet weak var score5: UILabel!
    @IBOutlet weak var name3: UILabel!
    @IBOutlet weak var name4: UILabel!
    @IBOutlet weak var name5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelLabel.text = "  Actual Level : \(level)"
        var dicName = [name1,name2,name3,name4,name5]
        var dicScore = [score1,score2,score3,score4,score5]
        var compteur:Int = 0
        for (cle, valeur) in score {
            print("cle \(cle) valeur \(valeur)")
            dicName[compteur].text = cle
            let score = valeur as NSNumber
            dicScore[compteur].text = score.stringValue
            compteur++
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let svc = segue.destinationViewController as! ViewController;
        svc.score = self.score
    }


}
