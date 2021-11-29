//
//  SwiftUI-Extensions.swift
//  EdvoraTestTask
//
//  Created by Lokesh Patil on 29/11/21.
//

import Foundation
import SwiftUI

extension Color {
    static let primeryColor : Color = Color("PrimeryColor")
    static let grayAccests : Color = Color("GrayAccets")
}

extension String {
    public var hasWhiteSpace: Bool {
        return self.contains(" ")
    }
}
