//
//  ActionAlertController.swift
//  SocialHub
//
//  Created by Team Mobile on 08/11/2018.
//  Copyright © 2018 Team Mobile. All rights reserved.
//

import Foundation
import UIKit

public class ActionAlertController {
    
    public static func alertMessage(reference: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        reference.present(alert, animated: true, completion: nil)
    }
    
    public static func alertMessage(reference: UIViewController, title: String, message: String, action: UIAlertAction) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(action)
        reference.present(alert, animated: true, completion: nil)
    }
    
    public static func backAlertMessage(reference: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        let goBack: UIAlertAction = UIAlertAction(title: "Ok", style: .default) { action -> Void in
            
            if reference.navigationController != nil {
                reference.navigationController!.popViewController(animated: true)
            }
            
            
        }
        
        alert.addAction(goBack)
        reference.present(alert, animated: true, completion: nil)
    }
    
    public static func goBack(navigationController: UINavigationController!) -> UIAlertAction{
        
        let goBack: UIAlertAction = UIAlertAction(title: "Ok", style: .default) { action -> Void in
            if navigationController != nil {
                navigationController.popViewController(animated: true)
            }
        }
        return goBack
    }
}
