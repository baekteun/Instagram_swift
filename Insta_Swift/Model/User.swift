//
//  User.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/06.
//

import Foundation
import Firebase

struct User{
    let email: String
    let fullname: String
    let profileImage: String
    let username: String
    let uid: String
    
    var isFollowed = false
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == uid }
    
    init(dictionary: [String: Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.profileImage = dictionary["profileImage"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
