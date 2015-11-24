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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("stats")
        print(self.navigationController?.viewControllers.count)
        // Do any additional setup after loading the view, typically from a nib.
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
}

