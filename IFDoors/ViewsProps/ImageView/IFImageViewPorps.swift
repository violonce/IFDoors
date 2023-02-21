//
//  IFImageViewPorps.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation
import UIKit

public class IFImageViewProps: IFViewProps {
    public var image: UIImage?
    public override init() {
        super.init()
        self.userInteractionEnabled = false
    }
}
