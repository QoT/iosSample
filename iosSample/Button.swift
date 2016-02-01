//
//  Button.swift
//  iosSample
//
//  Created by Vedran Ozir on 31/01/16.
//  Copyright © 2016 Symmetric. All rights reserved.
//

import UIKit

class Button: UIButton {

    @IBOutlet var nextLineConstraints: [NSLayoutConstraint]!
    @IBOutlet var firstLineConstraints: [NSLayoutConstraint]!

    var shouldSplit = false
    
    var activeConstraintsInitial = [NSLayoutConstraint]()
    
    static let textInset: CGFloat = 10.0
    
    override func intrinsicContentSize() -> CGSize {
        
        var size = super.intrinsicContentSize()
        
        size.width += 2 * Button.textInset
        
        return size
    }
    
    override func updateConstraints() {
        
        if hidden && firstLineConstraints != nil {
            
            if let firstLineConstraints = firstLineConstraints {
            
                for firstLineConstraint in firstLineConstraints {
                    
                    firstLineConstraint.active = true
                }
            }
            
        }
        else if shouldSplit {
            
            if let nextLineConstraints = nextLineConstraints {
                
                for nextLineConstraint in nextLineConstraints {
                    
                    nextLineConstraint.active = true
                }
            }
        }

        // restore
            
        else {
            
            if let nextLineConstraints = nextLineConstraints {
                
                for nextLineConstraint in nextLineConstraints {
                    
                    nextLineConstraint.active = false
                }
            }
        }
        
        super.updateConstraints()
    }

}
