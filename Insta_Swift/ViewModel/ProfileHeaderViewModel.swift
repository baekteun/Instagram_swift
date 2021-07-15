//
//  ProfileHeaderViewModel.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/11.
//

import UIKit

struct ProfileHeaderViewModel{
    let user: User
    
    
    var fullname: String{
        return user.fullname
    }
    
    var profileImage: URL?{
        return URL(string: user.profileImage)
    }
    
    var follwButtonText: String{
        if user.isCurrentUser{
            return "Edit Profile"
        }
        return user.isFollowed ? "Following" : "Follow"
    }
    
    var followBtnBackgroundColor: UIColor{
        return user.isCurrentUser ? .white : .systemBlue
    }
    var followBtnTextColor: UIColor{
        return user.isCurrentUser ? .black : .white
    }
    
    init(user: User){
        self.user = user
    }
}
