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
    var pageNum:Int!
    var currentDeviceOrientation: UIDeviceOrientation = .Unknown
    @IBOutlet var TableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageNum = self.navigationController?.viewControllers.count

        UIDevice.currentDevice().beginGeneratingDeviceOrientationNotifications()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "deviceDidRotate:", name: UIDeviceOrientationDidChangeNotification, object: nil)
        // rotation View
        rotationView()
        
        // Init button
        if (self.pageNum != 1) {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        let myBackButton:UIButton = UIButton(type: UIButtonType.Custom)
        myBackButton.addTarget(self, action: "popToRoot:", forControlEvents: UIControlEvents.TouchUpInside)
        myBackButton.setTitle("처음으로", forState: UIControlState.Normal)
        myBackButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        myBackButton.sizeToFit()
        let myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: myBackButton)
        NavigationView.rightBarButtonItem  = myCustomBackButtonItem
        }
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed:")
        longPressRecognizer.minimumPressDuration = 1.0
        self.view.addGestureRecognizer(longPressRecognizer)
        
        
    }

    func popToRoot(sender:UIBarButtonItem){
        self.navigationController!.popToRootViewControllerAnimated(true)
        rotationView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            UIDevice.currentDevice().orientation == UIDeviceOrientation.PortraitUpsideDown ||
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTable" {
            (segue.destinationViewController as! TableViewController).pageDepth = self.pageNum
        }
    }
    
    func longPressed(sender: UILongPressGestureRecognizer)
    {
        self.performSegueWithIdentifier("showTable", sender: self)
        
        let tableController:TableViewController = TableViewController()
        self.presentViewController(tableController, animated: true, completion: nil)
    }
    
}

