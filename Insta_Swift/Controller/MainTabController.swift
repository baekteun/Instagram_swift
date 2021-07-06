//
//  MainTabController.swift
//  insta
//
//  Created by baegteun on 2021/06/29.
//

import UIKit
import Firebase

class MainTabController: UITabBarController{
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        checkLoggedIn()
        //logout()
        
    }
    
    // MARK: - API
    
    func checkLoggedIn(){
        if Auth.auth().currentUser == nil{
            DispatchQueue.main.async {
                let controller = LoginController()
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil )
            }
        }
    }
    
    func logout(){
        do{
            try Auth.auth().signOut()
        } catch{
            print("DEBUG: Failed to sign out")
        }
    }
    
    //MARK: - Helper
    
    func configureViewControllers(){
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        let feed = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: FeedController(collectionViewLayout: layout))
        let search = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController())
        let imageSelector = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageSelectorController())
        let notification = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "like_unselected"), selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: NotificationController())
        
        let profileLayout = UICollectionViewFlowLayout()
        let profile = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected") , rootViewController: ProfileController(collectionViewLayout: profileLayout))
        
        
        viewControllers = [feed, search, imageSelector, notification, profile]
        
        tabBar.tintColor = .black
    }
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = selectedImage
        nav.navigationBar.tintColor = .black
        
        
        return nav
        
    }
    
}
