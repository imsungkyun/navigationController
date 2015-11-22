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
    var pageNum:Int = 1
    var currentDeviceOrientation: UIDeviceOrientation = .Unknown

    override func viewDidLoad() {
        super.viewDidLoad()

        UIDevice.currentDevice().beginGeneratingDeviceOrientationNotifications()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "deviceDidRotate:", name: UIDeviceOrientationDidChangeNotification, object: nil)

        // Do any additional setup after loading the view, typically from a nib.
        if let label = data {
            self.pageNum = data!

            // rotation View
            rotationView()
            
            // back button
            let backNum:String = String(self.pageNum - 1)
            print("*****")
            print(backNum)
//            NavigationView.backBarButtonItem!.title = (backNum)
           
            let backItem = UIBarButtonItem(title: "back", style: .Plain, target: self, action: "pageRefresh:")
            NavigationView.backBarButtonItem = backItem
            
            
            
            // Init button
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            let myBackButton:UIButton = UIButton(type: UIButtonType.Custom)
            myBackButton.addTarget(self, action: "popToRoot:", forControlEvents: UIControlEvents.TouchUpInside)
            myBackButton.setTitle("처음으로", forState: UIControlState.Normal)
            myBackButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            myBackButton.sizeToFit()
            let myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: myBackButton)
            NavigationView.rightBarButtonItem  = myCustomBackButtonItem
            
        }
    }
    func pageRefresh(sender: UIBarButtonItem) {
        print("22222222")
    }
    /*
    override func didMoveToParentViewController(parent: UIViewController?) {
        super.didMoveToParentViewController(parent)
        
        if parent == nil{
           // print("Back Button pressed.")
           // print(pageNum)
            self.pageNum--
           // print(pageNum)
           // print("-----")
        }
        
    }
    */
    func popToRoot(sender:UIBarButtonItem){
        self.pageNum = 1
        self.navigationController!.popToRootViewControllerAnimated(true)
    }

    /*
    override func willMoveToParentViewController(parent: UIViewController?) {
        super.willMoveToParentViewController(parent)
        if parent == nil {
         //   --pageNum
         //   print("_____")
         //   print(pageNum)
        }
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Push") {
            print("+++++")
            print(pageNum)
            (segue.destinationViewController as! ViewController).data = ++self.pageNum
            print(pageNum)
            print("+++++++")
        }
    }
    var numSet = ["영", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
    var unit = ["십", "백", "천"]
 //   var unit2 = ["만", "억", "조"]
    func translate_label (intText:Int)->String {
        var stringText:String
        var outputText:String = ""
        stringText = String(intText)
        let textLen = stringText.characters.count
        if (textLen < 5) {
            var i:Int=0
            for idx in stringText.characters.indices {
                let unit_check:Int = textLen - i
                let numInt:Int = Int(String(stringText[idx]))!
                if (numInt > 1) || ((unit_check == 1) && (numInt == 1)) {
                    outputText = outputText + numSet[numInt]
                }
                
                if (unit_check == 4) {
                    outputText = outputText + unit[2]
                }
                else if(unit_check == 3) {
                    outputText = outputText + unit[1]
                }
                else if (unit_check == 2) {
                    outputText = outputText + unit[0]
                }
                i++
            }

        }
        print(outputText)
        
        return outputText
    }
    
    func deviceDidRotate(notification: NSNotification) {
        self.currentDeviceOrientation = UIDevice.currentDevice().orientation
        rotationView()
    }
    func rotationView() {
        if (UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeLeft ||
            UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeRight ||
            UIDevice.currentDevice().orientation == UIDeviceOrientation.Unknown) {
            
            let hangle = translate_label(self.pageNum)
            ViewLable.text = String(hangle)
            NavigationView.title = String(hangle)
        }
        else {
            ViewLable.text = String(self.pageNum)
            NavigationView.title = String(self.pageNum)
        }
    }

}

