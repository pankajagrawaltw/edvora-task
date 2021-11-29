//
//  ClearTextField.swift
//  EdvoraTestTask
//
//  Created by Lokesh Patil on 29/11/21.
//

import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        HStack {
            content
            
            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "delete.left")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
                .padding(.trailing ,10)
            }
        }
    }
}
