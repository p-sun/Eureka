//
//  PhoneFormatter.swift
//  Eureka
//
<<<<<<< HEAD
//  Created by Paige Sun on 5/8/16.
=======
//  Created by Paige Sun on 5/7/16. Test-1 branch
>>>>>>> Test3-Branch
//  Copyright © 2016 Xmartlabs. All rights reserved.
//

import Foundation

public class PhoneFormatter : NSFormatter, FormatterProtocol {
    
    override public func getObjectValue(obj: AutoreleasingUnsafeMutablePointer<AnyObject?>, forString string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>) -> Bool {
        guard obj != nil else { return false }
        let str = string.componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet).joinWithSeparator("")
        obj.memory = str
        return true
    }
    
<<<<<<< HEAD
    override public func stringForObjectValue(objj: AnyObject) -> String? {
        if (objj is String) {
            let oldString = (objj as! String)
=======
    override public func stringForObjectValue(objk: AnyObject) -> String? {
        if (objk is String) {
            let oldString = (objk as! String)
>>>>>>> Test3-Branch
            return getNewFormattedString(oldString)
        } else {
            return nil
        }
    }
    
    // Called if $0.userFormatterDuringInput = true. Figuring out the new position requires complicated cases for figuring out the new offsets. Commented out for now.
    public func getNewPosition(forPosition position: UITextPosition, inTextInput textInput: UITextInput, oldValue: String?, newValue: String?) -> UITextPosition {
        
//        print("position")
//        print((newValue?.characters.count ?? 0) - (oldValue?.characters.count ?? 0))
//        
        let offset = ((newValue?.characters.count ?? 0) - (oldValue?.characters.count ?? 0))
//        if offset == 1 {
//            offset = 0
//        }
        
//        let k = textInput.positionFromPosition(position, offset: offset) ?? position
        
        return textInput.positionFromPosition(position, offset: offset) ?? position
    }
    
    private func getNewFormattedString (oldString: String) -> String {
        
        let oldString = oldString as NSString
        let length = oldString.length
        let formattedString = NSMutableString()
        var index = 0 as Int
        
        let hasLeadingOne = oldString.hasPrefix("1")
        if hasLeadingOne
        {
            formattedString.appendString("1 ")
            index += 1
        }
        
        if (length - index) > 2
        {
            let areaCode = oldString.substringWithRange(NSMakeRange(index, 3))
            formattedString.appendFormat("(%@) ", areaCode)
            index += 3
        }
        if length - index > 2
        {
            let prefix = oldString.substringWithRange(NSMakeRange(index, 3))
            formattedString.appendFormat("%@-", prefix)
            index += 3
        }
        let remainder = oldString.substringFromIndex(index)
        formattedString.appendString(remainder)
        
        return formattedString as String
    }
    
}