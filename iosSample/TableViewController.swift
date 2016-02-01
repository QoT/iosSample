//
//  TableViewController.swift
//  iosSample
//
//  Created by Vedran Ozir on 01/02/16.
//  Copyright © 2016 Symmetric. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var list: UITableView!
    
    let dataSource = DataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        list.estimatedRowHeight = 100.0
        
        list.rowHeight = UITableViewAutomaticDimension
    }

    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        list.reloadData()
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        list.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.getRows().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! VariableCell
        
        cell.list = tableView
        cell.indexPath = indexPath
        
        cell.layer.borderColor = UIColor.blackColor().CGColor
        
        let row = dataSource.getRows()[indexPath.row]
        let buttons = dataSource.getButtons(row)
        
        var index = 0

        for button in cell.buttons {
            
            button.hidden = true
            button.setNeedsUpdateConstraints()
        }
        
        for title in buttons {
            
            if index < cell.buttons.count {
                
                let button = cell.buttons[index]
                
                button.setTitle( title, forState: .Normal)
                
                button.hidden = false
                button.setNeedsUpdateConstraints()
            }
            
            index++
        }

        return cell
        
    }
    
}
