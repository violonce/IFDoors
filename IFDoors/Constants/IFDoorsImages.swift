//
//  IFDoorsImages.swift
//  IFDoors
//
//  Created by Илья on 24.02.2023.
//

import UIKit

enum IFDoorsImages {
    case empty
    case logo
    case settings
    case homeLogo
    case loadingEllipse
    case lockedEllipse
    case unlockedEllipse
    case loading
    case locked
    case unlocked
    case lockedDoor
    case unlockedDoor
    
    var image: UIImage {
        switch self {
        case .empty: return UIImage()
        case .logo: return UIImage.init(named: "logo")!
        case .settings: return UIImage.init(named: "settings")!
        case .homeLogo: return UIImage.init(named: "homeLogo")!
        case .loadingEllipse: return UIImage.init(named: "loadingEllipse")!
        case .lockedEllipse: return UIImage.init(named: "lockedEllipse")!
        case .unlockedEllipse: return UIImage.init(named: "unlockedEllipse")!
        case .loading: return UIImage.init(named: "loading")!
        case .locked: return UIImage.init(named: "locked")!
        case .unlocked: return UIImage.init(named: "unlocked")!
        case .lockedDoor: return UIImage.init(named: "lockedDoor")!
        case .unlockedDoor: return UIImage.init(named: "unlockedDoor")!
        }
    }
}
