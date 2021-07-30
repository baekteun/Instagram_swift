//
//  PostService.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/19.
//

import UIKit
import Firebase

struct PostService{
    static func uploadPost(caption: String, image: UIImage,user: User, completion: @escaping(FirestoreCompletion)){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        ImageUploader.uploadImage(image: image){ imageUrl in
            let data = ["caption" : caption,
                        "timestamp" : Timestamp(date: Date()),
                        "likes" : 0,
                        "imageUrl" : imageUrl,
                        "ownerUid" : uid,
                        "ownerImageUrl" : user.profileImage,
                        "ownerUsername" : user.username] as [String: Any]
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
        }
    }
    
    static func fetchPost(completions: @escaping([Post]) -> Void ){
        COLLECTION_POSTS.order(by: "timestamp",descending: true).getDocuments{ (snapshot, error) in
            guard let data = snapshot?.documents else { return }
             
            let posts = data.map({ Post(postID: $0.documentID, dictionary: $0.data())})
            completions(posts)
        }
    }
    
    static func fetchPosts(forUser uid: String,completions: @escaping([Post]) -> Void ){
        let query = COLLECTION_POSTS
            .whereField("ownerUid", isEqualTo: uid)
        
        query.getDocuments { (snapshot, error) in
            guard let data = snapshot?.documents else { return }
             
            var posts = data.map({ Post(postID: $0.documentID, dictionary: $0.data())})
            posts.sort { (post1, post2) -> Bool in
                return post1.timestamp.seconds > post2.timestamp.seconds
            }
            completions(posts)
        }
        
    }
}
