//
//  FoodTableViewCell.swift
//  Food  Cafe
//
//  Created by Thathsarani Nayanathara  on 1/26/23.
//

import UIKit
protocol FoodTableViewCellDelegate: AnyObject{
    func tweetTvaleViewCellDidTapReply()
    func tweetTvaleViewCellDidTapRetweet()
    func tweetTvaleViewCellDidTapLike()
    func tweetTvaleViewCellDidTapShare()
}


class FoodTableViewCell: UITableViewCell {
    static let identifier = "TweetTableViewCell"
    
    weak var delegate: FoodTableViewCellDelegate?
    
    private let actionSpacing: CGFloat = 60
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 30, width: 50, height: 50))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
//        imageView.layer.masksToBounds = true
//        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "food")
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Thathsarani Nayanathara"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@thara"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: . regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private  let tweetTextContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is Mocup tweet. this will be in multiple lines. i belive some text is enough type more........"
        label.numberOfLines = 0
        return label
    }()
    
    private let replyButton: UIButton = {
        let button = UIButton(type:  .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let retweetButton: UIButton = {
        let button = UIButton(type:  .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type:  .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type:  .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(tweetTextContentLabel)
        contentView.addSubview(replyButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        configureConstraints()
        configureButtons()
    }
    
    @objc private func didTapReply(){
        delegate?.tweetTvaleViewCellDidTapReply()
    }
    
    @objc private func didTapRetweet(){
        delegate?.tweetTvaleViewCellDidTapRetweet()
    }
    
    @objc private func didTapLike(){
        delegate?.tweetTvaleViewCellDidTapLike()
    }
    
    @objc private func didTapShare(){
        delegate?.tweetTvaleViewCellDidTapShare()
    }
    
    private func configureButtons () {
        replyButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
    }
    
    private func configureConstraints(){
        
        let avatarImageViewConstraints = [
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            avatarImageView.heightAnchor.constraint(equalToConstant: 200),
            avatarImageView.widthAnchor.constraint(equalToConstant: 200)
            ]
        
        let displayNameLabelConstraints = [
            displayNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            displayNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 5)
        ]
        
        let usernameLabelConstraints = [
            usernameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor, constant: 10),
            usernameLabel.centerYAnchor.constraint(equalTo: displayNameLabel.centerYAnchor)
            
        ]
        
        let tweetTextContentLabelConstraints = [
            tweetTextContentLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            tweetTextContentLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 10),
            tweetTextContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
        ]
        
        let replyButtonConstraints = [
            replyButton.leadingAnchor.constraint(equalTo: tweetTextContentLabel.leadingAnchor),
            replyButton.topAnchor.constraint(equalTo: tweetTextContentLabel.bottomAnchor, constant: 10),
            replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ]
        
        let retweetButtonConstraints = [
            retweetButton.leadingAnchor.constraint(equalTo: replyButton.trailingAnchor, constant:  actionSpacing),
            retweetButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
        ]
        
        let likeButtonConstraints = [
            likeButton.leadingAnchor.constraint(equalTo: retweetButton.trailingAnchor, constant:  actionSpacing),
            likeButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
        ]
        
        let shareButtonConstraints = [
            shareButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant:  actionSpacing),
            shareButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        NSLayoutConstraint.activate(displayNameLabelConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(tweetTextContentLabelConstraints)
        NSLayoutConstraint.activate(replyButtonConstraints)
        NSLayoutConstraint.activate(retweetButtonConstraints)
        NSLayoutConstraint.activate(likeButtonConstraints)
        NSLayoutConstraint.activate(shareButtonConstraints)
    }
       
    
    required init? (coder: NSCoder){
        fatalError()
    }

}
