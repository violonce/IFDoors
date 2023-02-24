//
//  IFDoorsFonts.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation
import UIKit

struct IFDoorsFonts {
    enum IFDoorsFontsSize :CGFloat {
        case bigSize = 35.0
        case mediumSize = 20.0
        case preMediumSize = 16.0
        case smallSize = 14.0
    }
    
    enum IFDoorsFontsName: String {
        case regular = "Sk-Modernist-Regular"
        case mono = "Sk-Modernist-Mono"
        case bold = "Sk-Modernist-Bold"
    }
    
    public static func font(name: IFDoorsFontsName, size:IFDoorsFontsSize) -> UIFont {
        return UIFont(name: name.rawValue, size: size.rawValue)!
    }
}
