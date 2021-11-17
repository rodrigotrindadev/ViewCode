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
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterVC: RegisterScreenProtocol {
    
    func actionBackButton() {
        print("Botao Voltar")
        //Voltar para o Login
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        print("Botao Registrar")
    }
}
