//
//  LogiScreen.swift
//  LoginViewCode-Curso
//
//  Created by Rodrigo Trindade on 02/11/21.
//

import UIKit

//Criar um protocol para fazer nossa ViewController ser nossa assinante
protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol? //criar uma função get para ter acesso a ela
    
    func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }

    //lazy só é lido quando chama ele em um determinado lugar, nada será lido se não chamar
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image = UIImage(named: "whatsapp_logo") //nome da imagem a se chamada no assets
            image.tintColor = .green
            image.contentMode = .scaleAspectFit //contentMode serve para setar se quer preencher, ajustar na tela etc...
            //image.backgroundColor = .blue //recomenda-se para testar se ficou no local certo
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let tF = UITextField()
        tF.translatesAutoresizingMaskIntoConstraints = false //para poder respeitar nossas constraints
        tF.autocorrectionType = .no //desativar a correção das palavras
        tF.backgroundColor = .white
        tF.borderStyle = .roundedRect
        tF.keyboardType = .emailAddress
        tF.placeholder = "Digite seu e-mail"
        tF.textColor = .darkGray
        return tF
    }()
    
    lazy var passwordTextField: UITextField = {
        let tF = UITextField()
        tF.translatesAutoresizingMaskIntoConstraints = false //para poder respeitar nossas constraints
        tF.autocorrectionType = .no //desativar a correção das palavras
        tF.backgroundColor = .white
        tF.borderStyle = .roundedRect
        tF.keyboardType = .default
        tF.isSecureTextEntry = true
        tF.placeholder = "Digite sua senha"
        tF.textColor = .darkGray
        return tF
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(displayP3Red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)//serve para pegar ações, ele chama a func que cria a ação do clique do botão
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)//serve para pegar ações, ele chama a func que cria a ação do clique do botão
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackground()
        self.configSuperView()
        self.setUpConstraints()
    }
    
    private func configBackground(){
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    private func configSuperView(){ //adiciona elas na View
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
//    cria a ação do clique do botão chamada pelo button.addTarget
    @objc private func tappedLoginButton() {
        self.delegate?.actionLoginButton()
    }
    
//    cria a ação do clique do botão chamada pelo button.addTarget
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //equalTo: basear em um determinado elemento
    //constant: me afastar/aproximar do elemento referente(equalTo)
    //equalToConstant: setando um valor fixo para um determinado elemento
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 200),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 15),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor)
            
        ])
        
    }

}
