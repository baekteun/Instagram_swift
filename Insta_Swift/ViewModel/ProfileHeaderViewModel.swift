//
//  ProfileHeaderViewModel.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/11.
//

import Foundation

struct ProfileHeaderViewModel{
    let user: User
    
    var fullname: String{
        return user.fullname
    }
    var profileImage: URL?{
        return URL(string: user.profileImage)
    }
    
    init(user: User){
        self.user = user
    }
}
