//
//  TableViewController.swift
//  navigationContorl
//
//  Created by skim on 2015. 11. 23..
//  Copyright © 2015년 skim. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var PageTableView: UITableView!
    var pageDepth:Int=0
    let textCellIdentifier = "cell"
    var tableRow:Int=1
    var choiceRow:Int=1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tableRow = 1
        return self.pageDepth
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        cell.textLabel?.text = String(self.tableRow++)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.choiceRow = indexPath.row
        
        let previousView = self.presentingViewController as! UINavigationController
        let viewControllers: [UIViewController] = previousView.viewControllers as [UIViewController];
        previousView.popToViewController(viewControllers[self.choiceRow], animated: true);
        
        self.dismissViewControllerAnimated(false, completion: nil)
   
    }
    
}

