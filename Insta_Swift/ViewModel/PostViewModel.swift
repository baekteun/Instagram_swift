//
//  PostViewModel.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/23.
//

import Foundation
struct PostViewModel{
    let post: Post
    var imageUrl: URL?{
        return URL(string: post.imageUrl)
    }
    
    var userProfileImageUrl: URL? {
        return URL(string: post.ownerImageUrl)
    }
    
    var username: String {
        return post.ownerUsername
    }
        
    var captions: String{
        return post.caption
    }
    
    var likes: Int{
        return post.likes
    }
    
    var likesLabelText: String{
        if post.likes != 1 {
            return "\(post.likes) likes"
        }else{
            return "\(post.likes) like"
        }
    }
    
    init(post: Post){
        self.post = post
    }
}
