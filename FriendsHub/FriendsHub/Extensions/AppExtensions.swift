//
//  AppExtensions.swift
//  FriendsHub
//
//  Created by Team Mobile on 09/11/2018.
//  Copyright © 2018 Team Mobile. All rights reserved.
//

import Foundation
import RxSwift

extension UIViewController {
    var currentMonth: Int {
        return Calendar(identifier: Calendar.Identifier.gregorian).component(.month, from: Date())
    }
    
    var currentYear: Int {
        return Calendar(identifier: Calendar.Identifier.gregorian).component(.year, from: Date())
    }
    
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
