//
//  FeedController.swift
//  insta
//
//  Created by baegteun on 2021/06/29.
//

import UIKit
import Firebase

private let reuserIdentifier = "cell"

class FeedController: UICollectionViewController{
    // MARK: - Lifecycle
    
    private var posts = [Post]()
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchPost()
    }
    
    // MARK: - Actions
    
    @objc func handleRefresh(){
        posts.removeAll()
        fetchPost()
    }
    
    @objc func handleLogout(){
        do{
            try Auth.auth().signOut()
            let controller = LoginController()
            controller.delegate = self.tabBarController as? MainTabController
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil )
        } catch {
            print("DEBUG: failed to sign out")
        }
    }
    
    // MARK: - API
    func fetchPost(){
        guard post == nil else { return }
        PostService.fetchPost{ posts in
            self.posts = posts
            self.collectionView.refreshControl?.endRefreshing()
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        collectionView.backgroundColor = .white
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuserIdentifier)
        if post == nil{
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain,
                                                                target: self, action: #selector(handleLogout))
        }
        navigationItem.title = "Feed"
        
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView.refreshControl = refresher
    }
    
}




// MARK: - UICollectionViewDataSource
extension FeedController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post == nil ? posts.count : 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuserIdentifier, for: indexPath) as! FeedCell
        if let post = post {
            cell.viewModel = PostViewModel(post: post)
        }else{
            cell.viewModel = PostViewModel(post: posts[indexPath.row])
        }
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension FeedController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        var height = width + 8 + 40 + 8
        height += 50
        height += 60
        return CGSize(width: width, height: height)
    }
    
}
