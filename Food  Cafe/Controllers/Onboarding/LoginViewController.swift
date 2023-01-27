//
//  LoginViewController.swift
//  Food  Cafe
//
//  Created by Thathsarani Nayanathara  on 1/20/23.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    
    private var viewModel = AuthenticationViewViewModel()
    private var subscriptions: Set<AnyCancellable> = []
    
    private let AvatarImageView: UIImageView = {
      let imageView = UIImageView(frame: CGRect(x: 20, y: 30, width: 50, height: 50))
      imageView.contentMode = .scaleAspectFit
      imageView.image = UIImage(named: "spag")
      imageView.clipsToBounds = true
      imageView.layer.masksToBounds = true
      imageView.layer.cornerRadius = 40
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    private let LoginTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login to your account"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private let emailTextField:UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        return textField
    }()
    
    private let passwordTextField:UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let LoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .systemGreen
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.isEnabled = false
        return button
    }()
    
    @objc private func didChangeEmailField() {
        viewModel.email = emailTextField.text
        viewModel.validateAuthenticationForm()
    }
    
    @objc private func didChangePasswordField() {
        viewModel.password = passwordTextField.text
        viewModel.validateAuthenticationForm()
    }
    
    private func bindViews(){
        emailTextField.addTarget(self, action: #selector(didChangeEmailField), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(didChangePasswordField), for: .editingChanged)
        viewModel.$isAuthenticationFormValid.sink { [weak self] validationState in
            self?.LoginButton.isEnabled = validationState
        }
        .store(in: &subscriptions)
        
        viewModel.$user.sink { [weak self] user in
            guard user != nil else { return }
            guard let vc = self?.navigationController?.viewControllers.first as? OnboardingViewController else { return }
            vc.dismiss(animated: true)
        }
        .store(in: &subscriptions)
        
        viewModel.$error.sink { [weak self] errorString in
            guard let error = errorString else { return }
            self?.presentAlert(with: error)
        }
        .store(in: &subscriptions)
    }
    private func presentAlert(with error: String){
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okayButton)
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(LoginTitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(LoginButton)
        view.addSubview(AvatarImageView)
        LoginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        configureConstraints()
        bindViews()

        
    }
    
    @objc func didTapLogin(){
        viewModel.loginUser()
    }
    
    private func  configureConstraints(){
        let AvatarImageViewCOnstarints = [
            AvatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
         AvatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         AvatarImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
         AvatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
         
        ]
        
        let loginTitleLabelConstraints = [
            LoginTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            LoginTitleLabel.topAnchor.constraint(equalTo: AvatarImageView.bottomAnchor, constant: 50),
           
            
        ]
        
        let emailTextFieldConstraints = [
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            emailTextField.topAnchor.constraint(equalTo: LoginTitleLabel.bottomAnchor, constant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant:  60)
            
        ]
        
        let passwordTextFieldConstraints = [
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant:  60)
            
        ]
        
        let loginButtonConstraints = [
            LoginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            LoginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            LoginButton.widthAnchor.constraint(equalToConstant: 300),
            LoginButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(AvatarImageViewCOnstarints)
        NSLayoutConstraint.activate(loginTitleLabelConstraints)
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(loginButtonConstraints)
    }
    
}

