//
//  InputValidation.swift
//  EdvoraTestTask
//
//  Created by Lokesh Patil on 29/11/21.
//

import Foundation
enum InputValidation:String {
    case username
    case email
    case password
}

class Validation {
    
    func textValidation(text:String,validationType:InputValidation) -> (Bool,String) {
        
        switch validationType {
        
        case .email:
            return(
                text == "" ? true :
                    Validation().isValidEmail(emaiId: text) == false ? true : false,
                text == "" ? AppConstant.emptyEmail :AppConstant.invalidEmail)
            
        case .password:
            
            if text == "" {
                return(true , AppConstant.emptyPassword)
            }
            else if text.count < 8 {
                return(true , AppConstant.invalidPassword)
            }
            else if isValidPassword(password:text) == false {
                return(true , AppConstant.invalidFormatPassword)
            }
            else{
                return(false , "")
            }
            
        case .username:
            if text == "" {
                return(true , AppConstant.emptyUsername)
            }
            else if text.hasWhiteSpace == true {
                return(true , AppConstant.spaceinUsername)
            }
            else if  checkCapitalLatter(text: text) == true {
                return(true , AppConstant.invaliedUsername)
            }
            else{
                return(false , "")
            }
        }
    }
    
    // Email Validations
    func isValidEmail(emaiId:String) -> Bool {
        let emailRegEx = NSPredicate(format: "SELF MATCHES %@",
                                     "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailRegEx.evaluate(with: emaiId)
    }
    
    // Passwords Validations
    
    func isValidPassword(password:String) -> Bool{
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
    
    // Capital Characters Validations
    
    func checkCapitalLatter(text : String) -> Bool{
        
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: text)
        print("\(capitalresult)")
        
        return capitalresult
        
    }
}


