//
//  RegisterVC.swift
//  LoginViewCode-Curso
//
//  Created by Rodrigo Trindade on 09/11/21.
//

import UIKit

class RegisterVC: UIViewController {

    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
