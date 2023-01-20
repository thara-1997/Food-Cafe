//
//  LoginViewController.swift
//  Food  Cafe
//
//  Created by Thathsarani Nayanathara  on 1/20/23.
//

import UIKit

class LoginViewController: UIViewController {
    let firstLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello Again!"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    let greetingLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wellcome back you've been missed"
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    let greetingHolder : UIStackView = {
        let holder = UIStackView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.axis = .vertical
        holder.spacing = 15
        holder.alignment = .center
        return holder
        
    }()
    
    let userNameField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter username"
        textField.backgroundColor = .systemGray6
       // textField.keyboardType = .emailAddress
       // textField.layer.cornerRadius = 10
        return textField
    }()
    
    let passwordField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "password"
       // textField.textContentType = .password
        textField.isSecureTextEntry.toggle()
        textField.backgroundColor = .systemGray6
        return textField
    }()
    
    let recoveryLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recovery password"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .red
        label.textAlignment = .right
        return label
    }()
    
    let signInButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign In", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .red
        return button
    }()
    
    let textFieldHolder : UIStackView = {
        let holder = UIStackView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.axis = .vertical
        holder.spacing = 15
        holder.alignment = .center
        return holder
        
    }()
    
    let continueWithLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Or continue with"
        return label
    }()
    
    let registerLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Not a member? Register now"
        return label
    }()
    
    let googleButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "google"), for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        //button.layer.borderColor = UIColor.black.cgColor
       // button.col
       // button.layer.borderColor
        return button
    }()
    
    let appleButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "apple"), for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
       //button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    let facebookButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "facebook"), for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        //button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    let multipleAuthHolder : UIStackView = {
        let holder = UIStackView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.axis = .horizontal
        holder.spacing = 22
        holder.alignment = .center
        return holder
        
    }()
    
    let bottomHolder : UIStackView = {
        let holder = UIStackView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.axis = .vertical
        holder.spacing = 45
        holder.alignment = .center
        return holder
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        
        greetingHolder.insertArrangedSubview(firstLabel, at: 0)
        greetingHolder.insertArrangedSubview(greetingLabel, at: 1)
        
        textFieldHolder.insertArrangedSubview(userNameField, at: 0)
        textFieldHolder.insertArrangedSubview(passwordField, at: 1)
        textFieldHolder.insertArrangedSubview(recoveryLabel, at: 2)
        textFieldHolder.insertArrangedSubview(signInButton, at: 3)
        
        multipleAuthHolder.insertArrangedSubview(googleButton, at: 0)
        multipleAuthHolder.insertArrangedSubview(appleButton, at: 1)
        multipleAuthHolder.insertArrangedSubview(facebookButton, at: 2)
        
        bottomHolder.insertArrangedSubview(continueWithLabel, at: 0)
        bottomHolder.insertArrangedSubview(multipleAuthHolder, at: 1)
        bottomHolder.insertArrangedSubview(registerLabel, at: 2)

        
        
        
        view.addSubview(greetingHolder)
        view.addSubview(textFieldHolder)
        view.addSubview(bottomHolder)
        setupConstraints()
    }
    
    func setupConstraints() {
        greetingHolder.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        greetingHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        greetingHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70).isActive = true
        
        textFieldHolder.topAnchor.constraint(equalTo: greetingHolder.bottomAnchor, constant: 40).isActive = true
        textFieldHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textFieldHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        userNameField.leadingAnchor.constraint(equalTo: textFieldHolder.leadingAnchor, constant: 20).isActive = true
        userNameField.trailingAnchor.constraint(equalTo: textFieldHolder.trailingAnchor, constant: -20).isActive = true
        userNameField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: textFieldHolder.leadingAnchor, constant: 20).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: textFieldHolder.trailingAnchor, constant: -20).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        recoveryLabel.leadingAnchor.constraint(equalTo: textFieldHolder.leadingAnchor, constant: 20).isActive = true
        recoveryLabel.trailingAnchor.constraint(equalTo: textFieldHolder.trailingAnchor, constant: -20).isActive = true
        

        signInButton.topAnchor.constraint(equalTo: recoveryLabel.bottomAnchor, constant: 90).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: textFieldHolder.leadingAnchor, constant: 20).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: textFieldHolder.trailingAnchor, constant: -20).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        

        bottomHolder.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 40).isActive = true
        bottomHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        bottomHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        multipleAuthHolder.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        googleButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        facebookButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        appleButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    

   
    

}
