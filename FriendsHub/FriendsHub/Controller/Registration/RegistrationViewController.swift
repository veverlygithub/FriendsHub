//
//  RegistrationViewController.swift
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

class RegistrationViewController: UIViewController, AlertPresenter {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var reEnterTF: UITextField!
    @IBOutlet weak var btnSignup: UIButton!
    
    let rx_disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSignup.rx.tap
            .filter { _ in
                self.view.endEditing(true)
                return Validator.validateEmailPassword(controller: self)
            }
            .subscribe(onNext: {_ in
                Auth.auth().createUser(withEmail: self.emailTF.text!, password: self.passwordTF.text!, completion: { (user, error) in
                    if error != nil {
                        self.alertMessage(reference: self, title: _AlertTitle.MESSAGE, message: (error?.localizedDescription)!)
                    } else {
                        self.alertMessageWithOkAction(reference: self, title: _AlertTitle.MESSAGE, message: "Successfully Registered", result: {
                            let loginVC: LoginViewController = LoginViewController.instantiate(fromAppStoryboard: .Main)
                            self.navigationController?.pushViewController(loginVC, animated: true)
                        })
                    }
                })
            }).disposed(by: rx_disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
   
    @IBAction func btnCancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
