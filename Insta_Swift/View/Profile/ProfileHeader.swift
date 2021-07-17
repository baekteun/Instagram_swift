//
//  ProfileHeader.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/06.
//

import UIKit
import SDWebImage


protocol profileHeaderDelegate: class{
    func header(_ profilHeader: ProfileHeader, didTapActionButtonFor user: User)
}

class ProfileHeader:UICollectionReusableView{
    
    // MARK: - Properties
    
    var viewModel: ProfileHeaderViewModel? {
        didSet{ configure()}
    }
    
    weak var delegate: profileHeaderDelegate?
    
    private let profileImageView: UIImageView = {
        let iv =  UIImageView()
        iv.backgroundColor = .lightGray
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Heimerdinger"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    private lazy var editProfileFollowBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Loading", for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleEditProfileFollowTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var postLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let gridButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        return button
    }()
    
    let listButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "list"), for: .normal)
        return button
    }()
    
    let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor,
                                paddingTop: 16, paddingLeft: 12)
        profileImageView.setDimensions(height: 80, width: 80)
        profileImageView.layer.cornerRadius = 80 / 2
        
        addSubview(nameLabel)
        nameLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 12)
        addSubview(editProfileFollowBtn)
        editProfileFollowBtn.anchor(top: nameLabel.bottomAnchor, left: leftAnchor, right: rightAnchor,
                                    paddingTop: 16, paddingLeft: 24, paddingRight: 24)
        
        let stack = UIStackView(arrangedSubviews: [postLabel, followerLabel, followingLabel])
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.centerY(inView: profileImageView)
        stack.anchor(left: profileImageView.rightAnchor, right: rightAnchor,
                     paddingLeft: 12, paddingRight: 12, height: 50)
        
        let topDivider = UIView()
        topDivider.backgroundColor = .lightGray
        
        let bottomDivider = UIView()
        bottomDivider.backgroundColor = .lightGray
        
        let btnStack = UIStackView(arrangedSubviews: [gridButton, listButton, bookmarkButton])
        btnStack.distribution = .fillEqually
        
        
        addSubview(btnStack)
        addSubview(topDivider)
        addSubview(bottomDivider)
        
        btnStack.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 50)
        
        topDivider.anchor(top: btnStack.topAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
        
        bottomDivider.anchor(top: btnStack.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func handleEditProfileFollowTapped(){
        guard let viewModel = viewModel else { return }
        delegate?.header(self, didTapActionButtonFor: viewModel.user)
    }
    
    // MARK: - Helpers
    
    func configure(){
        guard let viewModel = viewModel else { return }
        
        
        nameLabel.text = viewModel.fullname
        profileImageView.sd_setImage(with: viewModel.profileImage)
        
        editProfileFollowBtn.setTitle(viewModel.follwButtonText, for: .normal)
        editProfileFollowBtn.setTitleColor(viewModel.followBtnTextColor, for: .normal)
        editProfileFollowBtn.backgroundColor = viewModel.followBtnBackgroundColor
        
        postLabel.attributedText = viewModel.numberOfPosts
        followerLabel.attributedText = viewModel.numberOfFollowers
        followingLabel.attributedText = viewModel.numberOfFollowing
    }
    
    
    
    
    
}
