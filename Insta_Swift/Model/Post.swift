//
//  Post.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/21.
//

import Firebase

struct Post{
    var caption: String
    var likes: Int
    let imageUrl: String
    let ownerUid: String
    let timestamp: Timestamp
    let postID: String
    
    init(postID: String, dictionary: [String : Any]){
        self.caption = dictionary["caption"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
        self.ownerUid = dictionary["ownerUid"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.postID = postID
        
    }
}
