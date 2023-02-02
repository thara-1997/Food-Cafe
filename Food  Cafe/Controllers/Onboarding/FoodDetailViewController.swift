//
//  FoodDetailViewController.swift
//  Food  Cafe
//
//  Created by Thathsarani Nayanathara  on 1/29/23.
//

import UIKit
import SwiftUI

class FoodDetailViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.keyboardDismissMode = .onDrag
        return scrollView
    }()
    
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
    
    private var sugarcard : UILabel = {
        let card = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .systemBrown
        card.text = "Hello Kitty"
        card.layer.cornerRadius = 30
        card.layer.masksToBounds = true
        card.layer.cornerCurve = .circular
        card.textAlignment = .center
        return card

    }()
    private var saltcard : UILabel = {
        let card = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .systemYellow
        card.text = "Hello Kitty"
        card.layer.cornerRadius = 30
        card.layer.masksToBounds = true
        card.layer.cornerCurve = .circular
        card.textAlignment = .center
        return card

    }()
    private var fatcard : UILabel = {
        let card = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .systemRed
        card.text = "Hello Kitty"
        card.layer.cornerRadius = 30
        card.layer.masksToBounds = true
        card.layer.cornerCurve = .circular
        card.textAlignment = .center
        return card

    }()
    private var calorycard : UILabel = {
        let card = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .systemBlue
        card.text = "Hello Kitty"
        card.layer.cornerRadius = 30
        card.layer.masksToBounds = true
        card.layer.cornerCurve = .circular
        card.textAlignment = .center
        return card

    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        view.addSubview(AvatarImageView)
        view.addSubview(sugarcard)
        view.addSubview(saltcard)
        view.addSubview(fatcard)
        view.addSubview(calorycard)
        configureConstraints()
        
    }
    
    private func configureConstraints() {
        
        let scrollViewConstraints = [
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
       
        let AvatarImageViewConstarints = [
//            AvatarImageView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
         AvatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
         AvatarImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         AvatarImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ]
        
        let suagrcardConstraints = [
            sugarcard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sugarcard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sugarcard.topAnchor.constraint(equalTo: AvatarImageView.bottomAnchor, constant: 30),
            sugarcard.heightAnchor.constraint(equalToConstant: 100),
            sugarcard.widthAnchor.constraint(equalToConstant: 50),
            sugarcard.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        ]
        
        let saltcardConstraints = [
            saltcard.leadingAnchor.constraint(equalTo: sugarcard.leadingAnchor),
            saltcard.trailingAnchor.constraint(equalTo: sugarcard.trailingAnchor),
            saltcard.topAnchor.constraint(equalTo: sugarcard.bottomAnchor, constant: 20),
            saltcard.heightAnchor.constraint(equalToConstant: 100),
            saltcard.widthAnchor.constraint(equalToConstant: 50),
//            saltcard.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ]
        let fatcardConstraints = [
            fatcard.leadingAnchor.constraint(equalTo: saltcard.leadingAnchor),
            fatcard.trailingAnchor.constraint(equalTo: saltcard.trailingAnchor),
            fatcard.topAnchor.constraint(equalTo: saltcard.bottomAnchor, constant: 20),
            fatcard.heightAnchor.constraint(equalToConstant: 100),
            fatcard.widthAnchor.constraint(equalToConstant: 50),
//            saltcard.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ]
        let calorycardConstraints = [
            calorycard.leadingAnchor.constraint(equalTo: fatcard.leadingAnchor),
            calorycard.trailingAnchor.constraint(equalTo: fatcard.trailingAnchor),
            calorycard.topAnchor.constraint(equalTo: fatcard.bottomAnchor, constant: 20),
            calorycard.heightAnchor.constraint(equalToConstant: 100),
            calorycard.widthAnchor.constraint(equalToConstant: 50),
//            saltcard.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ]
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(AvatarImageViewConstarints)
        NSLayoutConstraint.activate(suagrcardConstraints)
        NSLayoutConstraint.activate(saltcardConstraints)
        NSLayoutConstraint.activate(fatcardConstraints)
        NSLayoutConstraint.activate(calorycardConstraints)
    }

}
