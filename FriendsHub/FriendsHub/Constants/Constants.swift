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
}

struct _AlertMessage {
    
    struct Global {
        static let SERVICE_UNAVAILABLE = "Service is temporarily unavailable.  Please try again or contact us."
    }
    
    struct Login {
        static let invalidEmail = "Invalid email."
        static let invalidPassword = "Invalid password."
    }
    
    struct Registration {
        static let ERROR_REGISTRATION_01 = "Please input required feilds."
        static let ERROR_REGISTRATION_02 = "Please input valid Email Address."
        static let ERROR_REGISTRATION_03 = "Password must be 8-20 characters long and must contain one digit(0-9) and one lowercase and one uppercase letter."
        static let ERROR_REGISTRATION_04 = "Either your email is invalid or password doesn't match."
        static let ERROR_REGISTRATION_05 = "Password doesn't match."
    }
}
