//
//  ViewController.swift
//  Lom
//
//  Created by Etienne Jézéquel on 21/06/2015.
//  Copyright © 2015 Etienne Jézéquel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //1 : LOL
    //2 : Easy
    //3 : Normal
    //4 : Hard
    var level: Int = 0
    var timerInt :Float = 0
    var timeStart: Bool = false
    var rand = Int(arc4random_uniform(10))
    var win : Bool = false
    var compteur :Int = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var out: UILabel!
    @IBOutlet weak var entry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(level)
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func update() {
        if(timeStart == true){
            timerInt = timerInt+0.1
            timerLabel.text = String(timerInt)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cleanEntry(sender: UIButton) {
        entry.text = ""
    }
    @IBAction func one(sender: UIButton) {
        entry.text = entry.text! + "1"
    }
    @IBAction func two(sender: UIButton) {
        entry.text = entry.text! + "2"
    }
    @IBAction func three(sender: UIButton) {
        entry.text = entry.text! + "3"
    }
    @IBAction func four(sender: UIButton) {
        entry.text = entry.text! + "4"
    }
    @IBAction func five(sender: UIButton) {
        entry.text = entry.text! + "5"
    }
    @IBAction func six(sender: UIButton) {
        entry.text = entry.text! + "6"
    }
    @IBAction func seven(sender: UIButton) {
        entry.text = entry.text! + "7"
    }
    @IBAction func eigth(sender: UIButton) {
        entry.text = entry.text! + "8"
    }
    @IBAction func nine(sender: UIButton) {
        entry.text = entry.text! + "9"
    }
    @IBAction func zero(sender: UIButton) {
        entry.text = entry.text! + "0"
    }

    @IBAction func startTimer(sender: UIButton) {
        out.text = "Game Started !"
        timeStart = true
    }
    
    @IBAction func tryEntry(sender: UIButton) {
        if(timeStart){
            let myVar = Int(entry.text!)
            if(myVar != nil){
                if plusOuMoins(myVar!){
                    win = true
                    timerLabel.text = ""
                    out.text = "WINNER in \(timerInt)"
//                    self.view.addSubview(bgImage!)
                    timerInt=0
                }
                compteur = compteur + 1
                entry.text = ""
            }
            else {
                out.text = "Enter an integer"
                entry.text = ""
            }
        }
        else{
            out.text = "Press Start"
            entry.text = ""
        }
    }
    
    func plusOuMoins(myVar : Int) -> Bool{
        if myVar < rand {
            out.text = "➕"
            return false;
        }
        else if myVar > rand {
            out.text = "➖"
            return false;
        }
        else {
            return true
        }
    }
    
    //MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let svc = segue.destinationViewController as! ViewController2;
        svc.level = self.level
    }

}

