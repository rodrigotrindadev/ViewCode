//
//  RegisterScreen.swift
//  LoginViewCode-Curso
//
//  Created by Rodrigo Trindade on 09/11/21.
//

import UIKit

class RegisterScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackground()
    }
    
    private func configBackground() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
