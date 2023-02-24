//
//  IFDoorsFonts.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation
import UIKit

struct IFDoorFonts {
    public static func regularFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Sk-Modernist-Regular", size: size)!
    }
    public static func monoFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Sk-Modernist-Mono", size: size)!
    }
}

enum IFDoorsFontsSizes: CGFloat {
    case bigSize = 32.0
    case mediumSize = 16.0
    case preMediumSize = 14.0
    
//    enum IFDoorsFonts: String {
//        case regular = "Sk-Modernist-Regular"
//        case mono = "Sk-Modernist-Mono"
//        case bold = "Sk-Modernist-Bold"
//    }
//    
//    var font :UIFont {
//        switch self {
//        case .bigSize: {
//            
//        }
//    }
}
