//
//  Post.swift
//  Weibo
//
//  Created by lwnlwn987 on 2020/7/2.
//  Copyright © 2020 lwn. All rights reserved.
//

import SwiftUI
//s属于数据模型，看不见的东西
struct PostList: Codable {
    var list: [Post]
}

struct Post: Codable,Identifiable {
    let id: Int
    
    let avatar: String //头像的意思
    let vip: Bool //是否是VIP
    let name: String
    let date: String
    var isFollowed: Bool
    
    let text: String
    let images: [String]
    
    let commentCount: Int
    let likeCount: Int
    let isLiked: Bool
    
     
}
//扩展某一类型添加只读属性
extension Post{
    //计算方法,只读属性
      
      var avatarImage: Image{
          return loadImage(name: avatar)
      }
      
      var commentCountText: String{
          if commentCount <= 0 {return "评论"}
          if commentCount < 1000 {return "\(commentCount)"}
          return String(format: "%.1fk", Double(commentCount)/1000)
      }
      
      var likeCountText: String{
          if likeCount <= 0 {return "点赞"}
          if likeCount < 1000 {return "\(likeCount)"}
          return String(format: "%.1fk", Double(likeCount)/1000)
      }
}

let postList = loadPostListData("PostListData_recommend_1.json")

func loadPostListData(_ filename: String) -> PostList {
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil)else{
        fatalError("没法找到文件名")
    }
    guard let data = try? Data(contentsOf: url) else{
        fatalError("无法加载\(url)")
    }
    guard let list = try? JSONDecoder().decode(PostList.self, from: data)else{
        fatalError("无法解析数据")
    }
    return list
    
    
}
func loadImage(name: String)->Image{
    return Image(uiImage: UIImage(named: name)!)
}
