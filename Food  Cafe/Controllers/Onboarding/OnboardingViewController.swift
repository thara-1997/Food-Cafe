//
//  OnboardingViewController.swift
//  Food  Cafe
//
//  Created by Thathsarani Nayanathara  on 1/26/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private let AvatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 30, width: 50, height: 50))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "FooImage")
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let welcomeLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.text = "Healthy Habits for a Better Life..."
            label.font = .systemFont(ofSize: 32, weight: .heavy)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.textColor = .label
            return label
        }()
        
        private let createAccountButton:UIButton = {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Create account", for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
            button.backgroundColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            button.layer.masksToBounds = true
            button.tintColor = .systemGreen
            button.layer.cornerRadius = 20
            return button
        }()
        
        private let promptLabel: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.tintColor = .gray
            label.text = "Have an account already?"
            label.font = .systemFont(ofSize: 16, weight: .bold)
            return label
        }()
        
        private let loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Login", for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            button.tintColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            return button
        }()

        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemGreen
            view.addSubview(welcomeLabel)
            view.addSubview(createAccountButton)
            view.addSubview(promptLabel)
            view.addSubview(loginButton)
            view.addSubview(AvatarImageView)
            
            createAccountButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
            loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
            
            configureConstraints()
        }
    
       @objc private func didTapLogin(){
            let vc = LoginViewController()
           navigationController?.pushViewController(vc, animated: true)
       }
        
        @objc private func didTapCreateAccount(){
            let vc = RegistereViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        
        private func configureConstraints(){
           let AvatarImageViewCOnstarints = [
            AvatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            AvatarImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            AvatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
           ]
            
            let welcomelabelConstraints = [
                welcomeLabel.leadingAnchor.constraint(equalTo: AvatarImageView.leadingAnchor, constant: 20),
                welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                welcomeLabel.topAnchor.constraint(equalTo: AvatarImageView.bottomAnchor, constant: 20),
                welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ]
            
            let createAccountButtonConstraints = [
                createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                createAccountButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
                createAccountButton.widthAnchor.constraint(equalTo: welcomeLabel.widthAnchor, constant: -20),
                createAccountButton.heightAnchor.constraint(equalToConstant: 40)
            ]
            
            let promptLabelConstraints = [
                promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                promptLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
            ]
            
            let loginButtonConstraints = [
                loginButton.centerYAnchor.constraint(equalTo: promptLabel.centerYAnchor),
                loginButton.leadingAnchor.constraint(equalTo: promptLabel.trailingAnchor, constant: 10)
            ]
            
            NSLayoutConstraint.activate(welcomelabelConstraints)
            NSLayoutConstraint.activate(createAccountButtonConstraints)
            NSLayoutConstraint.activate(promptLabelConstraints)
            NSLayoutConstraint.activate(loginButtonConstraints)
            NSLayoutConstraint.activate(AvatarImageViewCOnstarints)
        }
    

}
