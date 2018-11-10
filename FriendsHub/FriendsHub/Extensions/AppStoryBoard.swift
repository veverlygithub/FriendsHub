//
//  AppStoryBoard.swift
//  SocialHub
//
//  Created by Team Mobile on 08/11/2018.
//  Copyright © 2018 Team Mobile. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryBoard: String {
    
    case Main
    case Messages
    case Registration
    case ForgotPassword
    
    
    var instance : UIStoryboard {
        
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard")
        }
        
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class var storyboardID : String {
        
        return "\(self)ID"
        
        // return String(reflecting: self).components(separatedBy: ".").last!
        // return "\(type(of:self))".components(separatedBy: ".").first!
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryBoard) -> Self {
        
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
