//
//  VariableCell.swift
//  iosSample
//
//  Created by Vedran Ozir on 31/01/16.
//  Copyright © 2016 Symmetric. All rights reserved.
//

import UIKit

class VariableCell: UITableViewCell {

    @IBOutlet var buttons: [Button]!
   
    var list: UITableView!
    
    var indexPath: NSIndexPath!
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.performSelector(Selector("timer"), withObject: nil, afterDelay: 0.0)
    }
    
    func timer() {
        
        list.beginUpdates()
        
        let width = bounds.size.width
        
        var buttonsToRestore = [Button]()
        
        for button in buttons.reverse() {
            
            if button.hidden {
                
                continue
            }
            
            let systemLayoutSizeFittingSize = self.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
            
            if width > systemLayoutSizeFittingSize.width {
                
                break
            }
            
            button.shouldSplit = true
            
            buttonsToRestore.append(button)
            
            button.setNeedsUpdateConstraints()
        }
        
        if !buttonsToRestore.isEmpty {
            
            // keep (do not restore) only one that helped
            
            buttonsToRestore.removeLast()
            
            for button in buttonsToRestore {
                
                button.shouldSplit = false
                button.setNeedsUpdateConstraints()
            }
        }
        
        list.endUpdates()
    }
    
}
