//
//  FeedCell.swift
//  insta
//
//  Created by baegteun on 2021/07/01.
//

import UIKit

class FeedCell: UICollectionViewCell{
    
    
    // MARK: - Properties
    
    var viewModel: PostViewModel?{
        didSet{ configure()}
    }
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = . scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "용조련사 딩거")
        
        return iv
    }()
    
    private lazy var userNameButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Heimer", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(DidTabusername), for: .touchUpInside)
        return button
    }()
    
    private let postImageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = . scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "독극물딩거")
        
        return iv
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system )
        button.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system )
        button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system )
        button.setImage(#imageLiteral(resourceName: "send2"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let likeLabel: UILabel = {
        let label = UILabel()
        label.text = "1 like"
        label.font = UIFont.boldSystemFont(ofSize:  13)
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize:  14)
        return label
    }()
    
    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.systemFont(ofSize:  12)
        label.textColor = .lightGray
        return label
    }()
    

    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor ,left: leftAnchor,
                                paddingTop: 12, paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        addSubview(userNameButton)
        userNameButton.centerY(inView: profileImageView,leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        
        addSubview(postImageView) 
        postImageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        configureActionButtons()
        
        
        
        addSubview(likeLabel)
        likeLabel.anchor(top:likeButton.bottomAnchor,
                            left:leftAnchor, paddingTop: -4, paddingLeft: 8)
        addSubview(captionLabel)
        captionLabel.anchor(top: likeLabel.bottomAnchor,left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        addSubview(postTimeLabel)
        postTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Actions
    
    @objc func DidTabusername(){
        print("DEBUG : Did Tab Username")
    }
    
    // MARK: - Helpers
    
    func configure(){
        guard let viewModel = viewModel else { return }
        captionLabel.text = viewModel.captions
        postImageView.sd_setImage(with: viewModel.imageUrl)
    }
    
    func configureActionButtons(){
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor, width: 120, height: 50)
    }
}
