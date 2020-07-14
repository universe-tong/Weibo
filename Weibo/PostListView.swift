//
//  PostListView.swift
//  Weibo
//
//  Created by lwnlwn987 on 2020/7/3.
//  Copyright © 2020 lwn. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    let category: PostListCategory
    
    var postList: PostList{
        switch category{
        case .recommend: return loadPostListData("PostListData_recommend_1.json")
        case .hot:
            return loadPostListData("PostListData_hot_1.json")
        }
    }
    
    
    var body: some View {
        List{
            //遍历里面的数组，在里面循环
            ForEach(self.postList.list){ post in
                ZStack{
                     PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post: post)){
                        EmptyView()
                    }
                .hidden() //隐藏没有图片微博旁边的小按钮，必须放在Zstack里
                }
                .listRowInsets(EdgeInsets())
                
            }
        }
        
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PostListView(category: .recommend)
            .navigationBarTitle("Title")
            .navigationBarHidden(true)
        }
        
    }
}
