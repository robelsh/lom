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
    var newGame: Bool = true
    var compteur :Int = 0
    var score: [String:Float] = ["Jean Bon" : 30, "michel Seguin": 40]
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var out: UILabel!
    @IBOutlet weak var entry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
        //Try score
        //score = ["Jean Bon" : 30, "michel Seguin": 40]
    
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
        timeStart = !timeStart
        if(timeStart){
            out.text = "Game Started !"
            if(newGame){
                switch level {
                case 0:
                    rand = Int(arc4random_uniform(10))
                case 1 :
                    rand = Int(arc4random_uniform(500))
                case 2 :
                    rand = Int(arc4random_uniform(1000))
                case 3 :
                    rand = Int(arc4random_uniform(5000))
                case 4 :
                    rand = Int(arc4random_uniform(10000))
                default:
                    break
                }
                newGame = false
            }
            print(rand)
            timeStart = true
        }
        else{
            timeStart = false
            out.text = "Game Paused !"
        }
        
    }
    
    @IBAction func tryEntry(sender: UIButton) {
        if(timeStart){
            let myVar = Int(entry.text!)
            if(myVar != nil){
                if plusOuMoins(myVar!){
                    timeStart = false
                    timerLabel.text = ""
                    win = true
                    score = ["test":timerInt]
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
    
    @IBAction func restart(sender: UIButton) {
        if(!timeStart){
            timerLabel.text = ""
            newGame = true
            timerInt = 0
            out.text = "Game Restarted !"
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
        if(segue.destinationViewController.isMemberOfClass(ViewController2)){
            let svc = segue.destinationViewController as! ViewController2;
            svc.level = self.level
            svc.score = self.score
        }
        
        else if(segue.destinationViewController.isMemberOfClass(ViewController3)){
            let svc = segue.destinationViewController as! ViewController3;
            svc.level = self.level
            svc.score = self.score
        }
    }

}

