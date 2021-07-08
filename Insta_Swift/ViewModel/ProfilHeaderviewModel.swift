//
//  ProfilHeaderviewModel.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/07.
//

import Foundation

struct ProfileHeaderViewModel {
    let user: User
    
    var fullname: String{
        return user.fullname
    }
    
    var profileImageUrl: URL? {
        
        return URL(string: user.profileImageUrl)
    }
    
    init(user: User){
        self.user = user
    }
}
