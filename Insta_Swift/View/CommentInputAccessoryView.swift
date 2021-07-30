//
//  CommentInputAccessoryView.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/30.
//

import UIKit

class CommentInputAccessoryView: UIView{
    // MARK: - Properties
    
    private let commentTextView: InputTextView = {
        let iv = InputTextView()
        iv.placeholderText = "Enter Comment.."
        iv.font = UIFont.systemFont(ofSize: 15)
        iv.isScrollEnabled = false
        iv.placeholdershouldCenter = true
        return iv
    }()
    
    private let postButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Post", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(handlePostTapped), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        autoresizingMask = .flexibleHeight
        
        addSubview(postButton)
        postButton.anchor(top: topAnchor, right: rightAnchor, paddingRight: 8)
        postButton.setDimensions(height: 50, width: 50)
        
        addSubview(commentTextView)
        commentTextView.anchor(top: topAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: postButton.leftAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8)
        
        let divider = UIView()
        divider.backgroundColor = .lightGray
        addSubview(divider)
        divider.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize{
        return .zero
    }
    
    // MARK: - Actions
    @objc func handlePostTapped(){
        
    }
    
}
