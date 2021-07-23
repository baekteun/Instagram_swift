//
//  PostViewModel.swift
//  Insta_Swift
//
//  Created by baegteun on 2021/07/23.
//

import Foundation
struct PostViewModel{
    private let post: Post
    var imageUrl: URL?{
        return URL(string: post.imageUrl)
    }
    var captions: String{
        return post.caption
    }
    init(post: Post){
        self.post = post
    }
}
