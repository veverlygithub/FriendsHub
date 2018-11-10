//
//  Constants.swift
//  SocialHub
//
//  Created by Team Mobile on 08/11/2018.
//  Copyright © 2018 Team Mobile. All rights reserved.
//

import Foundation

struct _AlertTitle {
    static let MESSAGE = "Message"
    static let ERROR = "ERROR"
}

struct _AlertMessage {
    
    struct Global {
        static let SERVICE_UNAVAILABLE = "Service is temporarily unavailable.  Please try again or contact us."
    }
    
    struct Login {
        static let ERROR_LOGIN_01 = "Please input required fields"
        static let ERROR_LOGIN_02 = "Invalid email."
        static let ERROR_LOGIN_03 = "Invalid password."
        static let ERROR_LOGIN_04 = "User account not found. Try registering"
        static let ERROR_LOGIN_05 = "Incorrect username/password combination."
    }
    
    struct Registration {
        static let ERROR_REGISTRATION_01 = "Please input required fields."
        static let ERROR_REGISTRATION_02 = "Please input valid Email Address."
        static let ERROR_REGISTRATION_03 = "Password must be 8-20 characters long and must contain one digit(0-9) and one lowercase and one uppercase letter."
        static let ERROR_REGISTRATION_04 = "Either your email is invalid or password doesn't match."
        static let ERROR_REGISTRATION_05 = "Password doesn't match."
        static let ERROR_REGISTRATION_06 = "Congrats. You are successfully registered."
    }
    
    struct Analytic {
        static let REGISTRATION = "Registration"
        static let FORGOT_PASSWORD = "Forgot Password"
    }
}
