//
//  IFDoorsColors.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import UIKit

enum IFDoorsColors {
    case mainBackgroundColor
    case borderColor
    case blackColor
    case textColor
    case descriptionTextColor
    case buttonTitleColorLocked
    case buttonTitleColorUnlocked
    case buttonTitleColorLoading
    
    var color : UIColor {
        switch self {
        case .mainBackgroundColor: return UIColor.colorWithHex(hexString: "#FFFFFF")
        case .borderColor: return UIColor.colorWithHex(hexString: "#E3EAEA")
        case .blackColor: return UIColor.colorWithHex(hexString: "#000000")
        case .textColor: return UIColor.colorWithHex(hexString: "#323755")
        case .descriptionTextColor: return UIColor.colorWithHex(hexString: "#B9B9B9")
        case .buttonTitleColorLocked: return UIColor.colorWithHex(hexString: "#00448B")
        case .buttonTitleColorUnlocked: return UIColor.colorWithHex(hexString: "#00448B").withAlphaComponent(IFDoorsMetrics.alphaMedium.rawValue)
        case .buttonTitleColorLoading: return UIColor.colorWithHex(hexString: "#000000").withAlphaComponent(IFDoorsMetrics.alphaLight.rawValue)
        }
    }
}
