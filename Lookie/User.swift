//
//  User.swift
//  Lookie!
//
//  Created by PATRICK PERINI on 8/20/15.
//  Copyright (c) 2015 AppCookbook. All rights reserved.
//

import UIKit
import Parse

class User: PFUser, PFSubclassing {
    // MARK: Constants
    static let EmailRegex = NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
        options: nil,
        error: nil)!
    static let PhoneRegex = NSRegularExpression(pattern: "^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}$",
        options: nil,
        error: nil)!
    static let AdulthoodAge = 16
    
    // MARK: Parse Properties
    @NSManaged var pName: String
    @NSManaged var pEmoji: String
    @NSManaged var pBirthYear: Int
    @NSManaged var pFamilies: NSMutableArray //[String]
    
    // MARK: Properties
    var name: String { return self.pName }
    var birthYear: Int { return self.pBirthYear }
    var identifier: String { return self.username! }
    var emoji: String { return self.pEmoji }
    
    var isAdult: Bool {
        let year = NSCalendar.currentCalendar().component(NSCalendarUnit.CalendarUnitYear,
            fromDate: NSDate())
        
        return (year - User.AdulthoodAge) > self.birthYear
    }
    
    var hasFamilies: Bool {
        return self.pFamilies.count > 0
    }
    
    // MARK: Initializers
    override init() {
        super.init()
    }
    
    init(name: String, emoji: String, birthYear: Int, identifier: String) {
        super.init()
        
        self.pName = name
        self.pEmoji = emoji
        self.pBirthYear = birthYear
        self.pFamilies = NSMutableArray()
        
        self.username = identifier
        self.password = NSUUID().UUIDString
    }
    
    // MARK: Accessors
    func addFamily(identifier: String) {
        self.pFamilies.addObject(identifier)
    }

    // MARK: Class Accessors
    class func identifierIsValid(identifier: String) -> Bool {
        let length = identifier.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
        
        let validEmail = EmailRegex.firstMatchInString(identifier,
            options: nil,
            range: NSMakeRange(0, length)) != nil
        let validPhone = PhoneRegex.firstMatchInString(identifier,
            options: nil,
            range: NSMakeRange(0, length)) != nil
        
        return validEmail || validPhone
    }
}