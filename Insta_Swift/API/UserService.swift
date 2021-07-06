//
//  UserService.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/06.
//

import UIKit
import Firebase

struct UserService{
    static func fetchUser(completion: @escaping(User) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USER.document(uid).getDocument { snapshot, error in
            
            guard let dict = snapshot?.data() else { return }
            let user = User(dictionary: dict)
            completion(user)
            
        }
    }
}
