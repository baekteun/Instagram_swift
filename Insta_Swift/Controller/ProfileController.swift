//
//  ProfileController.swift
//  insta
//
//  Created by baegteun on 2021/06/29.
//

import UIKit

private let CellIdentifier = "ProfileCell"
private let HeaderIdentifier = "ProfileHeader"


class ProfileController: UICollectionViewController{
    
    // MARK: - Properties
    
    var user: User?{
        didSet{
            navigationItem.title = user?.username
        }
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        fetchUser()
    }
    
    // MARK: - API
    
    func fetchUser(){
        UserService.fetchUser { user in
            self.user = user
            
        }
    }
    
    // MARK: - Helpers
    
    func configureCollectionView(){
        collectionView.backgroundColor = .white
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: CellIdentifier)
        collectionView.register(ProfileHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderIdentifier)
        
        
    }
}

// MARK: - UICollectionViewDataSource

extension ProfileController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! ProfileCell
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderIdentifier, for: indexPath) as! ProfileHeader
        return header
    }
    
}

// MARK: - UICollectionViewDelegate

extension ProfileController{
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProfileController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
    
    
}
