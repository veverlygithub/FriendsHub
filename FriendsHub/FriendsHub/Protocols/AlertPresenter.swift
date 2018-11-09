//
//  AlertPresenter.swift
//  SocialHub
//
//  Created by Team Mobile on 06/11/2018.
//  Copyright © 2018 Team Mobile. All rights reserved.
//

import Foundation
import UIKit

protocol AlertPresenter {
    func alertMessage(reference: UIViewController, title: String, message: String)
    func alertMessageWithOkAction(reference: UIViewController, title: String, message: String, result: @escaping () -> ())
    func alertMessageWithOkCancelAction(reference: UIViewController, title: String, message: String, result: @escaping () -> ())
    func alertMessageSMS(reference: UIViewController, title: String, message: String, result: @escaping () -> ())
    func alertInputContactNumber(reference: UIViewController, title: String, message: String, result: @escaping (String) -> ())
}

protocol AlertLogoutPresenter {
    func alertMessageWithActionLogout(reference: UIViewController, title: String, message: String, result: @escaping (UIViewController) -> ())
}

extension AlertPresenter where Self: UIViewController {
    func alertMessage(reference: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        reference.present(alert, animated: true, completion: nil)
    }
    
    func alertMessageWithOkAction(reference: UIViewController, title: String, message: String, result: @escaping () -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            result()
        }))
        
        reference.present(alert, animated: true, completion: nil)
    }
    
    func alertMessageWithOkCancelAction(reference: UIViewController, title: String, message: String, result: @escaping () -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            result()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        reference.present(alert, animated: true, completion: nil)
    }
    
    func alertMessageSMS(reference: UIViewController, title: String, message: String, result: @escaping () -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            result()
        }))
        alert.addAction(UIAlertAction(title: "Not Now", style: .cancel, handler: nil))
        
        reference.present(alert, animated: true, completion: nil)
    }
    
    func alertInputContactNumber(reference: UIViewController, title: String, message: String, result: @escaping(String) -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let save = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            result(alert.textFields![0].text!)
        })
        save.isEnabled = false
        alert.addTextField { textField in
            textField.keyboardType = .numberPad
            NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidChange, object: textField, queue: OperationQueue.main) { (notification) in
                save.isEnabled = alert.textFields!.count > 0
            }
        }
        
        alert.addAction(save)
        reference.present(alert, animated: true, completion: nil)
    }
}


extension AlertLogoutPresenter {
    func alertMessageWithActionLogout(reference: UIViewController, title: String, message: String, result: @escaping (UIViewController) -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { (_) in
            result(reference)
        }))
        reference.present(alert, animated: true, completion: nil)
    }
}
