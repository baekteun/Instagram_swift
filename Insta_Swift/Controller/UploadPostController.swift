//
//  UploadPostController.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/19.
//

import UIKit

class UploadPostController: UIViewController{
    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @objc func didTapCancel(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapDone(){
        print("DEBUG did tap Done")
    }
    //MARK: -Helpers
    func configureUI(){
        view.backgroundColor = .white
        navigationItem.title = "Upload Post"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(didTapDone))
    }
}
