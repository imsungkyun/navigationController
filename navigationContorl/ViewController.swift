//
//  ViewController.swift
//  navigationContorl
//
//  Created by skim on 2015. 11. 3..
//  Copyright © 2015년 skim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var ViewLable: UILabel!
    @IBOutlet var NavigationView: UINavigationItem!
    var data:Int?
    var pageNum = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let label = data {
            pageNum = data!
            var text:String
            text = String(pageNum)
            print(text)
            print(text.characters.count)
            let tmptext = split(text) {$0 == ""}
            
            ViewLable.text = String(pageNum)
            NavigationView.title = String(pageNum)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "PushSecond") {
            (segue.destinationViewController as! SecondViewController).data = ++pageNum
        }
    }
    var numSet = ["일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
    var unit = ["십", "백", "천"]
    var unit2 = ["만", "억", "조"]
    func traslate_label (intText:Int)->String {
        var stringText:String
        var outputText:String
        stringText = String(intText)
        let textLen = stringText.characters.count
        print("SKIM")
       // stringText.
        if (textLen < 5) {
          //  for character in stringText {
                
          //  }
            for i in 0..<textLen {
                let unit_check:Int = textLen - i
//                let num_check:Int = Int(stringText[0])
//                if unit_check == 4 {
//                    outputText[0] = num[]
//                }
//                if Int(stringText[0]) != 1 {
                    
//                }
            }
        }
        
        if (intText < 1000) {
            
        
        }
        return "aa"
    }
    
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        
        print("SKIM")
    }
}

