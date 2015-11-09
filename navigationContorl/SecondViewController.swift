//
//  SecondViewController.swift
//  navigationContorl
//
//  Created by skim on 2015. 11. 3..
//  Copyright © 2015년 skim. All rights reserved.
//
//
//  ViewController.swift
//  navigationContorl
//
//  Created by skim on 2015. 11. 3..
//  Copyright © 2015년 skim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var NavigationSecond: UINavigationItem!
    @IBOutlet var SecondViewLable: UILabel!
    var data:Int?
    var pageNum:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let label = data {
            pageNum = data!
            var text:String
            text = String(pageNum)
            print(text)
            print(text.characters.count)
            SecondViewLable.text = String(pageNum)
            NavigationSecond.title = String(pageNum)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "PushFirst") {
            //pageNum++
            (segue.destinationViewController as! ViewController).data = ++pageNum
        }
    }
}

