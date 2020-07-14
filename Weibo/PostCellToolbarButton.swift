//
//  PostCellToolbarButton.swift
//  Weibo
//
//  Created by lwnlwn987 on 2020/7/3.
//  Copyright © 2020 lwn. All rights reserved.
//

import SwiftUI

struct PostCellToolbarButton: View {
    let image: String
    let text: String
    let color: Color
    let action: ()-> Void //闭包
    
    var body: some View {
        Button(action: action){
            HStack(spacing: 5){
                Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                Text(text)
                    .font(.system(size: 15))
            }
        }
        .foregroundColor(color)
    .buttonStyle(BorderlessButtonStyle())
    }
}

struct PostCellToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolbarButton(image: "heart",text: "点赞", color: .red){
            print("点赞")
        }
        
    }
}
