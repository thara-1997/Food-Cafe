//
//  HomeViewController.swift
//  Food  Cafe
//
//  Created by Thathsarani Nayanathara  on 1/25/23.
//

import UIKit
import FirebaseAuth
import Combine

class HomeViewController: UIViewController {

    private var viewModel = HomeViewViewModel()
    private var subscriptions: Set<AnyCancellable> = []
    
    @Published var products: [ProductData] = []
//        @Published var tweet: [Tweet] = []
    
    private func configureNavigationBar(){
        let size:CGFloat = 36
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = UIImage(named: "simplefastfoodicon")
        
        let middleView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        middleView.addSubview(logoImageView)
        
        navigationItem.titleView = middleView
        
//        let profileImage = UIImage(systemName: "person")
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(didTapProfile))
    }
    
    private lazy var addUserButton: UIButton = {
            let button = UIButton(type: .system,primaryAction: UIAction { [weak self] _ in
                self?.navigateToAddUserComposer()
            })
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .twitterBlueColor
            button.tintColor = .white
            let plusSign = UIImage(systemName: "person.crop.circle.badge.plus", withConfiguration: UIImage.SymbolConfiguration (pointSize: 18, weight:  .bold))
            button.setImage(plusSign, for: .normal)
            button.layer.cornerRadius = 30
            button.clipsToBounds = true
            return button
        }()
    
    @objc private func didTapProfile(){
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
//        print("pressed Profile")
    }
    
    private let timelineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FoodTableViewCell.self, forCellReuseIdentifier: FoodTableViewCell.identifier)
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timelineTableView)
//        view.addSubview(addUserButton)
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
        configureNavigationBar()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(didTapSignOut))
        bindViews()
        
    }
    
    @objc private func didTapSignOut(){
       try? Auth.auth().signOut()
        handleAuthentication()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.frame
        configureConstraints()
    }
    
    private func handleAuthentication(){
        if Auth.auth().currentUser == nil {
            let vc = UINavigationController(rootViewController: OnboardingViewController())
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
    
    private func navigateToAddUserComposer(){
            let vc = UINavigationController(rootViewController: ProfileDataFormViewController())
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        handleAuthentication()
        viewModel.retrieveUser()
    }
    
    func completeUserOnboarding(){
        let vc = ProfileDataFormViewController()
        present(vc, animated: true)
    }
    
    func bindViews(){
        viewModel.$user.sink { [weak self] user in
            guard let user = user else { return }
            if !user.isUserOnboarded {
                self?.completeUserOnboarding()
            }
        }
        .store(in: &subscriptions)
        
        viewModel.$products.sink { [weak self] _ in
                    DispatchQueue.main.async {
                        self?.timelineTableView.reloadData()
                    }
                }.store(in: &subscriptions)
    }
    
    private func configureConstraints(){
            
//            let addUserButtonConstraints = [
//                addUserButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
//                addUserButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
//                addUserButton.widthAnchor.constraint(equalToConstant: 60),
//                addUserButton.heightAnchor.constraint(equalToConstant: 60)
//            ]
//
//            NSLayoutConstraint.activate(addUserButtonConstraints)
        }
    
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FoodTableViewCell.identifier, for: indexPath) as? FoodTableViewCell else {
            return UITableViewCell()
        }
        cell.configureProducts(with: viewModel.products[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        let vc = FoodDetailViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        let productData = viewModel.products[indexPath.row]
                let foodDetailViewController = FoodDetailViewController()
                foodDetailViewController.products = productData
                navigationController?.pushViewController(foodDetailViewController, animated: true)
    }
}

extension HomeViewController: FoodTableViewCellDelegate{
    func tweetTvaleViewCellDidTapReply() {
        print("Rely");
    }
    
    func tweetTvaleViewCellDidTapRetweet() {
        print("Retweet")
    }
    
    func tweetTvaleViewCellDidTapLike() {
        print("Like")
    }
    
    func tweetTvaleViewCellDidTapShare() {
        print("Share")
    }
    
}

