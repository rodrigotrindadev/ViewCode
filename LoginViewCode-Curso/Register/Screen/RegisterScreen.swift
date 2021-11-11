//
//  RegisterScreen.swift
//  LoginViewCode-Curso
//
//  Created by Rodrigo Trindade on 09/11/21.
//

import UIKit

class RegisterScreen: UIView {
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        //descomente abaixo para testar o alinhamento
//        button.backgroundColor = .red
        return button
    }()
    
    lazy var imageAddUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "usuario")
        image.contentMode = .scaleAspectFit
        //descomente abaixo para testar o alinhamento
//        image.backgroundColor = .red
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackground()
        self.configSuperView()
        self.setUpConstraints()
    }
    
    private func configSuperView() {
        self.addSubview(self.backButton)
        self.addSubview(self.imageAddUser)
    }
    
    private func configBackground() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            //Imagem
            
            //Na linha abaixo estamos se baseando na nossa safearea com distância de 20 do topo
            self.imageAddUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            //Na linha abaixo estamos mantendo ela centralizada na View
            self.imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            //Nas duas linhas abaixo estamos mantendo a largura e altura dela fixa
            self.imageAddUser.widthAnchor.constraint(equalToConstant: 150),
            self.imageAddUser.heightAnchor.constraint(equalToConstant: 150),
            
            //Botão
            //Na linha abixo estou falando que o botão vai ter a mesma altura que minha imagem, se alterar a altura da minha o botão vai acompanhar
            self.backButton.topAnchor.constraint(equalTo: self.imageAddUser.topAnchor),
            //Na linha abaixo estou falando que ele se baseie na nossa Leadin Anchor a esquerda, coloco uma distancia de 20 para não ficar agarrado
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            
        
        ])
    }
    
}
