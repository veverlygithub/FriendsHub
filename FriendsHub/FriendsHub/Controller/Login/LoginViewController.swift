//
//  LoginViewController.swift
//  SocialHub
//
//  Created by Team Mobile on 21/10/2018.
//  Copyright © 2018 Team Mobile. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import RxCocoa
import RxSegue
import RxSwift
import RxOptional

class LoginViewController: UIViewController, AlertPresenter {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    let rx_disposeBag = DisposeBag()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogin.rx.tap
            .filter { _ in
                self.view.endEditing(true)
                return Validator.validateLogIn(controller: self)
            }
            .subscribe(onNext: {_ in
                Auth.auth().signIn(withEmail: self.emailTF.text!, password: self.passwordTF.text!, completion: { (user, error) in
                    guard let _ = user else {
                        if let error = error {
                            if let errCode = AuthErrorCode(rawValue: error._code) {
                                switch errCode {
                                case .userNotFound:
                                    self.alertMessage(reference: self, title: _AlertTitle.MESSAGE, message: _AlertMessage.Login.ERROR_LOGIN_04)
                                case .wrongPassword:
                                    self.alertMessage(reference: self, title: _AlertTitle.MESSAGE, message: _AlertMessage.Login.ERROR_LOGIN_05)
                                default:
                                    self.alertMessage(reference: self, title: _AlertTitle.ERROR, message: error.localizedDescription)
                                }
                            }
                        }
                        return
                    }
                    self.signIn()
                })
            }).disposed(by: rx_disposeBag)
    

    }
    
    private func signIn() {
        self.alertMessageWithOkAction(reference: self, title: _AlertTitle.MESSAGE, message: "Welcome", result: {
            let messageVC: MessagesViewController = MessagesViewController.instantiate(fromAppStoryboard: .Messages)
            self.navigationController?.present(messageVC, animated: true, completion: nil)
        })
        
    }

    @IBAction func btnForgotPassword(_ sender: UIButton) {
        present(UINavigationController.instantiate(fromAppStoryboard: .ForgotPassword), animated: true, completion: nil)
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        present(UINavigationController.instantiate(fromAppStoryboard: .Registration), animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
