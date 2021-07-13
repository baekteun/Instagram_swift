//
//  UserCellViewModel.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/13.
//

import UIKit

struct UserCellViewModel{
    
    private let user: User
    
    var profileImage: URL?{
        return URL(string: user.profileImage)
    }
    
    var username: String{
        return user.username
    }
    
    var fullname: String{
        return user.fullname
    }
    
    init(user: User){
        self.user = user
    }
}
