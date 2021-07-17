//
//  UserService.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/06.
//

import UIKit
import Firebase

typealias FirestoreCompletion = (Error?) -> Void

struct UserService{
    static func fetchUser(completion: @escaping(User) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USER.document(uid).getDocument { snapshot, error in
            
            guard let dict = snapshot?.data() else { return }
            let user = User(dictionary: dict)
            completion(user)
            
        }
    }
    
    
    
    static func fetchUsers(completion: @escaping([User]) -> Void){
        COLLECTION_USER.getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else { return }
            let users = snapshot.documents.map({ User(dictionary:  $0.data())})
            completion(users)
        }
    }
    
    static func followUsesr(uid: String, completions: @escaping(FirestoreCompletion)){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).setData([:]) { error in
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).setData([:], completion: completions)
        }
    }
    
    static func unfollowUer(uid: String, completions: @escaping(FirestoreCompletion)){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).delete{ error in
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).delete(completion: completions)
        }
        
    }
    
    static func checkIfUserIsFollowed(uid: String, completions: @escaping(Bool) -> Void){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).getDocument{ (snapshot, error) in
            guard let isFollowed = snapshot?.exists else { return }
            completions(isFollowed)
        }
    }
    
    static func fetchchUserStats(uid: String, completion: @escaping(UserStats) -> Void){
        COLLECTION_FOLLOWERS.document(uid).collection("user-followers").getDocuments{ (snapshot, _) in
            let followers = snapshot?.documents.count ?? 0
            
            COLLECTION_FOLLOWING.document(uid).collection("user-following").getDocuments{ (shapshot, _) in
                let following = shapshot?.documents.count ?? 0
                completion(UserStats(followers: followers, following: following))
            }
        }
    }
}
