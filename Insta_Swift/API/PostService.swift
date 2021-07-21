//
//  PostService.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/19.
//

import UIKit
import Firebase

struct PostService{
    static func uploadPost(caption: String, image: UIImage, completion: @escaping(FirestoreCompletion)){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        ImageUploader.uploadImage(image: image){ imageUrl in
            let data = ["caption" : caption,
                        "timestamp" : Timestamp(date: Date()),
                        "likes" : 0,
                        "imageUrl" : imageUrl,
                        "ownerUid" : uid] as [String: Any]
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
        }
    }
    
    static func fetchPost(completions: @escaping([Post]) -> Void ){
        COLLECTION_POSTS.getDocuments{ (snapshot, error) in
            guard let data = snapshot?.documents else { return }
            data.forEach{ doc in
                print("DEBUG : \(doc.data())")
            }
        }
    }
}
