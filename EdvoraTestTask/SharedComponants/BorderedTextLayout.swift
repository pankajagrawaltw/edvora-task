//
//  BorderedTextLayout.swift
//  EdvoraTestTask
//
//  Created by Lokesh Patil on 29/11/21.
//

import SwiftUI

public struct BorderedTextLayout : ViewModifier {
    
    var title : String
    var value : String
    var isValidate: Bool
    var errorMsg: String
    
    public func body(content: Content) -> some View {
        VStack(alignment: .leading){
            content
                .padding(.leading)
                .padding(.vertical, 10)
                .overlay(
                    ZStack(alignment: .topLeading) {
                       RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(value.count > 0 ? Color.primeryColor: Color.grayAccests)
                        
                        HStack(spacing: 0) {
                            Text(title)
                                .font(.caption)
                                .foregroundColor(Color.grayAccests)
                                .padding(.horizontal, 3)
                        }
                        .background(Color.white)
                        .padding(.leading)
                        .animation(.easeIn)
                        .offset( x:  2 , y:  -9 )
                    }
                )
            if  isValidate{
                Text(errorMsg)
                    .font(.caption)
                    .foregroundColor(Color.primeryColor)
                    .fixedSize(horizontal: false, vertical: true)
                    .animation(.linear)
            }
        }
    }
}

extension View {
    func borderedTextLayout(title : String, value : String = "", isValidate:Bool,errorMsg:String) -> some View {
        self.modifier(BorderedTextLayout(title: title , value: value,  isValidate: isValidate, errorMsg: errorMsg))
    }
}
