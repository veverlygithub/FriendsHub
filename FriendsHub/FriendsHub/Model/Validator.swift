//
//  Validator.swift
//  SocialHub
//
//  Created by Team Mobile on 06/11/2018.
//  Copyright © 2018 Team Mobile. All rights reserved.
//

import Foundation
import UIKit

public class Validator {
    //VALIDATE EMAIL
    public static func isValidEmail(testStr:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let result = emailTest.evaluate(with: testStr)
        return !result
        
    }
    
    class func isPasswordInvalid(controller: UIViewController,text : String) -> Bool {
        
        
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: text)
        
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = texttest1.evaluate(with: text)
    
        let smallLetterRegEx  = ".*[a-z]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", smallLetterRegEx)
        let smallResult = texttest2.evaluate(with: text)

        
        if !capitalresult {
            ActionAlertController.alertMessage(reference: controller, title: _AlertTitle.MESSAGE, message: _AlertMessage.Registration.ERROR_REGISTRATION_03)
            return false
        } else if !numberresult {
            ActionAlertController.alertMessage(reference: controller, title: _AlertTitle.MESSAGE, message: _AlertMessage.Registration.ERROR_REGISTRATION_03)
            return false
        } else if !smallResult {
            ActionAlertController.alertMessage(reference: controller, title: _AlertTitle.MESSAGE, message: _AlertMessage.Registration.ERROR_REGISTRATION_03)
            return false
        } else {
            return true
        }
    }
    
    class func validateEmailPassword(controller: RegistrationViewController) -> Bool {
        if let username = controller.emailTF.text, let password = controller.passwordTF.text, let confirmPassword = controller.reEnterTF.text {
            if username.isEmpty || password.isEmpty || confirmPassword.isEmpty {
                ActionAlertController.alertMessage(reference: controller, title: _AlertTitle.MESSAGE, message: _AlertMessage.Registration.ERROR_REGISTRATION_01)
                print("Empty")
            } else if Validator.isPasswordInvalid(controller: controller, text: password) == false {
            } else if password != confirmPassword || Validator.isValidEmail(testStr: username) {
                ActionAlertController.alertMessage(reference: controller, title: _AlertTitle.MESSAGE, message: _AlertMessage.Registration.ERROR_REGISTRATION_05)
                print("Invalid")
            } else {
                return true
            }
        }
        
        return false
    }
}
