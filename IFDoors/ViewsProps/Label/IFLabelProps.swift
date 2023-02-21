//
//  IFLabelProps.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation
import UIKit

public class IFLabelProps: IFViewProps {
    public var text: String?
    public var textAlignment: NSTextAlignment = .left
    public var highlighted: Bool = false
    public var numberOfLines: Int = 0
    
    public override init() {
        super.init()
        self.userInteractionEnabled = false
    }
}
