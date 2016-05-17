//
//  SetupDefaults.swift
//  Example
//
//  Created by Paige Sun on 2016-05-14.
//  Copyright © 2016 Xmartlabs. All rights reserved.
//

import Foundation
import Eureka

extension FormViewController {
    
    func initializeColors(customTint: UIColor) {
        print("Init for checkrow")
        
        URLRow.defaultCellUpdate = { cell, row in cell.textField.textColor = .blueColor() }

        DateRow.defaultRowInitializer = { row in row.minimumDate = NSDate() }
        
        // MARK: My own testing
        /* The defaults are called in this order: Initializer -> Setup -> Update
         Then tapping the row calls: Highlight and/or Selection?
         * Some rows don't have default on cell highlight: i.e. LabelRow
         */
        LabelRow.defaultRowInitializer = { row in
            print("default ROW initializer")
        }
        LabelRow.defaultCellSetup = { cell, row in
            print("default CELL setup")
            cell.detailTextLabel?.textColor = customTint
        }
        LabelRow.defaultCellUpdate = { cell, row in
            print("default CELL UPDATE 1")
            // cell.detailTextLabel?.textColor = .blueColor() // Will override previous .orangeColor
            // Use Update instead of Setup if cell depends on variables not present on cell creation time.
        }
        LabelRow.defaultOnCellHighlight = { cell, row in print("default on cell highlight")}
        LabelRow.defaultOnCellUnHighlight = { cell, row in print("default on cell UNhighlight")}
        
        CheckRow.defaultCellUpdate = { cell, row in
            // cell.textLabel?.backgroundColor = UIColor.greenColor()
            // cell.detailTextLabel?.backgroundColor = UIColor.blueColor()
            // cell.layer.backgroundColor = UIColor.cyanColor()
                   cell.tintColor = .blueColor()   // The checkbox to the right
        }
        
        
    }
}
////
//public class FormViewController {
//    
//}
