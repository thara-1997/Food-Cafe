//
//  RegistereViewController.swift
//  Food  Cafe
//
//  Created by Thathsarani Nayanathara  on 1/26/23.
//

import UIKit
import Combine

class RegistereViewController: UIViewController {

    private var viewModel = AuthenticationViewViewModel()
    private var subscriptions: Set<AnyCancellable> = []
        
        private let registerTitleLabel: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Create your account"
            label.font = .systemFont(ofSize: 32, weight: .bold)
            return label
        }()
    
//    private let userNameTextField: UITextField = {
//       let textField = UITextField()
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.keyboardType = .emailAddress
//        textField.attributedPlaceholder = NSAttributedString(
//            string: "Full Name",
//            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
//        )
//        return textField
//    }()
//
//    private let ageTextField: UITextField = {
//       let textField = UITextField()
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.keyboardType = .emailAddress
//        textField.attributedPlaceholder = NSAttributedString(
//            string: "Age",
//            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
//        )
//        return textField
//    }()
//
//    private let weightTextField: UITextField = {
//       let textField = UITextField()
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.keyboardType = .emailAddress
//        textField.attributedPlaceholder = NSAttributedString(
//            string: "Weight",
//            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
//        )
//        return textField
//    }()
    
        private let emailTextField: UITextField = {
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
        
        private let registerButton: UIButton = {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Create account", for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            button.backgroundColor = .systemGreen
            button.layer.masksToBounds = true
            button.tintColor = .white
            button.layer.cornerRadius = 25
            button.isEnabled = false
            return button
        }()
    
      private let AvatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 30, width: 50, height: 50))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "junk")
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
            self?.registerButton.isEnabled = validationState
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
        
    @objc private func didTapToDismiss(){
        view.endEditing(true)
    }

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
//            view.addSubview(userNameTextField)
//            view.addSubview(ageTextField)
//            view.addSubview(weightTextField)
            view.addSubview(registerTitleLabel)
            view.addSubview(emailTextField)
            view.addSubview(passwordTextField)
            view.addSubview(registerButton)
            view.addSubview(AvatarImageView)
            registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
            configureConstraints()
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
            bindViews()
            
        }
        
    @objc private func didTapRegister() {
        viewModel.createUser()
    }

        private func configureConstraints ()
        {
            let registerTitleLabelConstraints = [
                registerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                registerTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
                
            ]
//
//            let userNameTextFieldConstraints = [
//                userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
//                userNameTextField.topAnchor.constraint(equalTo: registerTitleLabel.bottomAnchor, constant: 20),
//                userNameTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
//                userNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                userNameTextField.heightAnchor.constraint(equalToConstant:  60)
//
//            ]
//            let ageTextFieldConstraints = [
//                ageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
//                ageTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20),
//                ageTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
//                ageTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                ageTextField.heightAnchor.constraint(equalToConstant:  60)
//
//            ]
//            let weightTextFieldConstraints = [
//                weightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
//                weightTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 20),
//                weightTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
//                weightTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                weightTextField.heightAnchor.constraint(equalToConstant:  60)
//
//            ]
            let emailTextFieldConstraints = [
                emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
                emailTextField.topAnchor.constraint(equalTo: registerTitleLabel.bottomAnchor, constant: 20),
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
            
            let registerButtonConstraints = [
                registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
                registerButton.widthAnchor.constraint(equalToConstant: 300),
                registerButton.heightAnchor.constraint(equalToConstant: 50)
            ]
            
            let AvatarImageViewCOnstarints = [
             AvatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             AvatarImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             AvatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             AvatarImageView.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 30)
            ]
            
            NSLayoutConstraint.activate(registerTitleLabelConstraints)
            NSLayoutConstraint.activate(emailTextFieldConstraints)
            NSLayoutConstraint.activate(passwordTextFieldConstraints)
            NSLayoutConstraint.activate(registerButtonConstraints)
            NSLayoutConstraint.activate(AvatarImageViewCOnstarints)
//            NSLayoutConstraint.activate(userNameTextFieldConstraints)
//            NSLayoutConstraint.activate(ageTextFieldConstraints)
//            NSLayoutConstraint.activate(weightTextFieldConstraints)
        }
        


}
