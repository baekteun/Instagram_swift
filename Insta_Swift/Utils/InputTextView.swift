//
//  InputTextView.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/19.
//

import UIKit

class InputTextView: UITextView {
    // MARK: - Properties
    var placeholderText: String?{
        didSet{ placeholderLabel.text = placeholderText }
    }
    var placeholderLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .lightGray
        
        return lb
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect, textContainer: NSTextContainer?){
        super.init(frame: frame, textContainer: textContainer)
        
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor,left: leftAnchor, paddingTop: 6, paddingLeft: 8)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func handleTextDidChange(){
        placeholderLabel.isHidden = !text.isEmpty
    }
}
